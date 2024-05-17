ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        ESX = exports["es_extended"]:getSharedObject()
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            if DoesVehicleHaveAnyDamagedWheels(vehicle) then
                SetEntityMaxSpeed(vehicle, 13.88) 
            else
                SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveMaxFlatVel'))
            end
        end
    end
end)

function DoesVehicleHaveAnyDamagedWheels(vehicle)
    for i = 0, 7 do
        if IsVehicleTyreBurst(vehicle, i, false) then
            return true
        end
    end
    return false
end
