dofile( "data/scripts/game_helpers.lua" )
dofile_once("data/scripts/lib/utilities.lua")
dofile_once( "data/scripts/perks/perk_list.lua" )

local function tag_entity(entity_id)
    -- GamePrint("tag_entity() running on '" .. EntityGetName(entity_id) .. "'")
	EntityAddTag(entity_id, "TAGGED_TO_DROP_PERKS")
    EntityLoadToEntity( "mods/nightmare_enemies_drop_perks/files/drop_perks_on_death.xml", entity_id )
    -- EntityLoadToEntity( "mods/nightmare_enemies_drop_perks/files/colour_true_rainbow.xml", entity_id ) -- For testing purposes
end

local _give_perk_to_enemy = give_perk_to_enemy
give_perk_to_enemy = function(perk_data, entity_who_picked, entity_item, num_perks, perk_idx, pickup_num)
    local perk_id = perk_data.id

    tag_entity(entity_who_picked)
    EntityAddComponent(entity_who_picked, "VariableStorageComponent", {
        name="perk_id",
        value_string=perk_id
    })

    _give_perk_to_enemy(perk_data, entity_who_picked, entity_item, num_perks, perk_idx, pickup_num)
end