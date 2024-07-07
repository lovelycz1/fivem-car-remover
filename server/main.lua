-- By lovely

local deleteTimer = 15 -- time in minutes

-----------------------------------------

CreateThread(function()
    while true do
        Wait(deleteTimer * 60000)
        TriggerClientEvent('okokNotify:Alert', -1, "Car Remover", "All cars without drivers will be deleted in 15 minutes", 10000, 'warning')
        Wait(840000)
        TriggerClientEvent('okokNotify:Alert', -1, "Car Remover", "All cars without drivers will be deleted in 1 minute", 10000, 'warning')
        Wait(50000)
        TriggerClientEvent('okokNotify:Alert', -1, "Car Remover", "All cars without drivers will be deleted in 10 seconds", 10000, 'warning')
        Wait(10000)
        TriggerClientEvent('okokNotify:Alert', -1, "Car Remover", "All cars without drivers will be deleted in 5 seconds", 10000, 'warning')
        Wait(5000)

        for i, veh in pairs(GetAllVehicles()) do
            if HasVehicleBeenOwnedByPlayer(veh) then
                if not isVehicleOccupied(veh) then
                    DeleteEntity(veh)
                end
            end
        end
        TriggerClientEvent('okokNotify:Alert', -1, "Car Remover", "All cars without drivers were deleted", 10000, 'success')
    end
end)

function isVehicleOccupied(veh)
    for seat = -1, 6 do
        if GetPedInVehicleSeat(veh, seat) ~= 0 then
            return true
        end
    end
    return false
end
