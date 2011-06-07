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

#ifndef __BATTLEGROUNDIC_H
#define __BATTLEGROUNDIC_H

#define BG_IC_SCORE_NEAR_LOSE               120

#define BG_IC_BOSS_A                        34924
#define BG_IC_BOSS_H                        34922
#define BG_IC_KILL_BOSS                     4

enum BG_IC_Factions
{
    BG_IC_FACTION_A             = 730, // Unknow for now
    BG_IC_FACTION_H             = 729, // Unknow for now
};

enum BG_IC_Sounds
{
    BG_IC_SOUND_NEAR_LOSE               = 8456,             // not confirmed yet

    BG_IC_SOUND_ALLIANCE_ASSAULTS       = 8212,             // tower,grave + enemy boss if someone tries to attack him
    BG_IC_SOUND_HORDE_ASSAULTS          = 8174,

    BG_IC_SOUND_ALLIANCE_CAPTAIN        = 8232,             // gets called when someone attacks them and at the beginning after 3min + rand(x) * 10sec (maybe buff)
    BG_IC_SOUND_HORDE_CAPTAIN           = 8333,
};

enum BG_IC_WorldStates
{
    BG_IC_Alliance_Score        = 3127,
    BG_IC_Horde_Score           = 3128,
    BG_IC_SHOW_H_SCORE          = 3133,
    BG_IC_SHOW_A_SCORE          = 3134,
};

class BattleGround;

class BattleGroundICScore : public BattleGroundScore
{
    public:
        BattleGroundICScore(): BasesAssaulted(0), BasesDefended(0) {};
        virtual ~BattleGroundICScore() {};
        uint32 BasesAssaulted;
        uint32 BasesDefended;
};

class BattleGroundIC : public BattleGround
{
    friend class BattleGroundMgr;

    public:
        BattleGroundIC();
        ~BattleGroundIC();
        void Update(uint32 diff);

        /* inherited from BattlegroundClass */
        virtual void AddPlayer(Player *plr);
        virtual void StartingEventCloseDoors();
        virtual void StartingEventOpenDoors();
        virtual void FillInitialWorldStates(WorldPacket& data, uint32& count);

        void RemovePlayer(Player *plr, ObjectGuid guid);
        void HandleAreaTrigger(Player *Source, uint32 Trigger);
        //bool SetupBattleGround();

        void UpdateScore(BattleGroundTeamIndex team, int32 points);
        void HandleKillPlayer(Player* player, Player *killer);
        void HandleKillUnit(Creature *creature, Player *killer);

        /* Scorekeeping */
        void UpdatePlayerScore(Player *Source, uint32 type, uint32 value);

    private:
        bool m_IsInformedNearLose[BG_TEAMS_COUNT];
        uint32 m_RepBoss;
};
#endif
