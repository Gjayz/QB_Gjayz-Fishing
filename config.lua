-- CONFIG
Config = Config or {}

-- UseBlips
Config.UseBlips = true
Config.FishingWaitTime = math.random(15000, 30000)

-- ALL ITEMS 
Config.FishingGrod = 'fishingrod'
Config.FishBait = 'fishbait'

-- FISH
Config.BlackfinTuna = 'blackfin_tuna'
Config.RuddIsolated = 'rudd_isolated'
Config.Salmon = 'salmon'
Config.TriggerFish = 'trigger_fish'

-- All PRICE
Config.FishingGrodPrice = 3500
Config.FishBaitPrice = 100

-- SELL PRICE
Config.BlackfinTunaPrice = 100
Config.RuddIsolatedPrice =  100
Config.SalmonPrice = 100
Config.TriggerFishPrice = 800

-- PED LOCATION
Config.PEDLOCATION = {
    [1] = {
        coords = vector4(-1842.22, -1199.06, 14.3, 234.11),
        model = 'a_m_m_rurmeth_01',
        scenario = 'WORLD_HUMAN_AA_SMOKE',
    },
    [2] = {
        coords = vector4(-3424.43, 957.51, 8.35, 88.6),
        model = 'a_m_m_rurmeth_01',
        scenario = 'WORLD_HUMAN_AA_SMOKE',
    },
    [3] = {
        coords = vector4(3817.05, 4483.02, 6.37, 204.79),
        model = 'a_m_m_rurmeth_01',
        scenario = 'WORLD_HUMAN_AA_SMOKE',
    },
}


-- ALL BLIPS
Config.ALLBLIPS = {
    -- Buy Sell Fishing
    [1] = {
        coords = vector4(-1842.22, -1199.06, 14.3, 234.11),
        SetBlipSprite = 391,
        SetBlipDisplay = 6,
        SetBlipScale = 0.90,
        SetBlipColour = 21,
        BlipName = 'Buy & Sell Fishing Item',
    },
    [2] = {
        coords = vector4(-3424.43, 957.51, 8.35, 88.6),
        SetBlipSprite = 391,
        SetBlipDisplay = 6,
        SetBlipScale = 0.90,
        SetBlipColour = 21,
        BlipName = 'Buy & Sell Fishing Item',
    },
    [3] = {
        coords = vector4(3817.05, 4483.02, 6.37, 204.79),
        SetBlipSprite = 391,
        SetBlipDisplay = 6,
        SetBlipScale = 0.90,
        SetBlipColour = 21,
        BlipName = 'Buy & Sell Fishing Item',
    },



    -- Fishing Spot
    [4] = {
        coords = vector4(-1846.28, -1253.77, 8.62, 138.12),
        SetBlipSprite = 317,
        SetBlipDisplay = 6,
        SetBlipScale = 0.90,
        SetBlipColour = 29,
        BlipName = 'Fishing Spot',
    },
    [5] = {
        coords = vector4(-3428.39, 967.62, 8.35, 79.74),
        SetBlipSprite = 317,
        SetBlipDisplay = 6,
        SetBlipScale = 0.90,
        SetBlipColour = 29,
        BlipName = 'Fishing Spot',
    },
    
    [6] = {
        coords = vector4(3854.6, 4458.44, 1.85, 187.66),
        SetBlipSprite = 317,
        SetBlipDisplay = 6,
        SetBlipScale = 0.90,
        SetBlipColour = 29,
        BlipName = 'Fishing Spot',
    },
}


-- Target Ped Spost
Config.PedLocationTarget = {
    [1] = {
        name = 'Buy And Sell',
        coords = vector3(-1842.09, -1199.12, 14.3),
        heading=335,
        minZ=11.1,
        maxZ=15.1
    },
    [2] = {
        name = 'Buy And Sell',
        coords = vector3(-3424.41, 957.48, 8.35),
        heading=0,
        minZ=5.15,
        maxZ=9.15
    },
    [3] = {
        name = 'Buy And Sell',
        coords = vector3(3817.02, 4483.05, 6.16),
        heading=25,
        minZ=2.96,
        maxZ=6.96
    },
}



Config.SpotFish = {
    {       
        --Fish Zone 1
        name = 'Fishing Spot One',
        zones = {
            vector2(-1827.3028564453, -1270.7658691406),
            vector2(-1826.7158203125, -1269.6873779297),
            vector2(-1865.3140869141, -1237.1881103516),
            vector2(-1866.0438232422, -1237.9040527344)
        },
        minZ = 8.6157789230347,
        maxZ = 9.6157789230347
    },
    {       
        --Fish Zone 2
        name = 'Fishing Spot Two',
        zones = {
            vector2(-3429.2900390625, 976.09558105469),
            vector2(-3428.9079589844, 956.02978515625),
            vector2(-3428.1945800781, 956.09606933594),
            vector2(-3427.9973144531, 976.12170410156)
        },
        minZ = 8.3466835021973,
        maxZ = 9.571756362915
    },
    {       
        --Fish Zone 3
        name = 'Fishing Spot Three',
        zones = {
            vector2(3850.0166015625, 4461.4887695312),
            vector2(3849.4826660156, 4457.5595703125),
            vector2(3860.2436523438, 4456.4633789062),
            vector2(3860.2993164062, 4459.4526367188),
            vector2(3859.4291992188, 4459.4741210938),
            vector2(3859.1884765625, 4458.6162109375),
            vector2(3850.6650390625, 4458.880859375),
            vector2(3850.9724121094, 4460.9291992188)
        },
        minZ = 1.7683719396591,
        maxZ = 2.0742633342743
    },
    
}