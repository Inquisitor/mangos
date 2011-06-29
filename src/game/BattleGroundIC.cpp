/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Player.h"
#include "BattleGround.h"
#include "BattleGroundIC.h"
#include "Language.h"
#include "WorldPacket.h"
#include "GameObject.h"
#include "ObjectMgr.h"
#include "Vehicle.h"
#include "Transports.h"
#include "Map.h"

BattleGroundIC::BattleGroundIC()
{
    m_BgObjects.resize(MAX_NORMAL_GAMEOBJECTS_SPAWNS + MAX_AIRSHIPS_SPAWNS + MAX_HANGAR_TELEPORTERS_SPAWNS + MAX_FORTRESS_TELEPORTERS_SPAWNS);
    m_BgCreatures.resize(MAX_NORMAL_NPCS_SPAWNS + MAX_WORKSHOP_SPAWNS + MAX_DOCKS_SPAWNS + MAX_SPIRIT_GUIDES_SPAWNS);

    m_StartMessageIds[BG_STARTING_EVENT_FIRST]  = LANG_BG_IC_START_TWO_MINUTES;
    m_StartMessageIds[BG_STARTING_EVENT_SECOND] = LANG_BG_IC_START_ONE_MINUTE;
    m_StartMessageIds[BG_STARTING_EVENT_THIRD]  = LANG_BG_IC_START_HALF_MINUTE;
    m_StartMessageIds[BG_STARTING_EVENT_FOURTH] = LANG_BG_IC_HAS_BEGUN;

    for (uint8 i = 0; i < 2; i++)
        factionReinforcements[i] = MAX_REINFORCEMENTS;

    for (uint8 i = 0; i < BG_IC_MAXDOOR; i++)
        GateStatus[i] = BG_IC_GATE_OK;

    closeFortressDoorsTimer = CLOSE_DOORS_TIME; // the doors are closed again... in a special way
    doorsClosed = false;
    resourceTimer = IC_RESOURCE_TIME;

    for (uint8 i = NODE_TYPE_REFINERY; i < MAX_NODE_TYPES; i++)
        nodePoint[i] =  nodePointInitial[i];

    siegeEngineWorkshopTimer = WORKSHOP_UPDATE_TIME;

    gunshipHorde = NULL;
    gunshipAlliance = NULL;
}

BattleGroundIC::~BattleGroundIC()
{

}

void BattleGroundIC::HandlePlayerResurrect(Player* player)
{
    if (nodePoint[NODE_TYPE_QUARRY].nodeState == (player->GetTeamId() == TEAM_ALLIANCE ? NODE_STATE_CONTROLLED_A : NODE_STATE_CONTROLLED_H))
        player->CastSpell(player, SPELL_QUARRY, true);

    if (nodePoint[NODE_TYPE_REFINERY].nodeState == (player->GetTeamId() == TEAM_ALLIANCE ? NODE_STATE_CONTROLLED_A : NODE_STATE_CONTROLLED_H))
        player->CastSpell(player, SPELL_OIL_REFINERY, true);
}

void BattleGroundIC::SendTransportInit(Player* player)
{
    if (!gunshipAlliance || !gunshipHorde)
        return;

    UpdateData transData;

    gunshipAlliance->BuildCreateUpdateBlockForPlayer(&transData, player);
    gunshipHorde->BuildCreateUpdateBlockForPlayer(&transData, player);

    WorldPacket packet;

    transData.BuildPacket(&packet);
    player->GetSession()->SendPacket(&packet);
}

void BattleGroundIC::DoAction(uint32 action, Player *plr)
{
    if (action != ACTION_TELEPORT_PLAYER_TO_TRANSPORT)
        return;

    if (!plr || !gunshipAlliance || !gunshipHorde)
        return;

    float x, y, z;
    if (plr->GetTeamId() == TEAM_ALLIANCE)
    {
        gunshipAlliance->GetPosition(x, y, z);
        plr->TeleportTo(GetMapId(), x, y, (z + 25.0f), (plr->GetTeamId() == TEAM_ALLIANCE ? gunshipAlliance : gunshipHorde)->GetOrientation(), TELE_TO_NOT_LEAVE_TRANSPORT);
    }
    else
    {
        // This is not the correct way to do this, but it seems that horde gunship has a problem with waypoints that cause unexpected behaviour when following the path.
        plr->TeleportTo(GetMapId(), 660.453003f, -1236.030151f, 288.643402f, 1.6f);
    }
}

