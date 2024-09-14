local QBCore = exports['qb-core']:GetCoreObject()
local set = false
local mphValue = 2.23694

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(1)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            local currentSpeed = GetEntitySpeed(vehicle)
            if currentSpeed == 0 then
                Citizen.Wait(1)
            end
            if vehicle ~= nil then
                set = true
                awareSetSpeed(vehicle)
            end

            while set and IsPedInAnyVehicle(PlayerPedId(), false) do
                Citizen.Wait(1)
                local currentVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                if currentVeh ~= vehicle then
                    awareSetSpeed(currentVeh)
                end
            end
        end
    end

end)

function findVehicleByModel(modelName)
    --print(QBCore.Shared.Vehicles, modelName)
    for _, vehicle in pairs(QBCore.Shared.Vehicles) do
        --print(vehicle.model, vehicle.category)
        if string.find(vehicle.model, modelName) then
            return vehicle.category
        end
    end
    return nil -- Return nil if not found
end

function awareSetSpeed(vehicle)
    local vehicleclass = findVehicleByModel(string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
    local maxSpeed = Config[vehicleclass]
    print(vehicleclass, maxSpeed, Config.MaxUnknown)
    if maxSpeed ~= nil then
        SetVehicleMaxSpeed(vehicle, maxSpeed / mphValue)
		set = true
    else
        SetVehicleMaxSpeed(vehicle, Config.MaxUnknown / mphValue)
		set = true
    end
end
