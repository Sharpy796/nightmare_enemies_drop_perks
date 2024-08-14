dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/perks/perk.lua")

---@type script_death
death = function()
    local entity_id = GetUpdatedEntityID()
    local x, y = EntityGetTransform( entity_id )
    -- GamePrint("Dropping perk!!! from '" .. EntityGetName(entity_id) .. "' at x: " .. x .. " y: " .. y)
    local vscomps = EntityGetComponent(entity_id, "VariableStorageComponent")
    for _, vscomp in ipairs(vscomps) do
        local name = ComponentGetValue2(vscomp, "name")
        if (name == "perk_id") then
            local perk_id = ComponentGetValue2(vscomp, "value_string")
            -- GamePrint("Which perk is this? It's '" .. EntityGetName(perk_id) .. "'")
            -- GamePrint("Attepting to spawn perk with id '" .. perk_id .. "'")
            perk_spawn(x, y-10, perk_id, true)
            -- perk_spawn
        end
    end
end