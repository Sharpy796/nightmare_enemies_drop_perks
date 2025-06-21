local function do_perk_tagging_stuff( perk, entity_who_picked )
    -- print("yo this guy got a perk")
    if (not EntityHasTag(entity_who_picked, "TAGGED_TO_DROP_PERKS")) then
        EntityLoadToEntity( "mods/nightmare_enemies_drop_perks/files/drop_perks_on_death.xml", entity_who_picked )
        -- print("entity loaded")
    end
	EntityAddTag(entity_who_picked, "TAGGED_TO_DROP_PERKS")
    -- print("tagged")
    EntityAddComponent(entity_who_picked, "VariableStorageComponent", {
        name="perk_id",
        value_string=perk.id
    })
    -- print("component added")
end

for i,perk in ipairs(perk_list) do
    local _func;
    if (perk.usable_by_enemies) then
        -- print("perk is usable by enemy!")
        if (perk.func_enemy ~= nil) then
            -- print("> perk has func_enemy")
            _func = perk.func_enemy
            perk.func_enemy = function( entity_perk_item, entity_who_picked )
                do_perk_tagging_stuff( perk, entity_who_picked )
                _func( entity_perk_item, entity_who_picked )
		    end
        elseif (perk.func ~= nil) then
            -- print("> perk has func")
            _func = perk.func
            perk.func = function( entity_perk_item, entity_who_picked, item_name, pickup_count )
                do_perk_tagging_stuff( perk, entity_who_picked )
                _func( entity_perk_item, entity_who_picked, item_name, pickup_count ) -- pickup_count isn't in every version, this might break
		    end
        else
            -- print("> perk has NEITHER")
            perk.func_enemy = function( entity_perk_item, entity_who_picked )
                do_perk_tagging_stuff( perk, entity_who_picked )
		    end
        end
    end
end