local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

RegisterServerEvent("esx_wraki:otrzymajprzedmiot")
AddEventHandler("esx_wraki:otrzymajprzedmiot", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local fart = math.random(0, 69)

    if fart >= 0 and fart <= 29 then

        TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
	    TriggerClientEvent("pNotify:SendNotification", source, {
		text = "<center><b>Przeszukiwanie wraków:</b> <br /><br /><i>Wrak jest pusty, weź się może za normalną prace.</i></center>",
		type = "error",
		progressBar = false,
		queue = "lmao",
		timeout = 4000,
		layout = "CenterLeft"
    })

    end

    if fart >= 30 and fart <= 45 then

        player.addInventoryItem("burger", 1)  ---Przedmiot który otrzymujemy i ilość
        TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
	    TriggerClientEvent("pNotify:SendNotification", source, {
		text = "<center><b>Przeszukiwanie wraków:</b> <br /><br /><i>Gratulacje, znalazłeś burgera!.</i></center>",
		type = "success",
		progressBar = false,
		queue = "lmao",
		timeout = 4000,
		layout = "CenterLeft"
    })

    end

    if fart >= 46 and fart <= 61 then

        player.addInventoryItem("cola", 1)  ---Przedmiot który otrzymujemy i ilość
        TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
	    TriggerClientEvent("pNotify:SendNotification", source, {
		text = "<center><b>Przeszukiwanie wraków:</b> <br /><br /><i>Gratulacje, znalazłeś cole!.</i></center>",
		type = "success",
		progressBar = false,
		queue = "lmao",
		timeout = 4000,
		layout = "CenterLeft"
    })

    end

    if fart >= 62 and fart <= 69 then

        player.addWeapon("weapon_knife", 1)  ---Broń którą otrzymujemy i amunicja
        TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
	    TriggerClientEvent("pNotify:SendNotification", source, {
		text = "<center><b>Przeszukiwanie wraków:</b> <br /><br /><i>Gratulacje, znalazłeś nóż!.</i></center>",
		type = "success",
		progressBar = false,
		queue = "lmao",
		timeout = 4000,
		layout = "CenterLeft"
    })

    end
end)
