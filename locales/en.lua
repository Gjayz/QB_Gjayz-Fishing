local Translations = {
    label = {
        BuyItem = 'Buy Fishing Item!',
        SellFish = 'Sell Fish Item',  
    },
    haader = {
        BuyMenu = 'Buy Fishing Item',
        SellMenu = 'Sell Fish Item',
        BuyFishGrod = 'Fishing Grod',
        BuyFishBait = 'Fish Bait',

        SellFishBlackFin = 'Sell Black Fin Fish',
        SellFishRuddIsolated = 'Sell Rudd Isolated Fish',
        SellFishSalmon = 'Sell Salmon Fish',
        SellFishTrigger = 'Sell Trigger Fish',

        StartFishing = 'Start Fishing',


        StartSell = 'Start To Sell Fish',
        StartBuy = 'Start To Buy Item',
        
        PressStart = "Press [E] to Catch Fish!",

        CloseMenu = 'Close',
    },
    txt = {
        PriceFishGrod = 'Price: 3500$',
        PriceFishBait = 'Price: 100$',

        PriceFishBlackFin = 'Price: 100$',
        PriceFishRuddIsolated = 'Price: 100$',
        PriceFishSalmo = 'Price: 100$',
        PriceFishTrigger = 'Price: 800$',
    }, 
    notifyerror = {
        errorFrishingGrod = 'Don`t Have Fishing Rod',
        errorFrishingBait = 'Don`t Have Fishing Bait',
        errorPedSwimming = 'Your Are Swimming',
        errorPedDriving = 'Your Are Driving',

        errorNoBlackFinTunafish = 'Don`t Have Black Fin Tuna',
        errorNoRuddIsolatedfish = 'Don`t Have Rudd Isolated',
        errorNoSalmonfish = 'Don`t Have Salmon',
        Triggerfish = 'Don`t Have Trigger',
        errorTryAgian = 'Try Again',
        errorDontHaveCatch = 'Try Again Dont Have Catch',
        errorNoCash = 'Don`t Have Cash',


    },
    notifysucces = {
        successFishingGrod = 'Added 1 Fishing Rod to Inventory',
        successFishingBait = 'Added 5 Fishing Bait to Inventory',
        
        successRecievedBlackfinTuna = 'You Recieved Blackfin Tuna',
        successRecievedTriggerFish = 'You Recieved Trigger Fish',
        successRecievedRuddIsolated = 'You Recieved Rudd Isolated',
        successRecievedSalmon = 'You Recieved Salmon',

        successSellFish = ' gold sold for $',
    },

}


Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})