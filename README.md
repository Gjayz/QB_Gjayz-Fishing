<div align="center">
<img width="100%" height = "100px" src="https://scontent.fdvo5-1.fna.fbcdn.net/v/t1.6435-9/120739533_785949515550660_8312183665269487160_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=300f58&_nc_ohc=PzPY4YC6bwgAX98YuTT&_nc_ht=scontent.fdvo5-1.fna&oh=00_AfAM6IiMS_PW-Vx-cvf3YRXIO5kfW2Tmor_PwC84KkO7AA&oe=6588CC17" alt="cover" />
</div>


## Dependencies
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory) --- For Removing and Carry
- [qb-core](https://github.com/qbcore-framework/qb-core) --- Main Frameworks
- [qb-target](https://github.com/BerkieBb/qb-target) ----Target Fucntion
- [qb-menu](https://github.com/qbcore-framework/qb-menu) ---- For Menu
- [ps-UI](https://github.com/Project-Sloth/ps-ui) -- For UI
- [PolyZone](https://github.com/mkafrin/PolyZone) -- For Poly Fish Zone And Target Zone


## Fishing Job

## Put Items (qb-core/shared/item.lua)
    -- QB Gjayz Fishing
	fishingrod		             = {name = 'fishingrod', 				    label = 'Fish Grod', 			                    weight = 1000, 		type = 'item', 		image = 'fishingrod.png', 			    unique = true, 		useable = true, 	shouldClose = true,	       combinable = nil,          description = 'Fish Grod Yeah!'},
	fishbait			         = {name = 'fishbait', 				        label = 'Fish Bait', 			                    weight = 100, 		type = 'item', 		image = 'fishbait.png', 			    unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,          description = 'Fish Bait Yeah!'},
	blackfin_tuna 			     = {name = 'blackfin_tuna', 				label = 'Blackfin Tuna', 			                weight = 500, 	    type = 'item', 	    image = 'blackfin_tuna.png', 			unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,          description = 'Blackfin Tuna Yeah!'},
    rudd_isolated 			     = {name = 'rudd_isolated', 				label = 'Rudd Isolated', 			                weight = 500, 	    type = 'item', 	    image = 'rudd_isolated.png', 			unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,          description = 'Rudd Isolated Yeah!'},
    salmon 			             = {name = 'salmon', 				        label = 'Salmon', 			                        weight = 500, 	    type = 'item', 	    image = 'salmon.png', 			        unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,          description = 'Salmon Yeah!'},
    trigger_fish 			     = {name = 'trigger_fish', 				    label = 'Trigger Fish', 			                weight = 500, 	    type = 'item', 	    image = 'trigger_fish.png', 			unique = false, 	useable = false, 	shouldClose = false,	   combinable = nil,          description = 'Trigger Fish Yeah!'},

## Put Image (/qb-inventory/html/images)
