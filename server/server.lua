local QBCore = exports['qb-core']:GetCoreObject()


--- REMOVE FISHBAIT
RegisterNetEvent('qb-fishing:server:removeFishingFishBait')
AddEventHandler('qb-fishing:server:removeFishingFishBait', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local Fishbait = Config.FishBait
    Player.Functions.RemoveItem(Fishbait, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Fishbait], "remove", 1)
end)


-- FISHING GROD INFOMATION CALLBACK
QBCore.Functions.CreateCallback('qb-fishing:server:FishingGrod-info', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.FishingGrod) ~= nil then
            cb(true)
        else
            cb(false)
            QBCore.Functions.Notify(src, Lang:t('notifyerror.errorFrishingGRod'), "error", 1000)
        end
    end
end)

-- FISHING BAIT INFOMATION CALLBACK
QBCore.Functions.CreateCallback('qb-fishing:server:FishingBait-info', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.FishBait) ~= nil then
            cb(true)
        else
            cb(false)
            QBCore.Functions.Notify(src, Lang:t('notifyerror.errorFrishingBait'), "error", 1000)
        end
    end
end)

-- Buy Item Fishing
RegisterNetEvent('qb-fishing:server:BuyItemFishing')
AddEventHandler('qb-fishing:server:BuyItemFishing', function(args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local args = tonumber(args)
    -- FISHING GROD
    if args == 1 then
        local FishingGrodAmount = 1
        local FishingGrod = Config.FishingGrod
        local FishingGrodPrice = Config.FishingGrodPrice
        if Player.Functions.RemoveMoney('cash', FishingGrodPrice) then
            Player.Functions.AddItem(FishingGrod, FishingGrodAmount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[FishingGrod], 'add', FishingGrodAmount)
            QBCore.Functions.Notify(src, Lang:t('notifysucces.successFishingGrod'), "success", 2000)
            TriggerClientEvent('qb-fishing:client:BuyingAnimition', src)
        else
            QBCore.Functions.Notify(src, Lang:t('notifyerror.errorNoCash'), 'error', 2000)
        end
    end
    -- FISHING BAIT
    if args == 2 then
        local FishingBaitAmount = 5
        local FishingBait = Config.FishBait
        local FishingBaitPrice = Config.FishBaitPrice
        if Player.Functions.RemoveMoney('cash', FishingBaitPrice) then
            Player.Functions.AddItem(FishingBait, FishingBaitAmount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[FishingBait], 'add', FishingBaitAmount)
            QBCore.Functions.Notify(src, Lang:t('notifysucces.successFishingBait'), "success", 2000)
            TriggerClientEvent('qb-fishing:client:BuyingAnimition', src)
        else
            QBCore.Functions.Notify(src, Lang:t('notifyerror.errorNoCash'), 'error', 2000)
        end
    end
end)

-- REWARD FISHING
RegisterNetEvent('qb-fishing:server:FishingReward')
AddEventHandler('qb-fishing:server:FishingReward', function(src)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amountReceived = 1
    local luck = math.random(1, 100)
    if luck >= 90 and luck <= 100 then
        Player.Functions.AddItem(Config.TriggerFish, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.TriggerFish], 'add', amount)
        QBCore.Functions.Notify(src, Lang:t('notifysucces.successRecievedTriggerFish'), "success", 2000)
    elseif luck >= 70 and luck <= 90 then
        Player.Functions.AddItem(Config.BlackfinTuna, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.BlackfinTuna], 'add', amount)
        QBCore.Functions.Notify(src, Lang:t('notifysucces.successRecievedBlackfinTuna'), "success", 2000)
    elseif luck >= 50 and luck <= 70 then
        Player.Functions.AddItem(Config.RuddIsolated, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RuddIsolated], 'add', amount)
        QBCore.Functions.Notify(src, Lang:t('notifysucces.successRecievedRuddIsolated'), "success", 2000)
    elseif luck >= 30 and luck <= 50 then
        Player.Functions.AddItem(Config.Salmon, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Salmon], 'add', amount)
        QBCore.Functions.Notify(src, Lang:t('notifysucces.successRecievedSalmon'), "success", 2000)
    else
        QBCore.Functions.Notify(src, Lang:t('notifyerror.errorDontHaveCatch'), "error", 2000)
    end
end)



-- SELL REWARD FISH
RegisterNetEvent('qb-fishing:server:SellItemFish')
AddEventHandler('qb-fishing:server:SellItemFish', function(args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local args = tonumber(args)
    local stillHaveItem = true
    local amountResources = 0
    local price = 0
    if args == 1 then 
        local BlackFinTunafish = Config.BlackfinTuna
        local BlackFinTunaPricefish = Config.BlackfinTunaPrice
        if BlackFinTunafish and Player.Functions.GetItemByName(BlackFinTunafish) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(BlackFinTunafish)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(BlackFinTunafish, 1)
                else
                    stillHaveItem = false
                    price = amountResources * BlackFinTunaPricefish
                end
            end
            TriggerClientEvent('qb-fishing:client:SellingAnimition', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[BlackFinTunafish], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources..Lang:t('notifysucces.successSellFish')..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("notifyerror.errorNoBlackFinTunafish"), "error", 1500)
        end
    end

    if args == 2 then 
        local RuddIsolatedfish = Config.RuddIsolated
        local RuddIsolatedPricefish = Config.BlackfinTunaPrice
        if RuddIsolatedfish and Player.Functions.GetItemByName(RuddIsolatedfish) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(RuddIsolatedfish)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(RuddIsolatedfish, 1)
                else
                    stillHaveItem = false
                    price = amountResources * RuddIsolatedPricefish
                end
            end
            TriggerClientEvent('qb-fishing:client:SellingAnimition', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[RuddIsolatedfish], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources..Lang:t('notifysucces.successSellFish')..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("notifyerror.errorNoRuddIsolatedfish"), "error", 1500)
        end
    end

    if args == 3 then 
        local Salmonfish = Config.Salmon
        local SalmonPricefish = Config.SalmonPrice
        if Salmonfish and Player.Functions.GetItemByName(Salmonfish) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(Salmonfish)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(Salmonfish, 1)
                else
                    stillHaveItem = false
                    price = amountResources * SalmonPricefish
                end
            end
            TriggerClientEvent('qb-fishing:client:SellingAnimition', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Salmonfish], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources..Lang:t('notifysucces.successSellFish')..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("notifyerror.errorNoSalmonfish"), "error", 1500)
        end
    end

    if args == 4 then 
        local TriggerFishfish = Config.TriggerFish
        local TriggerPricefish = Config.TriggerFishPrice
        if TriggerFishfish and Player.Functions.GetItemByName(TriggerFishfish) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(TriggerFishfish)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(TriggerFishfish, 1)
                else
                    stillHaveItem = false
                    price = amountResources * TriggerPricefish
                end
            end
            TriggerClientEvent('qb-fishing:client:SellingAnimition', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[TriggerFishfish], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources..Lang:t('notifysucces.successSellFish')..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("notifyerror.Triggerfish"), "error", 1500)
        end
    end
end)