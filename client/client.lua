local QBCore = exports['qb-core']:GetCoreObject()

-- animation Function
local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end


--Ped All Function
Citizen.CreateThread(function()
    for k, v in pairs(Config.PEDLOCATION) do
        local modelHash = GetHashKey(v.model)
        RequestModel(modelHash) 
        while ( not HasModelLoaded(modelHash) ) do
            Wait(1)
        end
        local ped = CreatePed(1, modelHash, v.coords, false, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true) 
        TaskStartScenarioInPlace(ped, v.scenario, -1, true) 
        -- Wait(5000)
        -- FreezeEntityPosition(ped, true)
    end
end)


if Config.UseBlips then
    --BLips All Function
    Citizen.CreateThread(function()
        -- All Blips
        for k, v in pairs(Config.ALLBLIPS) do
            local ALLBLIP = AddBlipForCoord(v.coords)
            SetBlipSprite(ALLBLIP, v.SetBlipSprite)
            SetBlipDisplay(ALLBLIP, v.SetBlipDisplay)
            SetBlipScale(ALLBLIP, v.SetBlipScale)
            SetBlipColour(ALLBLIP, v.SetBlipColour)
            SetBlipAsShortRange(ALLBLIP, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.BlipName)
            EndTextCommandSetBlipName(ALLBLIP)
        end
    end)

    --Buy Item And Sell Fish
    Citizen.CreateThread(function()
        for k, v in pairs(Config.PedLocationTarget) do
            exports['qb-target']:AddBoxZone('Buy And Sell Item' .. k, v.coords, 0.6, 0.6, {
                name = v.name .. k,
                heading = v.heading,
                debugPoly = false,
                minZ = v.minZ ,
                maxZ = v.maxZ,
            }, {
                options = { 
                    {
                        --- Buy Item
                        type = 'client',
                        event = 'qb-fishing:client:MenubuyItemFishing',
                        icon = 'fa-solid fa-cart-shopping',
                        label = Lang:t('label.BuyItem'),
                    },
                    {
                        --- Sell Item
                        type = 'client',
                        event = 'qb-fishing:client:MenusellItemFishing',
                        icon = 'fa-solid fa-fish-fins',
                        label = Lang:t('label.SellFish'),
                    },
                },
                distance = 1.2
            })
        end  
    end)
    -- Fish SPOT
    for k, v in pairs(Config.SpotFish) do
        local SPOTFISH = PolyZone:Create(v.zones, {
            name = v.label,
            minZ = v.minz,
            maxZ = v.maxz,
            debugPoly = false
        })
        SPOTFISH:onPlayerInOut(function(isPointInside)
            if isPointInside then
                exports['qb-core']:DrawText(Lang:t("haader.PressStart"), 'left')
                isZone = true
            else
                exports['qb-core']:HideText()
                isZone = false  
            end
        end)
    end
end


-- Function E
CreateThread(function()
    while true do
        Wait(0)
        if isZone then
            if IsControlJustReleased(0, 38) then  
                TriggerEvent('qb-fishing:client:StartFishing', src)
            end  
        end   
    end
end)



-- Lostbait
loseBait = function()
	local chance = math.random(1, 10)
	if chance <= 5 then
		TriggerServerEvent("qb-fishing:server:removeFishingFishBait")
	end
end