void BattleGroundIC::Update(uint32 diff)
{
    BattleGround::Update(diff);
    // m_TeamScores is int32 - so no problems here
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    if (!doorsClosed)
    {
        if (closeFortressDoorsTimer <= diff)
        {
            GetBGObject(BG_IC_GO_DOODAD_ND_HUMAN_GATE_CLOSEDFX_DOOR01)->RemoveFromWorld();
            GetBGObject(BG_IC_GO_DOODAD_ND_WINTERORC_WALL_GATEFX_DOOR01)->RemoveFromWorld();

            GetBGObject(BG_IC_GO_ALLIANCE_GATE_3)->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_DAMAGED); // Alliance door
            GetBGObject(BG_IC_GO_HORDE_GATE_1)->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_DAMAGED);    // Horde door

            doorsClosed = true;
        } else closeFortressDoorsTimer -= diff;
    }

    for (uint8 i = NODE_TYPE_REFINERY; i < MAX_NODE_TYPES; i++)
    {
        if (nodePoint[i].nodeType == NODE_TYPE_DOCKS)
        {
        if (nodePoint[i].nodeState == NODE_STATE_CONTROLLED_A ||
                nodePoint[i].nodeState == NODE_STATE_CONTROLLED_H)
            {
                if (nodePoint[i].timer <= diff)
                {
                    // we need to confirm this, i am not sure if this every 3 minutes
                    for (uint8 u = (nodePoint[i].faction == TEAM_ALLIANCE ? BG_IC_NPC_CATAPULT_1_A : BG_IC_NPC_CATAPULT_1_H); u < (nodePoint[i].faction  == TEAM_ALLIANCE ? BG_IC_NPC_CATAPULT_4_A : BG_IC_NPC_CATAPULT_4_H); u++)
                    {
                        if (Creature* catapult = GetBGCreature(u))
                        {
                            if (!catapult->isAlive())
                                catapult->Respawn();
                        }
                    }

                    // we need to confirm this is blizzlike,not sure if it is every 3 minutes
                    for (uint8 u = (nodePoint[i].faction == TEAM_ALLIANCE ? BG_IC_NPC_GLAIVE_THROWER_1_A : BG_IC_NPC_GLAIVE_THROWER_1_H); u < (nodePoint[i].faction == TEAM_ALLIANCE ? BG_IC_NPC_GLAIVE_THROWER_2_A : BG_IC_NPC_GLAIVE_THROWER_2_H); u++)
                    {
                        if (Creature* glaiveThrower = GetBGCreature(u))
                        {
                            if (!glaiveThrower->isAlive())
                                glaiveThrower->Respawn();
                        }
                    }

                    docksTimer = DOCKS_UPDATE_TIME;
                } else nodePoint[i].timer -= diff;
            }
        }
        if (nodePoint[i].nodeType == NODE_TYPE_WORKSHOP)
        {
            if (nodePoint[i].nodeState == NODE_STATE_CONTROLLED_A ||
                nodePoint[i].nodeState == NODE_STATE_CONTROLLED_H)
            {
                if (siegeEngineWorkshopTimer <= diff)
                {
                    uint8 siegeType = (nodePoint[i].faction == TEAM_ALLIANCE ? BG_IC_NPC_SIEGE_ENGINE_A : BG_IC_NPC_SIEGE_ENGINE_H);

                    if (Creature* siege = GetBGCreature(siegeType)) // this always should be true
                    {
                        if (siege->isAlive())
                        {
                            if (siege->HasFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NOT_SELECTABLE|UNIT_FLAG_UNK_14|UNIT_FLAG_OOC_NOT_ATTACKABLE))
                                // following sniffs the vehicle always has UNIT_FLAG_UNK_14
                                siege->RemoveFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NOT_SELECTABLE|UNIT_FLAG_OOC_NOT_ATTACKABLE);
                            else
                                siege->SetHealth(siege->GetMaxHealth());
                        }
                        else
                            siege->Respawn();
                    }

                    // we need to confirm this, i am not sure if this every 3 minutes
                    for (uint8 u = (nodePoint[i].faction == TEAM_ALLIANCE ? BG_IC_NPC_DEMOLISHER_1_A : BG_IC_NPC_DEMOLISHER_1_H); u < (nodePoint[i].faction == TEAM_ALLIANCE ? BG_IC_NPC_DEMOLISHER_4_A : BG_IC_NPC_DEMOLISHER_4_H); u++)
                    {
                        if (Creature* demolisher = GetBGCreature(u))
                        {
                            if (!demolisher->isAlive())
                                demolisher->Respawn();
                        }
                    }
                    siegeEngineWorkshopTimer = WORKSHOP_UPDATE_TIME;
                } else siegeEngineWorkshopTimer -= diff;
            }
        }

        // the point is waiting for a change on his banner
        if (nodePoint[i].needChange)
        {
            if (nodePoint[i].timer <= diff)
            {
                uint32 nextBanner = GetNextBanner(&nodePoint[i],nodePoint[i].faction,true);

                nodePoint[i].last_entry = nodePoint[i].gameobject_entry;
                nodePoint[i].gameobject_entry = nextBanner;
                // nodePoint[i].faction = the faction should be the same one...

                GameObject* banner = GetBGObject(nodePoint[i].gameobject_type);

                if (!banner) // this should never happen
                    return;

                float cords[4] = {banner->GetPositionX(), banner->GetPositionY(), banner->GetPositionZ(), banner->GetOrientation() };

                DelObject(nodePoint[i].gameobject_type);
                AddObject(nodePoint[i].gameobject_type,nodePoint[i].gameobject_entry,cords[0],cords[1],cords[2],cords[3],0,0,0,0,RESPAWN_ONE_DAY);
                SpawnBGObject(m_BgObjects[nodePoint[i].gameobject_type], RESPAWN_IMMEDIATELY);

                GetBGObject(nodePoint[i].gameobject_type)->SetUInt32Value(GAMEOBJECT_FACTION, nodePoint[i].faction == TEAM_ALLIANCE ? BG_IC_Factions[1] : BG_IC_Factions[0]);

                UpdateNodeWorldState(&nodePoint[i]);
                HandleCapturedNodes(&nodePoint[i],false);

                SendMessage2ToAll(LANG_BG_IC_TEAM_HAS_TAKEN_NODE,(nodePoint[i].faction == TEAM_ALLIANCE ? CHAT_MSG_BG_SYSTEM_ALLIANCE : CHAT_MSG_BG_SYSTEM_HORDE),NULL,(nodePoint[i].faction == TEAM_ALLIANCE ? LANG_BG_IC_ALLIANCE : LANG_BG_IC_HORDE),nodePoint[i].string);
                PlaySoundToAll(nodePoint[i].faction == TEAM_ALLIANCE ? BG_IC_SOUND_FLAG_CAPTURED_ALLIANCE : BG_IC_SOUND_FLAG_CAPTURED_HORDE);
                nodePoint[i].needChange = false;
                nodePoint[i].timer = BANNER_STATE_CHANGE_TIME;
            } else nodePoint[i].timer -= diff;
        }
    }

    if (resourceTimer <= diff)
    {
        for (uint8 i = 0; i < NODE_TYPE_DOCKS; i++)
        {
            if (nodePoint[i].nodeState == NODE_STATE_CONTROLLED_A ||
                nodePoint[i].nodeState == NODE_STATE_CONTROLLED_H)
            {
                factionReinforcements[nodePoint[i].faction] += 1;
                RewardHonorToTeam(RESOURCE_HONOR_AMOUNT,nodePoint[i].faction == TEAM_ALLIANCE ? ALLIANCE : HORDE);
                UpdateWorldState((nodePoint[i].faction == TEAM_ALLIANCE ? BG_IC_ALLIANCE_RENFORT : BG_IC_HORDE_RENFORT), factionReinforcements[nodePoint[i].faction]);
            }
        }
        resourceTimer = IC_RESOURCE_TIME;
    } else resourceTimer -= diff;

    HandleParachutes();
}

void BattleGroundIC::StartingEventCloseDoors()
{
    // Show Full Gate Displays
    GetBGObject(BG_IC_GO_ALLIANCE_GATE_1)->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_DAMAGED); // Alliance door
    GetBGObject(BG_IC_GO_ALLIANCE_GATE_2)->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_DAMAGED); // Alliance door
    GetBGObject(BG_IC_GO_HORDE_GATE_2)->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_DAMAGED); // Horde door
    GetBGObject(BG_IC_GO_HORDE_GATE_3)->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_DAMAGED); // Horde door
}

