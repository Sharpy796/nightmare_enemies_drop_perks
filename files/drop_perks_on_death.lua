dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/perks/perk.lua")

-- death = function()
--     local entity_id = GetUpdatedEntityID()
--     local x, y = EntityGetTransform( entity_id )
--     -- GamePrint("Dropping perk!!! from '" .. EntityGetName(entity_id) .. "' at x: " .. x .. " y: " .. y)
--     local vscomps = EntityGetComponent(entity_id, "VariableStorageComponent")
--     for _, vscomp in ipairs(vscomps) do
--         local name = ComponentGetValue2(vscomp, "name")
--         if (name == "perk_id") then
--             local perk_id = ComponentGetValue2(vscomp, "value_string")
--             -- GamePrint("Which perk is this? It's '" .. EntityGetName(perk_id) .. "'")
--             -- GamePrint("Attepting to spawn perk with id '" .. perk_id .. "'")
--             perk_spawn(x, y-10, perk_id, true)
--             -- perk_spawn
--         end
--     end
-- end

---@type script_death
death = function()
    local entity_id = GetUpdatedEntityID()
    local x, y = EntityGetTransform( entity_id )
    GamePrint("Dropping perk!!! from '" .. EntityGetName(entity_id) .. "' at x: " .. x .. " y: " .. y)

    local perk_icon_entity = EntityGetAllChildren(entity_id,"perk_icon_enemy")[1]
    if (perk_icon_entity) then
        local spritecomp = EntityGetComponent(perk_icon_entity, "SpriteComponent")[1]
        if (spritecomp) then
            local perk_image_file = ComponentGetValue2(spritecomp, "image_file")
            if (perk_image_file) then
                local perk_id = string.upper(string.gsub(string.gsub(perk_image_file,"data/ui_gfx/perk_icons/",""),".png",""))
                if (perk_id) then
                    -- GamePrint("Which perk is this? It's '" .. EntityGetName(perk_id) .. "'")
                    GamePrint("Attepting to spawn perk with id '" .. perk_id .. "'")
                    perk_spawn(x, y-10, perk_id, true)
                else
                    GamePrint("No perk_id")
                end
            else
                GamePrint("No perk_image_file")
            end
        else
            GamePrint("No spritecomp")
        end
    else
        GamePrint("No perk_icon_entity")
    end
    

    -- local vscomps = EntityGetComponent(entity_id, "VariableStorageComponent")
    -- for _, vscomp in ipairs(vscomps) do
    --     local name = ComponentGetValue2(vscomp, "name")
    --     if (name == "perk_id") then
    --         local perk_id = ComponentGetValue2(vscomp, "value_string")
    --         perk_spawn(x, y-10, perk_id, true)
    --         -- perk_spawn
    --     end
    -- end
end