-- Start Fishing Function
function startFishing(dict, set, model)
    if isFishing then return end
    local animDict = dict
    local animName = set
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local bon = GetPedBoneIndex(playerPed, 18905)
    local rodHandle = CreateObject(model, coords.x, coords.y, coords.z, true, false, false)
    if rodHandle ~= nil and DoesEntityExist(rodHandle) then
        Citizen.CreateThread(function()
            isFishing = true
            while isFishing do
                AttachEntityToEntity(rodHandle, playerPed, bon, 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)
                loadAnimDict(animDict)
                TaskPlayAnim(playerPed, animDict, animName, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
                Wait(Config.FishingWaitTime)
                isFishing = false
                exports['qb-core']:DrawText(Lang:t("haader.PressStart"), 'left')
                loseBait()
                TriggerServerEvent('qb-fishing:server:FishingReward', src)
            end
            if DoesEntityExist(rodHandle) then
                ClearPedTasks(playerPed)
                DetachEntity(rodHandle, 1, true)
                DeleteEntity(rodHandle)
            end
        end)
    else
        print("Failed to create fishing rod object")
    end
end


-- Sell Fish Function
function SellFish(dict, set)
    local animDict = dict --mp_common
    local animName = set ---givetake2_a
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local Siling= true
    FreezeEntityPosition(playerPed, true)     
    QBCore.Functions.Progressbar('Sell Fish', Lang:t("haader.StartSell"), 2000, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, }, {}, {}, {}, function() 
        ClearPedTasks(playerPed)
        TaskPlayAnim(playerPed, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        FreezeEntityPosition(playerPed, false)
        Siling = false
    end, function() 
        Siling = false
        TaskPlayAnim(playerPed, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        FreezeEntityPosition(playerPed, false)
    end)
    Citizen.CreateThread(function()
        while Siling do
            loadAnimDict(animDict)
            TaskPlayAnim(playerPed, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
            Wait(1000)
        end
    end)
end
RegisterNetEvent('qb-fishing:client:SellingAnimition')
AddEventHandler('qb-fishing:client:SellingAnimition', function(args)
    SellFish('mp_common', 'givetake2_a')
end)



-- Sell Fish Function
function StartBuy(dict, set)
    local animDict = dict --mp_common
    local animName = set ---givetake2_a
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local Siling= true
    FreezeEntityPosition(playerPed, true)     
    QBCore.Functions.Progressbar('Buy Item', Lang:t("haader.StartBuy"), 2000, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, }, {}, {}, {}, function() 
        ClearPedTasks(playerPed)
        TaskPlayAnim(playerPed, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        FreezeEntityPosition(playerPed, false)
        Siling = false
    end, function() 
        Siling = false
        TaskPlayAnim(playerPed, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        FreezeEntityPosition(playerPed, false)
    end)
    Citizen.CreateThread(function()
        while Siling do
            loadAnimDict(animDict)
            TaskPlayAnim(playerPed, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
            Wait(1000)
        end
    end)
end
RegisterNetEvent('qb-fishing:client:BuyingAnimition')
AddEventHandler('qb-fishing:client:BuyingAnimition', function(args)
    StartBuy('mp_common', 'givetake2_a')
end)

-- Start Fishing
RegisterNetEvent('qb-fishing:client:StartFishing')
AddEventHandler('qb-fishing:client:StartFishing', function(args)
    QBCore.Functions.TriggerCallback('qb-fishing:server:FishingGrod-info', function(FishingGrod)
        if FishingGrod then
            QBCore.Functions.TriggerCallback('qb-fishing:server:FishingBait-info', function(Fishbait)
                if Fishbait then
                    if IsPedSwimming(PlayerPedId()) then return QBCore.Functions.Notify(Lang:t("notifyerror.errorPedSwimming"), "error", 1000) end 
                    if IsPedInAnyVehicle(PlayerPedId()) then return QBCore.Functions.Notify(Lang:t("notifyerror.errorPedDriving"), "error" , 1000) end 
                    exports['qb-core']:HideText()
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            startFishing('amb@world_human_stand_fishing@idle_a', 'idle_c', 'prop_fishing_rod_01')
                        else
                            QBCore.Functions.Notify(Lang:t('notifyerror.errorTryAgian'), "error" , 1500)
                            exports['qb-core']:DrawText(Lang:t("haader.PressStart"), 'left')
                        end
                    end, 2, 20)
                else
                    QBCore.Functions.Notify(Lang:t("notifyerror.errorFrishingBait"), "error", 1500)
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notifyerror.errorFrishingGrod"), "error", 1500)
        end
    end)
end)







-- Buy Menu Item fishing
RegisterNetEvent('qb-fishing:client:MenubuyItemFishing')
AddEventHandler('qb-fishing:client:MenubuyItemFishing', function(src)
    local MenuBuyItemFishing = {
        {
            header = Lang:t('haader.BuyMenu'),
            icon = 'fa-solid fa-box-open',
            isMenuHeader = true,
        },
        -- BUY FISHING GROD
        {
            header = Lang:t('haader.BuyFishGrod'),
            txt = Lang:t("txt.PriceFishGrod"),
            icon = Config.FishingGrod,
            params = {
                isServer = true,
                event = 'qb-fishing:server:BuyItemFishing',
                args = 1,
            }
        },
        -- BUY FISH BAIT
        {
            header = Lang:t('haader.BuyFishBait'),
            txt = Lang:t("txt.PriceFishBait"),
            icon = Config.FishBait,
            params = {
                isServer = true,
                event = 'qb-fishing:server:BuyItemFishing',
                args = 2,
            }
        },  
        -- Close Menu 
        {
            header = Lang:t('haader.CloseMenu'),
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },   
    }
    exports['qb-menu']:openMenu(MenuBuyItemFishing)
end)


-- Sell Menu Item fish
RegisterNetEvent('qb-fishing:client:MenusellItemFishing')
AddEventHandler('qb-fishing:client:MenusellItemFishing', function(src)
    local MenuSellItemFishing = {
        {
            header = Lang:t('haader.SellMenu'),
            icon = 'fa-solid fa-box-open',
            isMenuHeader = true,
        },
        -- Sell Black Fin Fish
        {
            header = Lang:t('haader.SellFishBlackFin'),
            txt = Lang:t("txt.PriceFishBlackFin"),
            icon = Config.BlackfinTuna,
            params = {
                isServer = true,
                event = 'qb-fishing:server:SellItemFish',
                args = 1,
            }
        },
        -- Sell Rudd Isolated Fish
        {
            header = Lang:t('haader.SellFishRuddIsolated'),
            txt = Lang:t("txt.PriceFishRuddIsolated"),
            icon = Config.RuddIsolated,
            params = {
                isServer = true,
                event = 'qb-fishing:server:SellItemFish',
                args = 2,
            }
        },
        -- Sell Salmon Fish
        {
            header = Lang:t('haader.SellFishSalmon'),
            txt = Lang:t("txt.PriceFishSalmo"),
            icon = Config.Salmon,
            params = {
                isServer = true,
                event = 'qb-fishing:server:SellItemFish',
                args = 3,
            }
        },
        -- Sell Fish Trigger Fish
        {
            header = Lang:t('haader.SellFishTrigger'),
            txt = Lang:t("txt.PriceFishTrigger"),
            icon = Config.TriggerFish,
            params = {
                isServer = true,
                event = 'qb-fishing:server:SellItemFish',
                args = 4,
            }
        },
        -- Close Menu 
        {
            header = Lang:t('haader.CloseMenu'),
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },   
    }
    exports['qb-menu']:openMenu(MenuSellItemFishing)
end)