void BattleGroundIC::StartingEventOpenDoors()
{
    //after 20 seconds they should be despawned
    DoorOpen(m_BgObjects[BG_IC_GO_DOODAD_ND_HUMAN_GATE_CLOSEDFX_DOOR01]);
    DoorOpen(m_BgObjects[BG_IC_GO_DOODAD_ND_WINTERORC_WALL_GATEFX_DOOR01]);

    DoorOpen(m_BgObjects[BG_IC_GO_DOODAD_HU_PORTCULLIS01_1]);
    DoorOpen(m_BgObjects[BG_IC_GO_DOODAD_HU_PORTCULLIS01_2]);
    DoorOpen(m_BgObjects[BG_IC_GO_DOODAD_VR_PORTCULLIS01_1]);
    DoorOpen(m_BgObjects[BG_IC_GO_DOODAD_VR_PORTCULLIS01_2]);

    for (uint8 i = 0; i < MAX_FORTRESS_TELEPORTERS_SPAWNS; i++)
    {
        if (!AddObject(BG_IC_Teleporters[i].type,BG_IC_Teleporters[i].entry,
            BG_IC_Teleporters[i].x,BG_IC_Teleporters[i].y,
            BG_IC_Teleporters[i].z,BG_IC_Teleporters[i].o,
            0,0,0,0,RESPAWN_ONE_DAY))
            sLog.outError("Isle of Conquest | Starting Event Open Doors: There was an error spawning gameobject %u",BG_IC_Teleporters[i].entry);
        else
            SpawnBGObject(m_BgObjects[BG_IC_Teleporters[i].type], RESPAWN_IMMEDIATELY);
    }
    for (uint8 i = 0; i < MAX_NORMAL_NPCS_SPAWNS; i++)
    {
        if (!AddCreature(BG_IC_NpcSpawnlocs[i].entry,BG_IC_NpcSpawnlocs[i].type,BG_IC_NpcSpawnlocs[i].team,
            BG_IC_NpcSpawnlocs[i].x,BG_IC_NpcSpawnlocs[i].y,
            BG_IC_NpcSpawnlocs[i].z,BG_IC_NpcSpawnlocs[i].o,
            RESPAWN_ONE_DAY))
            sLog.outError("Isle of Conquest: There was an error spawning creature %u",BG_IC_NpcSpawnlocs[i].entry);
        else
            SpawnBGCreature(m_BgCreatures[i], RESPAWN_IMMEDIATELY);
    }
    // setting correct factions for Keep Cannons
    for (uint8 i = BG_IC_NPC_KEEP_CANNON_1; i < BG_IC_NPC_KEEP_CANNON_12; i++)
        GetBGCreature(i)->setFaction(BG_IC_Factions[0]);
    for (uint8 i = BG_IC_NPC_KEEP_CANNON_13; i < BG_IC_NPC_KEEP_CANNON_25; i++)
        GetBGCreature(i)->setFaction(BG_IC_Factions[1]);
}

bool BattleGroundIC::IsAllNodesConrolledByTeam(uint32 team) const
{
    uint32 count = 0;
    ICNodeState controlledState = team == ALLIANCE ? NODE_STATE_CONTROLLED_A : NODE_STATE_CONTROLLED_H;
    for (int i = 0; i < NODE_TYPE_WORKSHOP; ++i)
    {
        if (nodePoint[i].nodeState == controlledState)
            count++;
    }

    return count == NODE_TYPE_WORKSHOP;
}

void BattleGroundIC::AddPlayer(Player *plr)
{
    BattleGround::AddPlayer(plr);
    //create score and add it to map, default values are set in constructor
    BattleGroundICScore* sc = new BattleGroundICScore;

    m_PlayerScores[plr->GetGUID()] = sc;

    if (nodePoint[NODE_TYPE_QUARRY].nodeState == (plr->GetTeamId() == TEAM_ALLIANCE ? NODE_STATE_CONTROLLED_A : NODE_STATE_CONTROLLED_H))
        plr->CastSpell(plr, SPELL_QUARRY, true);

    if (nodePoint[NODE_TYPE_REFINERY].nodeState == (plr->GetTeamId() == TEAM_ALLIANCE ? NODE_STATE_CONTROLLED_A : NODE_STATE_CONTROLLED_H))
        plr->CastSpell(plr, SPELL_OIL_REFINERY, true);

    SendTransportInit(plr);
}

void BattleGroundIC::RemovePlayer(Player* plr, uint64 /*guid*/)
{
    plr->RemoveAurasDueToSpell(SPELL_QUARRY);
    plr->RemoveAurasDueToSpell(SPELL_OIL_REFINERY);
}

void BattleGroundIC::HandleAreaTrigger(Player * /*Source*/, uint32 /*Trigger*/)
{
    // this is wrong way to implement these things. On official it done by gameobject spell cast.
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
}

void BattleGroundIC::UpdatePlayerScore(Player* Source, uint32 type, uint32 value, bool doAddHonor)
{
    std::map<ObjectGuid, BattleGroundScore*>::iterator itr = m_PlayerScores.find(Source->GetObjectGuid());

    if (itr == m_PlayerScores.end())                         // player not found...
        return;

    switch(type)
    {
        case SCORE_BASES_ASSAULTED:
            ((BattleGroundICScore*)itr->second)->BasesAssaulted += value;
            break;
        case SCORE_BASES_DEFENDED:
            ((BattleGroundICScore*)itr->second)->BasesDefended += value;
            break;
        default:
            BattleGround::UpdatePlayerScore(Source, type, value /*, doAddHonor */);
            break;
    }
}

void BattleGroundIC::FillInitialWorldStates(WorldPacket& data, uint32& count)
{

    FillInitialWorldState(data, count, uint32(BG_IC_ALLIANCE_RENFORT_SET), uint32(1));
    FillInitialWorldState(data, count, uint32(BG_IC_HORDE_RENFORT_SET), uint32(1));
    FillInitialWorldState(data, count, uint32(BG_IC_ALLIANCE_RENFORT), uint32(factionReinforcements[TEAM_ALLIANCE]));
    FillInitialWorldState(data, count, uint32(BG_IC_HORDE_RENFORT), uint32(factionReinforcements[TEAM_HORDE]));

    for (uint8 i = 0; i < MAX_FORTRESS_GATES_SPAWNS; i++)
    {
        uint32 uws = GetWorldStateFromGateEntry(BG_IC_ObjSpawnlocs[i].entry,(GateStatus[GetGateIDFromEntry(BG_IC_ObjSpawnlocs[i].entry)] == BG_IC_GATE_DESTROYED ? true : false));
        FillInitialWorldState(data, count, uint32(uws), uint32(1));
    }

    for (uint8 i = 0 ; i < MAX_NODE_TYPES ; i++)
        FillInitialWorldState(data, count, uint32(nodePoint[i].worldStates[nodePoint[i].nodeState]), uint32(1));
}

