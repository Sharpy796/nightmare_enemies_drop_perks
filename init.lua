dofile_once("data/scripts/lib/utilities.lua")
-- ModMagicNumbersFileAdd("mods/nightmare_enemies_drop_perks/files/magic_numbers.xml") -- For testing purposes


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
-- Sharpy796: Make this compatible with things other than Nightmare Mode?
function OnWorldPostUpdate() -- This is called every time the game has finished updating the world
	-- local player_id = EntityGetWithTag("player_unit")[1]
	-- local x, y = EntityGetTransform(player_id)
	-- local entity_list = EntityGetWithTag("homing_target")
    -- local comp_filename = "mods/nightmare_enemies_drop_perks/files/drop_perks_on_death.xml"
	-- for i=1, #entity_list do
	-- 	if (EntityGetTags(entity_list[i])["tagged_to_drop_perks"] ~= nil) then
	-- 		GamePrint("Tagging " .. entity_list[i] .. " to drop perks.")
	-- 		EntityLoadToEntity( comp_filename, entity_list[i] )
	-- 		EntityAddTag(entity_list[i], "tagged_to_drop_perks")
	-- 	end
	-- end
end

-- This code runs when all mods' filesystems are registered
ModLuaFileAppend( "data/scripts/director_helpers.lua", "mods/nightmare_enemies_drop_perks/files/director_helpers_appends.lua")