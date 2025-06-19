dofile_once("data/scripts/lib/utilities.lua")


dofile_once("data/scripts/perks/perk.lua")
function OnPlayerSpawned(player_id)
	-- Gets the player's position
	local x, y = EntityGetTransform(player_id)

	-- For testing purposes
	-- if not GameHasFlagRun("giving_testing_perks") then
	-- 	GameAddFlagRun("giving_testing_perks")
	-- 	for i=1,5 do
	-- 		local perk1 = perk_spawn(x, y, "GENOME_MORE_LOVE")
	-- 		perk_pickup(perk1, player_id, EntityGetName(perk1), false, false)
	-- 		local perk2 = perk_spawn(x, y, "EXTRA_HP")
	-- 		perk_pickup(perk2, player_id, EntityGetName(perk2), false, false)
	-- 	end
	-- 	local perk3 = perk_spawn(x, y, "REMOVE_FOG_OF_WAR")
	-- 	perk_pickup(perk3, player_id, EntityGetName(perk3), false, false)
	-- end
end

local run_per_frame = 150
local thisFrame = 0

-- This code runs when all mods' filesystems are registered
ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/nightmare_enemies_drop_perks/files/perk_list_appends.lua")