bool BattleGroundIC::SetupBattleGround()
{
    for (uint8 i = 0; i < MAX_NORMAL_GAMEOBJECTS_SPAWNS; i++)
    {
        if (!AddObject(BG_IC_ObjSpawnlocs[i].type,BG_IC_ObjSpawnlocs[i].entry,
            BG_IC_ObjSpawnlocs[i].x,BG_IC_ObjSpawnlocs[i].y,
            BG_IC_ObjSpawnlocs[i].z,BG_IC_ObjSpawnlocs[i].o,
            0,0,0,0,RESPAWN_ONE_DAY))
        {
            sLog.outError("Isle of Conquest: There was an error spawning gameobject %u",BG_IC_ObjSpawnlocs[i].entry);
            return false;
        }
        else
            SpawnBGObject(m_BgObjects[BG_IC_ObjSpawnlocs[i].type], RESPAWN_IMMEDIATELY);
    }
    if (!AddSpiritGuide(BG_IC_NPC_SPIRIT_GUIDE_1+5,BG_IC_SpiritGuidePos[5][0], BG_IC_SpiritGuidePos[5][1],BG_IC_SpiritGuidePos[5][2], BG_IC_SpiritGuidePos[5][3],ALLIANCE)
        || !AddSpiritGuide(BG_IC_NPC_SPIRIT_GUIDE_1+6,BG_IC_SpiritGuidePos[6][0], BG_IC_SpiritGuidePos[6][1],BG_IC_SpiritGuidePos[6][2], BG_IC_SpiritGuidePos[6][3],HORDE)
        || !AddSpiritGuide(BG_IC_NPC_SPIRIT_GUIDE_1+3,BG_IC_SpiritGuidePos[7][0], BG_IC_SpiritGuidePos[7][1],BG_IC_SpiritGuidePos[7][2], BG_IC_SpiritGuidePos[7][3],ALLIANCE)
        || !AddSpiritGuide(BG_IC_NPC_SPIRIT_GUIDE_1+4,BG_IC_SpiritGuidePos[8][0], BG_IC_SpiritGuidePos[8][1],BG_IC_SpiritGuidePos[8][2], BG_IC_SpiritGuidePos[8][3],HORDE))
    {
        sLog.outError("Isle of Conquest: Failed to spawn initial spirit guide!");
        return false;
    }

    gunshipHorde = CreateTransport(GO_HORDE_GUNSHIP,TRANSPORT_PERIOD_TIME);
    gunshipAlliance = CreateTransport(GO_ALLIANCE_GUNSHIP,TRANSPORT_PERIOD_TIME);

    if (!gunshipAlliance || !gunshipHorde)
    {
        sLog.outError("Isle of Conquest: There was an error creating gunships!");
        return false;
    }

    //Send transport init packet to all player in map
    for (BattleGroundPlayerMap::const_iterator itr = GetPlayers().begin(); itr != GetPlayers().end();itr++)
    {
        if (Player* player = sObjectMgr.GetPlayer(itr->first))
            SendTransportInit(player);
    }

    // correcting spawn time for keeps bombs
    for (uint8 i = BG_IC_GO_HUGE_SEAFORIUM_BOMBS_A_1; i < BG_IC_GO_HUGE_SEAFORIUM_BOMBS_H_4; i++)
        GetBGObject(i)->SetRespawnTime(10);

    return true;
}

void BattleGroundIC::HandleKillUnit(Creature *unit, Player* killer)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
       return;

    uint32 entry = unit->GetEntry();
    if (entry == NPC_HIGH_COMMANDER_HALFORD_WYRMBANE)
    {
        RewardHonorToTeam(WINNER_HONOR_AMOUNT,HORDE);
        EndBattleGround(HORDE);
        SendMessage2ToAll(LANG_BG_IC_BOSS_HORDE_DEAD, CHAT_MSG_BG_SYSTEM_HORDE ,NULL, LANG_BG_IC_HORDE);
    }
    else if (entry == NPC_OVERLORD_AGMAR)
    {
        RewardHonorToTeam(WINNER_HONOR_AMOUNT,ALLIANCE);
        EndBattleGround(ALLIANCE);
        SendMessage2ToAll(LANG_BG_IC_BOSS_ALLY_DEAD, CHAT_MSG_BG_SYSTEM_ALLIANCE ,NULL, LANG_BG_IC_ALLIANCE);
    }

    //Achievement Mowed Down
    // TO-DO: This should be done on the script of each vehicle of the BG.
    if (unit->GetVehicleKit())
        killer->CastSpell(killer, SPELL_DESTROYED_VEHICLE_ACHIEVEMENT, true);
}

void BattleGroundIC::HandleKillPlayer(Player* player, Player* killer)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    if(player->GetItemByEntry(47030))
        player->DestroyItemCount(47030, 1, true);

    BattleGround::HandleKillPlayer(player, killer);

    factionReinforcements[player->GetTeamId()] -= 1;

    UpdateWorldState((player->GetTeamId() == TEAM_ALLIANCE ? BG_IC_ALLIANCE_RENFORT : BG_IC_HORDE_RENFORT), factionReinforcements[player->GetTeamId()]);

    // we must end the BattleGround
    if (factionReinforcements[player->GetTeamId()] < 1)
        EndBattleGround(killer->GetTeam());
}

void BattleGroundIC::EndBattleGround(uint32 winner)
{
    SendMessage2ToAll(LANG_BG_IC_TEAM_WINS,CHAT_MSG_BG_SYSTEM_NEUTRAL,NULL, (winner == ALLIANCE ? LANG_BG_IC_ALLIANCE : LANG_BG_IC_HORDE));

    BattleGround::EndBattleGround(Team(winner));
}

void BattleGroundIC::RealocatePlayers(ICNodePointType nodeType)
{
    // Those who are waiting to resurrect at this node are taken to the closest own node's graveyard
    /*std::vector<uint64> ghost_list = m_ReviveQueue[BG_IC_NPC_SPIRIT_GUIDE_1 + nodeType - 2];
    if (!ghost_list.empty())
    {
        WorldSafeLocsEntry const *ClosestGrave = NULL;
        for (std::vector<uint64>::const_iterator itr = ghost_list.begin(); itr != ghost_list.end(); ++itr)
         {
            Player* plr = sObjectMgr.GetPlayer(*itr);
            if (!plr)
                continue;

            if (!ClosestGrave)                              // cache
                ClosestGrave = GetClosestGraveYard(plr);

            if (ClosestGrave)
                plr->TeleportTo(GetMapId(), ClosestGrave->x, ClosestGrave->y, ClosestGrave->z, plr->GetOrientation());
        }
    }*/
}

