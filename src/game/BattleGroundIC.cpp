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

BattleGroundIC::BattleGroundIC()
{
    //TODO FIX ME!
    m_StartMessageIds[BG_STARTING_EVENT_FIRST]  = 0;
    m_StartMessageIds[BG_STARTING_EVENT_SECOND] = LANG_BG_WS_START_ONE_MINUTE;
    m_StartMessageIds[BG_STARTING_EVENT_THIRD]  = LANG_BG_WS_START_HALF_MINUTE;
    m_StartMessageIds[BG_STARTING_EVENT_FOURTH] = LANG_BG_WS_HAS_BEGUN;
}

BattleGroundIC::~BattleGroundIC()
{

}

void BattleGroundIC::HandleKillPlayer(Player *player, Player *killer)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    BattleGround::HandleKillPlayer(player, killer);
    UpdateScore(GetTeamIndexByTeamId(player->GetTeam()), -1);
}

void BattleGroundIC::HandleKillUnit(Creature *creature, Player *killer)
{
    DEBUG_LOG("BattleGroundIC: HandleKillUnit %i", creature->GetEntry());
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    switch(creature->GetEntry())
    {
        case BG_IC_BOSS_A:
            RewardReputationToTeam(BG_IC_FACTION_H, m_RepBoss, HORDE);
            RewardHonorToTeam(GetBonusHonorFromKill(BG_IC_KILL_BOSS), HORDE);
            // SendYellToAll(LANG_BG_IC_A_GENERAL_DEAD, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_IC_HERALD, 0));
            EndBattleGround(HORDE);
            break;
        case BG_IC_BOSS_H:
            RewardReputationToTeam(BG_IC_FACTION_A, m_RepBoss, ALLIANCE);
            RewardHonorToTeam(GetBonusHonorFromKill(BG_IC_KILL_BOSS), ALLIANCE);
            // SendYellToAll(LANG_BG_IC_H_GENERAL_DEAD, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_IC_HERALD, 0));
            EndBattleGround(ALLIANCE);
            break;
    }
}

void BattleGroundIC::Update(uint32 diff)
{
    BattleGround::Update(diff);
}

void BattleGroundIC::UpdateScore(BattleGroundTeamIndex team, int32 points )
{
    // note: to remove reinforcements points must be negative, for adding reinforcements points must be positive
    MANGOS_ASSERT( team == BG_TEAM_ALLIANCE || team == BG_TEAM_HORDE);
    m_TeamScores[team] += points;                      // m_TeamScores is int32 - so no problems here

    if (points < 0)
    {
        if (m_TeamScores[team] < 1)
        {
            m_TeamScores[team] = 0;
            // other team will win:
            EndBattleGround((team == BG_TEAM_ALLIANCE)? HORDE : ALLIANCE);
        }
        else if (!m_IsInformedNearLose[team] && m_TeamScores[team] < BG_IC_SCORE_NEAR_LOSE)
        {
            SendMessageToAll((team == BG_TEAM_HORDE) ? LANG_BG_AV_H_NEAR_LOSE : LANG_BG_AV_A_NEAR_LOSE, CHAT_MSG_BG_SYSTEM_NEUTRAL);
            PlaySoundToAll(BG_IC_SOUND_NEAR_LOSE);
            m_IsInformedNearLose[team] = true;
        }
    }
    // must be called here, else it could display a negative value
    UpdateWorldState(((team == BG_TEAM_HORDE) ? BG_IC_Horde_Score : BG_IC_Alliance_Score), m_TeamScores[team]);
}

void BattleGroundIC::StartingEventCloseDoors()
{
}

void BattleGroundIC::StartingEventOpenDoors()
{
}

void BattleGroundIC::AddPlayer(Player *plr)
{
    BattleGround::AddPlayer(plr);
    //create score and add it to map, default values are set in constructor
    BattleGroundICScore* sc = new BattleGroundICScore;

    m_PlayerScores[plr->GetObjectGuid()] = sc;
}

void BattleGroundIC::RemovePlayer(Player* /*plr*/, ObjectGuid /*guid*/)
{

}

void BattleGroundIC::HandleAreaTrigger(Player * /*Source*/, uint32 /*Trigger*/)
{
    // this is wrong way to implement these things. On official it done by gameobject spell cast.
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
}

void BattleGroundIC::UpdatePlayerScore(Player* Source, uint32 type, uint32 value)
{

    BattleGroundScoreMap::iterator itr = m_PlayerScores.find(Source->GetObjectGuid());

    if(itr == m_PlayerScores.end())                         // player not found...
        return;

    BattleGround::UpdatePlayerScore(Source,type,value);
}

void BattleGroundIC::FillInitialWorldStates(WorldPacket& data, uint32& count)
{
    /*
    bool stateok;
    for (uint32 i = BG_AV_NODES_FIRSTAID_STATION; i < BG_AV_NODES_MAX; ++i)
    {
        for (uint8 j = 0; j < BG_AV_MAX_STATES; j++)
        {
            stateok = (m_Nodes[i].State == j);
            FillInitialWorldState(data, count, BG_AV_NodeWorldStates[i][GetWorldStateType(j, BG_TEAM_ALLIANCE)],
                m_Nodes[i].Owner == BG_TEAM_ALLIANCE && stateok);
            FillInitialWorldState(data, count, BG_AV_NodeWorldStates[i][GetWorldStateType(j, BG_TEAM_HORDE)],
                m_Nodes[i].Owner == BG_TEAM_HORDE && stateok);
        }
    }

    if( m_Nodes[BG_AV_NODES_SNOWFALL_GRAVE].Owner == BG_AV_NEUTRAL_TEAM )   // cause neutral teams aren't handled generic
        FillInitialWorldState(data, count, AV_SNOWFALL_N, 1);
    */

    FillInitialWorldState(data, count, BG_IC_Alliance_Score, m_TeamScores[BG_TEAM_ALLIANCE]);
    FillInitialWorldState(data, count, BG_IC_Horde_Score,    m_TeamScores[BG_TEAM_HORDE]);
    if( GetStatus() == STATUS_IN_PROGRESS )                 // only if game is running the teamscores are displayed
    {
        FillInitialWorldState(data, count, BG_IC_SHOW_A_SCORE, 1);
        FillInitialWorldState(data, count, BG_IC_SHOW_H_SCORE, 1);
    }
    else
    {
        FillInitialWorldState(data, count, BG_IC_SHOW_A_SCORE, 0);
        FillInitialWorldState(data, count, BG_IC_SHOW_H_SCORE, 0);
    }

    /*
    FillInitialWorldState(data, count, BG_AV_MineWorldStates[BG_AV_NORTH_MINE][m_Mine_Owner[BG_AV_NORTH_MINE]], 1);
    if (m_Mine_Owner[BG_AV_NORTH_MINE] != m_Mine_PrevOwner[BG_AV_NORTH_MINE])
        FillInitialWorldState(data, count, BG_AV_MineWorldStates[BG_AV_NORTH_MINE][m_Mine_PrevOwner[BG_AV_NORTH_MINE]], 0);

    FillInitialWorldState(data, count, BG_AV_MineWorldStates[BG_AV_SOUTH_MINE][m_Mine_Owner[BG_AV_SOUTH_MINE]], 1);
    if (m_Mine_Owner[BG_AV_SOUTH_MINE] != m_Mine_PrevOwner[BG_AV_SOUTH_MINE])
        FillInitialWorldState(data, count, BG_AV_MineWorldStates[BG_AV_SOUTH_MINE][m_Mine_PrevOwner[BG_AV_SOUTH_MINE]], 0);
    */
}
