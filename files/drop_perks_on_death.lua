dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/perks/perk.lua")

---@type script_death
death = function()
    local entity_id = GetUpdatedEntityID()
    local x, y = EntityGetTransform( entity_id )
    local perk_ids = {}
    -- GamePrint("Dropping perk!!! from '" .. EntityGetName(entity_id) .. "' at x: " .. x .. " y: " .. y)

    local vscomps = EntityGetComponent(entity_id, "VariableStorageComponent")
    for _, vscomp in ipairs(vscomps) do
        local name = ComponentGetValue2(vscomp, "name")
        if (name == "perk_id") then
            local perk_id = ComponentGetValue2(vscomp, "value_string")
            perk_ids[#perk_ids+1] = perk_id
        end
    end

    for i=1, #perk_ids do
        -- GamePrint("Attepting to spawn perk with id '" .. perk_ids[i] .. "'")
        perk_spawn(x+(((-1)^(i+1))*10*math.floor(i/2)), y-10, perk_ids[i], true)
    end
end