void BattleGroundIC::EventPlayerClickedOnFlag(Player* player, GameObject* target_obj)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    BattleGroundTeamIndex teamIndex = GetTeamIndexByTeamId(player->GetTeam());
    uint32 sound = 0;

    // All the node points are iterated to find the clicked one
    for (uint8 i = 0; i < MAX_NODE_TYPES; i++)
    {
        if (nodePoint[i].gameobject_entry == target_obj->GetEntry())
        {
            // THIS SHOULD NEEVEER HAPPEN
            if (nodePoint[i].faction == player->GetTeamId())
                return;

            uint32 nextBanner = GetNextBanner(&nodePoint[i],player->GetTeamId(),false);

            // we set the new settings of the nodePoint
            nodePoint[i].faction = player->GetTeamId();
            nodePoint[i].last_entry = nodePoint[i].gameobject_entry;
            nodePoint[i].gameobject_entry = nextBanner;

            // this is just needed if the next banner is grey
            if (nodePoint[i].banners[BANNER_A_CONTESTED] == nextBanner ||
                nodePoint[i].banners[BANNER_H_CONTESTED] == nextBanner)
            {
                nodePoint[i].timer = BANNER_STATE_CHANGE_TIME; // 1 minute for last change (real faction banner)
                nodePoint[i].needChange = true;

                RealocatePlayers(nodePoint[i].nodeType);

                // if we are here means that the point has been lost, or it is the first capture

                if (nodePoint[i].nodeType != NODE_TYPE_REFINERY && nodePoint[i].nodeType != NODE_TYPE_QUARRY)
                    if (!m_BgCreatures[BG_IC_NPC_SPIRIT_GUIDE_1+(nodePoint[i].nodeType)-2].IsEmpty())
                        DelCreature(BG_IC_NPC_SPIRIT_GUIDE_1+(nodePoint[i].nodeType)-2);

                UpdatePlayerScore(player, SCORE_BASES_ASSAULTED, 1);

                SendMessage2ToAll(LANG_BG_IC_TEAM_ASSAULTED_NODE_1,(player->GetTeamId() == TEAM_ALLIANCE ? CHAT_MSG_BG_SYSTEM_ALLIANCE : CHAT_MSG_BG_SYSTEM_HORDE),player,nodePoint[i].string);
                sound = (teamIndex == BG_TEAM_ALLIANCE) ? BG_IC_SOUND_FLAG_ASSAULTED_ALLIANCE : BG_IC_SOUND_FLAG_ASSAULTED_HORDE;
                HandleContestedNodes(&nodePoint[i]);
            } else if (nextBanner == nodePoint[i].banners[BANNER_A_CONTROLLED] ||
                       nextBanner == nodePoint[i].banners[BANNER_H_CONTROLLED])
                       // if we are going to spawn the definitve faction banner, we dont need the timer anymore
            {
                nodePoint[i].timer = BANNER_STATE_CHANGE_TIME;
                nodePoint[i].needChange = false;
                SendMessage2ToAll(LANG_BG_IC_TEAM_DEFENDED_NODE,(player->GetTeamId() == TEAM_ALLIANCE ? CHAT_MSG_BG_SYSTEM_ALLIANCE : CHAT_MSG_BG_SYSTEM_HORDE),player,nodePoint[i].string);
                HandleCapturedNodes(&nodePoint[i],true);
                UpdatePlayerScore(player, SCORE_BASES_DEFENDED, 1);
                sound = (teamIndex == BG_TEAM_ALLIANCE) ? BG_IC_SOUND_FLAG_ASSAULTED_ALLIANCE : BG_IC_SOUND_FLAG_ASSAULTED_HORDE;
            }

            GameObject* banner = GetBGObject(nodePoint[i].gameobject_type);

            if (!banner) // this should never happen
                return;

            float cords[4] = {banner->GetPositionX(), banner->GetPositionY(), banner->GetPositionZ(), banner->GetOrientation() };

            DelObject(nodePoint[i].gameobject_type);
            AddObject(nodePoint[i].gameobject_type,nodePoint[i].gameobject_entry,cords[0],cords[1],cords[2],cords[3],0,0,0,0,RESPAWN_ONE_DAY);
            SpawnBGObject(m_BgObjects[nodePoint[i].gameobject_type], RESPAWN_IMMEDIATELY);

            GetBGObject(nodePoint[i].gameobject_type)->SetUInt32Value(GAMEOBJECT_FACTION, nodePoint[i].faction == TEAM_ALLIANCE ? BG_IC_Factions[1] : BG_IC_Factions[0]);

            if (nodePoint[i].nodeType == NODE_TYPE_WORKSHOP)
            {
                DelObject(BG_IC_GO_SEAFORIUM_BOMBS_1);
                DelObject(BG_IC_GO_SEAFORIUM_BOMBS_2);
            }

            PlaySoundToAll(sound);
            UpdateNodeWorldState(&nodePoint[i]);
            // we dont need iterating if we are here
            // If the needChange bool was set true, we will handle the rest in the Update Map function.
            return;
        }
    }
}

void BattleGroundIC::UpdateNodeWorldState(ICNodePoint* nodePoint)
{
    //updating worldstate
    if (nodePoint->gameobject_entry == nodePoint->banners[BANNER_A_CONTROLLED])
        nodePoint->nodeState = NODE_STATE_CONTROLLED_A;
    else if (nodePoint->gameobject_entry == nodePoint->banners[BANNER_A_CONTESTED])
        nodePoint->nodeState = NODE_STATE_CONFLICT_A;
    else if (nodePoint->gameobject_entry == nodePoint->banners[BANNER_H_CONTROLLED])
        nodePoint->nodeState = NODE_STATE_CONTROLLED_H;
    else if (nodePoint->gameobject_entry == nodePoint->banners[BANNER_H_CONTESTED])
        nodePoint->nodeState = NODE_STATE_CONFLICT_H;

    uint32 worldstate = nodePoint->worldStates[nodePoint->nodeState];

    // with this we are sure we dont bug the client
    for (uint8 i = 0; i < 4; i++)
        UpdateWorldState(nodePoint->worldStates[i],0);

    UpdateWorldState(worldstate,1);
}

uint32 BattleGroundIC::GetNextBanner(ICNodePoint* nodePoint, uint32 team, bool returnDefinitve)
{
    // this is only used in the update map function
    if (returnDefinitve)
        // here is a special case, here we must return the definitve faction banner after the grey banner was spawned 1 minute
        return nodePoint->banners[(team == TEAM_ALLIANCE ? BANNER_A_CONTROLLED : BANNER_H_CONTROLLED)];

    // there were no changes, this point has never been captured by any faction or at least clicked
    if (nodePoint->last_entry == 0)
        // 1 returns the CONTESTED ALLIANCE BANNER, 3 returns the HORDE one
        return nodePoint->banners[(team == TEAM_ALLIANCE ? BANNER_A_CONTESTED : BANNER_H_CONTESTED)];

    // If the actual banner is the definitive faction banner, we must return the grey banner of the player's faction
    if (nodePoint->gameobject_entry == nodePoint->banners[BANNER_A_CONTROLLED] || nodePoint->gameobject_entry == nodePoint->banners[BANNER_H_CONTROLLED])
        return nodePoint->banners[(team == TEAM_ALLIANCE ? BANNER_A_CONTESTED : BANNER_H_CONTESTED)];

    // If the actual banner is the grey faction banner, we must return the previous banner
    if (nodePoint->gameobject_entry == nodePoint->banners[BANNER_A_CONTESTED] || nodePoint->banners[BANNER_H_CONTESTED])
        return nodePoint->last_entry;

    // we should never be here...
    sLog.outError("Isle Of Conquest: Unexpected return in GetNextBanner function");
    return 0;
}

void BattleGroundIC::HandleContestedNodes(ICNodePoint* nodePoint)
{
    if (nodePoint->nodeType == NODE_TYPE_HANGAR)
    {
        if (gunshipAlliance && gunshipHorde)
            (nodePoint->faction == TEAM_ALLIANCE ? gunshipHorde : gunshipAlliance)->BuildMovementPacket(GetBgMap(), false);

        for (uint8 u = BG_IC_GO_HANGAR_TELEPORTER_1; u < BG_IC_GO_HANGAR_TELEPORTER_3; u++)
            DelObject(u);
    }
}

