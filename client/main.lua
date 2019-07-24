ESX                           = nil

local przeszukaneWraki = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(5)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do
        local sleepThread = 1000

        local entity, entityDst = ESX.Game.GetClosestObject(Config.Wraki)

        if DoesEntityExist(entity) and entityDst <= 2.0 then
            sleepThread = 5

            local wrakiCoords = GetEntityCoords(entity)

            DrawText3D(wrakiCoords.x, wrakiCoords.y, wrakiCoords.z + 0.98, "[~g~E~s~] Przeszukaj wrak", 0.4)

            if IsControlJustReleased(0, 38) then
                if not przeszukaneWraki[entity] then
                    przeszukaneWraki[entity] = true

                    PrzeszukajWrak()
                else
                    TriggerEvent("pNotify:SendNotification", {text = "<center><b>Przeszukiwanie wraków:</b> <br /><br /><i>Przeszukiwałeś już ten wrak!</i></center>", type = "warning", timeout = 4000, layout = "centerLeft"})
                end
            end
        end

        Citizen.Wait(sleepThread)
    end
end)

function PrzeszukajWrak()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local procent = 0
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
        while procent <= 1000 do
        DrawText3D(coords.x, coords.y, coords.z + 0.98, "" .. tonumber(procent * 0.1) ..'%', 0.4)
        Wait(0)
        procent = procent + 1
        end

    TriggerServerEvent("esx_wraki:otrzymajprzedmiot")

    ClearPedTasks(PlayerPedId())
end

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end
