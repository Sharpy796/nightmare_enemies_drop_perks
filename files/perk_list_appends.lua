local function tag_entity(entity_id)
    -- GamePrint("tag_entity() running on '" .. EntityGetName(entity_id) .. "'")
	EntityAddTag(entity_id, "TAGGED_TO_DROP_PERKS")
    EntityLoadToEntity( "mods/nightmare_enemies_drop_perks/files/drop_perks_on_death.xml", entity_id )
    EntityLoadToEntity( "mods/nightmare_enemies_drop_perks/files/colour_true_rainbow.xml", entity_id ) -- For testing purposes
end

for i=1, #perk_list do
    if (perk_list[i].func_enemy) then
        local _func_enemy = perk_list[i].func_enemy
        perk_list[i].func_enemy = function( entity_perk_item, entity_who_picked )
            tag_entity(entity_who_picked)
            EntityAddComponent(entity_who_picked, "VariableStorageComponent", {
                name="perk_id",
                value_string=entity_perk_item.id
            })
            _func_enemy( entity_perk_item, entity_who_picked )
		end

    end
end