void BattleGroundIC::HandleCapturedNodes(ICNodePoint* nodePoint, bool recapture)
{
    if(nodePoint->nodeType != NODE_TYPE_REFINERY && nodePoint->nodeType != NODE_TYPE_QUARRY)
    {
        if (!AddSpiritGuide(BG_IC_NPC_SPIRIT_GUIDE_1+nodePoint->nodeType-2,
            BG_IC_SpiritGuidePos[nodePoint->nodeType][0], BG_IC_SpiritGuidePos[nodePoint->nodeType][1],
            BG_IC_SpiritGuidePos[nodePoint->nodeType][2], BG_IC_SpiritGuidePos[nodePoint->nodeType][3],
            (nodePoint->faction == TEAM_ALLIANCE ? ALLIANCE : HORDE)))
            sLog.outError("Isle of Conquest: Failed to spawn spirit guide! point: %u, team: %u,", nodePoint->nodeType, nodePoint->faction);
    }
    switch(nodePoint->gameobject_type)
    {
    case BG_IC_GO_HANGAR_BANNER:
        // all the players on the stopped transport should be teleported out
        if (!gunshipAlliance || !gunshipHorde)
            break;

        for (uint8 u = 0; u < MAX_HANGAR_TELEPORTERS_SPAWNS; u++)
        {
            uint8 type = BG_IC_GO_HANGAR_TELEPORTER_1+u;
            AddObject(type, (nodePoint->faction == TEAM_ALLIANCE ? GO_ALLIANCE_GUNSHIP_PORTAL : GO_HORDE_GUNSHIP_PORTAL),
                BG_IC_HangarTeleporters[u][0], BG_IC_HangarTeleporters[u][1],
                BG_IC_HangarTeleporters[u][2], BG_IC_HangarTeleporters[u][3],
                0,0,0,0,RESPAWN_ONE_DAY);
            SpawnBGObject(m_BgObjects[type], RESPAWN_IMMEDIATELY);
        }

        (nodePoint->faction == TEAM_ALLIANCE ? gunshipAlliance : gunshipHorde)->BuildMovementPacket(GetBgMap(), true);
        (nodePoint->faction == TEAM_ALLIANCE ? gunshipHorde : gunshipAlliance)->BuildMovementPacket(GetBgMap(), false);
        // we should spawn teleporters
        break;
    case BG_IC_GO_QUARRY_BANNER:
        RemoveAuraOnTeam(SPELL_QUARRY,(nodePoint->faction == TEAM_ALLIANCE ? HORDE : ALLIANCE));
        CastSpellOnTeam(SPELL_QUARRY,(nodePoint->faction == TEAM_ALLIANCE ? ALLIANCE : HORDE));
        break;
    case BG_IC_GO_REFINERY_BANNER:
        RemoveAuraOnTeam(SPELL_OIL_REFINERY,(nodePoint->faction == TEAM_ALLIANCE ? HORDE : ALLIANCE));
        CastSpellOnTeam(SPELL_OIL_REFINERY,(nodePoint->faction == TEAM_ALLIANCE ? ALLIANCE : HORDE));
        break;
    case BG_IC_GO_DOCKS_BANNER:

        if (recapture)
            break;

        if (docksTimer < DOCKS_UPDATE_TIME)
            docksTimer = DOCKS_UPDATE_TIME;

        // we must del opposing faction vehicles when the node is captured (unused ones)
        for (uint8 i = (nodePoint->faction == TEAM_ALLIANCE ? BG_IC_NPC_GLAIVE_THROWER_1_H : BG_IC_NPC_GLAIVE_THROWER_1_A); i < (nodePoint->faction == TEAM_ALLIANCE ? BG_IC_NPC_GLAIVE_THROWER_2_H : BG_IC_NPC_GLAIVE_THROWER_2_A); i++)
        {
            if (Creature* glaiveThrower = GetBGCreature(i))
            {
                if (VehicleKit* vehicleGlaive = glaiveThrower->GetVehicleKit())
                {
                    if (!vehicleGlaive->GetPassenger(0))
                        DelCreature(i);
                }
            }
        }

        for (uint8 i = (nodePoint->faction == TEAM_ALLIANCE ? BG_IC_NPC_CATAPULT_1_H : BG_IC_NPC_CATAPULT_1_A); i < (nodePoint->faction == TEAM_ALLIANCE ? BG_IC_NPC_CATAPULT_4_H  : BG_IC_NPC_CATAPULT_4_A); i++)
        {
            if (Creature* catapult = GetBGCreature(i))
            {
                if (VehicleKit* vehicleGlaive = catapult->GetVehicleKit())
                {
                    if (!vehicleGlaive->GetPassenger(0))
                        DelCreature(i);
                }
            }
        }

        // spawning glaive throwers
        for (uint8 i = 0; i < MAX_GLAIVE_THROWERS_SPAWNS_PER_FACTION; i++)
        {
            uint8 type = (nodePoint->faction == TEAM_ALLIANCE ? BG_IC_NPC_GLAIVE_THROWER_1_A : BG_IC_NPC_GLAIVE_THROWER_1_H)+i;

            if (GetBGCreature(type) && GetBGCreature(type)->isAlive())
                continue;

            if (AddCreature(nodePoint->faction == TEAM_ALLIANCE ? NPC_GLAIVE_THROWER_A : NPC_GLAIVE_THROWER_H,type,nodePoint->faction,
                    BG_IC_DocksVehiclesGlaives[i][0],BG_IC_DocksVehiclesGlaives[i][1],
                    BG_IC_DocksVehiclesGlaives[i][2],BG_IC_DocksVehiclesGlaives[i][3],
                    RESPAWN_ONE_DAY))
                    GetBGCreature(type)->setFaction(BG_IC_Factions[(nodePoint->faction == TEAM_ALLIANCE ? 0 : 1)]);
        }

        // spawning catapults
        for (uint8 i = 0; i < MAX_CATAPULTS_SPAWNS_PER_FACTION; i++)
        {
            uint8 type = (nodePoint->faction == TEAM_ALLIANCE ? BG_IC_NPC_CATAPULT_1_A : BG_IC_NPC_CATAPULT_1_H)+i;

            if (GetBGCreature(type) && GetBGCreature(type)->isAlive())
                continue;

            if (AddCreature(NPC_CATAPULT,type,nodePoint->faction,
                    BG_IC_DocksVehiclesCatapults[i][0],BG_IC_DocksVehiclesCatapults[i][1],
                    BG_IC_DocksVehiclesCatapults[i][2],BG_IC_DocksVehiclesCatapults[i][3],
                    RESPAWN_ONE_DAY))
                    GetBGCreature(type)->setFaction(BG_IC_Factions[(nodePoint->faction == TEAM_ALLIANCE ? 0 : 1)]);
        }
        break;
    case BG_IC_GO_WORKSHOP_BANNER:
        {
            if (siegeEngineWorkshopTimer < WORKSHOP_UPDATE_TIME)
                siegeEngineWorkshopTimer = WORKSHOP_UPDATE_TIME;

            if (!recapture)
            {
                // we must del opposing faction vehicles when the node is captured (unused ones)
                for (uint8 i = (nodePoint->faction == TEAM_ALLIANCE ? BG_IC_NPC_DEMOLISHER_1_H : BG_IC_NPC_DEMOLISHER_1_A); i < (nodePoint->faction == TEAM_ALLIANCE ? BG_IC_NPC_DEMOLISHER_4_H : BG_IC_NPC_DEMOLISHER_4_A); i++)
                {
                    if (Creature* demolisher = GetBGCreature(i))
                    {
                        if (VehicleKit* vehicleDemolisher = demolisher->GetVehicleKit())
                        {
                            // is IsVehicleInUse working as expected?
                            if (!demolisher->GetCharmerOrOwner())
                                DelCreature(i);
                        }
                    }
                }

                for (uint8 i = 0; i < MAX_DEMOLISHERS_SPAWNS_PER_FACTION; i++)
                {
                    uint8 type = (nodePoint->faction == TEAM_ALLIANCE ? BG_IC_NPC_DEMOLISHER_1_A : BG_IC_NPC_DEMOLISHER_1_H)+i;

                    if (GetBGCreature(type) && GetBGCreature(type)->isAlive())
                        continue;

                    if (AddCreature(NPC_DEMOLISHER,type,nodePoint->faction,
                        BG_IC_WorkshopVehicles[i][0],BG_IC_WorkshopVehicles[i][1],
                        BG_IC_WorkshopVehicles[i][2],BG_IC_WorkshopVehicles[i][3],
                        RESPAWN_ONE_DAY))
                        GetBGCreature(type)->setFaction(BG_IC_Factions[(nodePoint->faction == TEAM_ALLIANCE ? 0 : 1)]);
                }

                // we check if the opossing siege engine is in use
                int8 enemySiege = (nodePoint->faction == TEAM_ALLIANCE ? BG_IC_NPC_SIEGE_ENGINE_H : BG_IC_NPC_SIEGE_ENGINE_A);

                if (Creature* siegeEngine = GetBGCreature(enemySiege))
                {
                    if (VehicleKit* vehicleSiege = siegeEngine->GetVehicleKit())
                    {
                        // is VehicleInUse working as expected ?
                        if (!siegeEngine->GetCharmerOrOwner())
                            DelCreature(enemySiege);
                    }
                }

                uint8 siegeType = (nodePoint->faction == TEAM_ALLIANCE ? BG_IC_NPC_SIEGE_ENGINE_A : BG_IC_NPC_SIEGE_ENGINE_H);
                if (!GetBGCreature(siegeType) || !GetBGCreature(siegeType)->isAlive())
                {
                    AddCreature((nodePoint->faction == TEAM_ALLIANCE ? NPC_SIEGE_ENGINE_A : NPC_SIEGE_ENGINE_H),siegeType,nodePoint->faction,
                        BG_IC_WorkshopVehicles[4][0],BG_IC_WorkshopVehicles[4][1],
                        BG_IC_WorkshopVehicles[4][2],BG_IC_WorkshopVehicles[4][3],
                        RESPAWN_ONE_DAY);

                    if (Creature* siegeEngine = GetBGCreature(siegeType))
                    {
                        siegeEngine->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NOT_SELECTABLE|UNIT_FLAG_UNK_14|UNIT_FLAG_OOC_NOT_ATTACKABLE);
                        siegeEngine->setFaction(BG_IC_Factions[(nodePoint->faction == TEAM_ALLIANCE ? 0 : 1)]);
                    }
                }
            }

            for (uint8 i = 0; i < MAX_WORKSHOP_BOMBS_SPAWNS_PER_FACTION; i++)
            {
                AddObject(BG_IC_GO_SEAFORIUM_BOMBS_1+i,GO_SEAFORIUM_BOMBS,
                workshopBombs[i][0],workshopBombs[i][1],
                workshopBombs[i][2],workshopBombs[i][3],
                0,0,0,0,10);
                SpawnBGObject(m_BgObjects[BG_IC_GO_SEAFORIUM_BOMBS_1 + i], RESPAWN_IMMEDIATELY);

                if (GameObject* seaforiumBombs = GetBGObject(BG_IC_GO_SEAFORIUM_BOMBS_1+i))
                {
                    seaforiumBombs->SetRespawnTime(10);
                    seaforiumBombs->SetUInt32Value(GAMEOBJECT_FACTION,BG_IC_Factions[(nodePoint->faction == TEAM_ALLIANCE ? 0 : 1)]);
                }
            }
            break;
        }
    default:
        break;
    }
}

void BattleGroundIC::DestroyGate(Player* pl, GameObject* go, uint32 /*destroyedEvent*/)
{
    GateStatus[GetGateIDFromEntry(go->GetEntry())] = BG_IC_GATE_DESTROYED;
    uint32 uws_open = GetWorldStateFromGateEntry(go->GetEntry(), true);
    uint32 uws_close = GetWorldStateFromGateEntry(go->GetEntry(), false);
    if (uws_open)
    {
        UpdateWorldState(uws_close,0);
        UpdateWorldState(uws_open, 1);
    }
    DoorOpen((pl->GetTeamId() == TEAM_ALLIANCE ? m_BgObjects[BG_IC_GO_HORDE_KEEP_PORTCULLIS] : m_BgObjects[BG_IC_GO_DOODAD_PORTCULLISACTIVE02]));

    uint32 lang_entry = 0;

    switch(go->GetEntry())
    {
        case GO_HORDE_GATE_1:
            lang_entry = LANG_BG_IC_NORTH_GATE_DESTROYED;
            break;
        case GO_HORDE_GATE_2:
            lang_entry = LANG_BG_IC_EAST_GATE_DESTROYED;
            break;
        case GO_ALLIANCE_GATE_1:
            lang_entry = LANG_BG_IC_WEST_GATE_DESTROYED;
            break;
        case GO_HORDE_GATE_3:
            lang_entry = LANG_BG_IC_WEST_GATE_DESTROYED;
            break;
        case GO_ALLIANCE_GATE_2:
            lang_entry = LANG_BG_IC_EAST_GATE_DESTROYED;
            break;
        case GO_ALLIANCE_GATE_3:
            lang_entry = LANG_BG_IC_SOUTH_GATE_DESTROYED;
            break;
    default:
        break;
    }

    SendWarningToAll(pl->GetTeamId() == TEAM_ALLIANCE ? LANG_BG_IC_HORDE_GATE_DESTROY : LANG_BG_IC_ALLY_GATE_DESTROY);
    SendMessage2ToAll(lang_entry, (pl->GetTeamId() == TEAM_ALLIANCE ? CHAT_MSG_BG_SYSTEM_ALLIANCE : CHAT_MSG_BG_SYSTEM_HORDE) ,NULL,(pl->GetTeamId() == TEAM_ALLIANCE ? LANG_BG_IC_HORDE_KEEP : LANG_BG_IC_ALLIANCE_KEEP));
}

void BattleGroundIC::EventPlayerDamageGO(Player* pl, GameObject* go, uint8 /*hitType*/, uint32 /*destroyedEvent*/)
{

}

void BattleGroundIC::EventPlayerUsedGO(Player* Source, GameObject* object)
{
    HandlePlayerUseTeleport(Source, object);
}

WorldSafeLocsEntry const* BattleGroundIC::GetClosestGraveYard(Player* player)
{
    BattleGroundTeamIndex teamIndex = GetTeamIndexByTeamId(player->GetTeam());

    // Is there any occupied node for this team?
    std::vector<uint8> nodes;
    for (uint8 i = 0; i < MAX_NODE_TYPES; ++i)
        if (nodePoint[i].faction == player->GetTeamId())
            nodes.push_back(i);

    WorldSafeLocsEntry const* good_entry = NULL;
    // If so, select the closest node to place ghost on
    if (!nodes.empty())
    {
        float plr_x = player->GetPositionX();
        float plr_y = player->GetPositionY();

        float mindist = 999999.0f;
        for (uint8 i = 0; i < nodes.size(); ++i)
        {
            WorldSafeLocsEntry const*entry = sWorldSafeLocsStore.LookupEntry(BG_IC_GraveyardIds[nodes[i]]);
            if (!entry)
                continue;
            float dist = (entry->x - plr_x)*(entry->x - plr_x)+(entry->y - plr_y)*(entry->y - plr_y);
            if (mindist > dist)
            {
                mindist = dist;
                good_entry = entry;
            }
        }
        nodes.clear();
    }
    // If not, place ghost on starting location
    if (!good_entry)
        good_entry = sWorldSafeLocsStore.LookupEntry(BG_IC_GraveyardIds[teamIndex+MAX_NODE_TYPES]);

    return good_entry;
}

Transport* BattleGroundIC::CreateTransport(uint32 goEntry, uint32 period)
{
    Transport* trans = GetBgMap()->LoadTransportInMap(goEntry, 0, period, false);

    if (!trans)
        return NULL;

    for (uint8 i = 0; i < 5; i++)
        trans->AddNPCPassenger((goEntry == GO_HORDE_GUNSHIP ? NPC_HORDE_GUNSHIP_CANNON : NPC_ALLIANCE_GUNSHIP_CANNON), (goEntry == GO_HORDE_GUNSHIP ? hordeGunshipPassengers[i][0] : allianceGunshipPassengers[i][0]) , (goEntry == GO_HORDE_GUNSHIP ? hordeGunshipPassengers[i][1] : allianceGunshipPassengers[i][1]),(goEntry == GO_HORDE_GUNSHIP ? hordeGunshipPassengers[i][2] : allianceGunshipPassengers[i][2]), (goEntry == GO_HORDE_GUNSHIP ? hordeGunshipPassengers[i][3] : allianceGunshipPassengers[i][3]));

    return trans;
}

void BattleGroundIC::HandleParachutes()
{
    for (BattleGroundPlayerMap::const_iterator itr = m_Players.begin(); itr != m_Players.end(); ++itr)
    {
        if (Player *player = sObjectMgr.GetPlayer(itr->first))
        {
            if (!player->IsFalling())
                continue;

            float height = player->GetPositionZ();
            if (height < 180 && height > 140 && (!player->HasAura(66657)))
                player->CastSpell(player, 66657, true);
        }
    }
}

void BattleGroundIC::HandlePlayerUseTeleport(Player *player, GameObject *teleport)
{
    if (!teleport || !player)
        return;

    float x, y, z;
    teleport->GetPosition(x, y, z);

    for (uint8 i = 0; i <= 12; ++i)
    {
        if (BG_IC_Teleporters[i].x == x && BG_IC_Teleporters[i].y == y && BG_IC_Teleporters[i].z == z)
        {
            switch(BG_IC_Teleporters[i].type)
            {
                case BG_IC_GO_TELEPORTER_1_1:
                    player->NearTeleportTo(1158.64f, -746.148f, 48.6277f, -1.50098f);
                    break;
                case BG_IC_GO_TELEPORTER_1_2:
                    player->NearTeleportTo(1235.6f, -683.806f, 49.3028f, -3.07177f);
                    break;
                case BG_IC_GO_TELEPORTER_2_1:
                    player->NearTeleportTo(1235.07f, -857.957f, 48.9163f, 3.05433f);
                    break;
                case BG_IC_GO_TELEPORTER_3_1:
                    player->NearTeleportTo(323.55f, -888.347f, 48.9198f, 0.0174525f);
                    break;
                case BG_IC_GO_TELEPORTER_2_2:
                    player->NearTeleportTo(1236.46f, -669.344f, 48.2684f, 0.087266f);
                    break;
                case BG_IC_GO_TELEPORTER_4_1:
                    player->NearTeleportTo(425.686f, -857.092f, 48.51f, -1.62316f);
                    break;
                case BG_IC_GO_TELEPORTER_3_2:
                    player->NearTeleportTo(326.285f, -777.366f, 49.0208f, 3.12412f);
                    break;
                case BG_IC_GO_TELEPORTER_3_3:
                    player->NearTeleportTo(397.116f, -859.378f, 48.8989f, 1.64061f);
                    break;
                case BG_IC_GO_TELEPORTER_4_2:
                    player->NearTeleportTo(311.911f, -913.986f, 48.8157f, 3.08918f);
                    break;
                case BG_IC_GO_TELEPORTER_4_3:
                    player->NearTeleportTo(324.635f, -749.128f, 49.3602f, 0.0174525f);
                    break;
                case BG_IC_GO_TELEPORTER_1_3:
                    player->NearTeleportTo(1233.25f, -844.573f, 48.8836f, 0.0174525f);
                    break;
                case BG_IC_GO_TELEPORTER_2_3:
                    player->NearTeleportTo(1143.25f, -779.623f, 48.6291f, 1.62316f);
                    break;
                default:
                    break;
            }
        }
        else if ((BG_IC_HangarTeleporters[0][0] == x && BG_IC_HangarTeleporters[0][1] == y && BG_IC_HangarTeleporters[0][2] == z)
                || (BG_IC_HangarTeleporters[1][0] == x && BG_IC_HangarTeleporters[1][1] == y && BG_IC_HangarTeleporters[1][2] == z)
                || (BG_IC_HangarTeleporters[2][0] == x && BG_IC_HangarTeleporters[2][1] == y && BG_IC_HangarTeleporters[2][2] == z))
            DoAction(ACTION_TELEPORT_PLAYER_TO_TRANSPORT, player);
    }
}