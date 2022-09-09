Config = {}

Config.Align = "center" --POSITION OF MENU "center" / "top-left" / "top-right"

--NOTIFICATION
Config.NYouSell = "You selled" --TXT WHEN HE BUYED
Config.NAndGot = "and received" --TXT WHEN PAYED
Config.NoAmount = "You don't have enought" --TXT WHEN NO MONEY
Config.NoItem = "You don't have" --TXT WHEN CANT CARRY MORE

--CONFIG BUTONS TEXT
Config.Button = "OPEN"
Config.Key = 0xD9D0E1C0 --KEY TO OPEN DEFAULT SPACE

Config.BuyIt = "Sell it"
Config.DescBuyIt = "Confirm and sell it"
Config.Confirm = "Confirm"

Config.Stores = {
["1"] = {
        name = "Merchant", -- STORE NAME
        desc = "Valentine Merchant",  -- DESCRIPTION SUB TITTLE
		positions = { 
        {x = -321.5598449707, y = 795.2798461914, z =  117.88627624512, h = 180.65058898926}, --VALENTINE   
        },    
        type = "seller", -- -- TYPE OF STORE food / items / tools = (LIKE TORCH, FISHINGROD) NO WEAPONS
        distance = 3.0, -- DISTANCE FROM MENU
        npcmodel = "S_M_M_UNIBUTCHERS_01", -- NPC MODEL
        blip = 819673798, -- BLIP SPRITE
        showblip = false, -- SHOW BLIP ?
items = {
	[1] = {
        item = "consumable_coffee", --NAME OF ITEM IN DATABASE
        label = "Coffee", -- NAME TO SHOW IN GAME
        price = 0.3, --PRICE OF FOOD
        desc = "A hot coffee ...", --DESCRIPTION OF FOOD
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [2] = {
        item = "consumable_peach",
        label = "Peach",
        price = 0.2,
        desc = "Grandma's peach",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [3] = {
        item = "consumable_kidneybeans_can",
        label = "Beans",
        price = 1.0,
        desc = "Canned beans",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [4] = {
        item = "consumable_chocolate",
        label = "Chocolate",
        price = 0.5,
        desc = "Chocolate bar",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [5] = {
        item = "apple",
        label = "Apple",
        price = 0.2,
        desc = "Grandma´s Apple",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [6] = {
        item = "beefjerky",
        label = "Pastrama",
        price = 2.0,
        desc = "Beef pastrami",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [7] = {
        item = "beer",
        label = "beer",
        price = 0.7,
        desc = "Beer Hopper 0.3",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [8] = {
        item = "consumable_bluegil",
        label = "Over",
        price = 0.3,
        desc = "Over cooking Bluegil",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [9] = {
        item = "consumable_breakfast",
        label = "Breakfast",
        price = 1.6,
        desc = "A healthy breakfast!",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [10] = {
        item = "consumable_caramel",
        label = "Caramel",
        price = 0.5,
        desc = "Glazed stick",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [11] = {
        item = "consumable_fruitsalad",
        label = "Fruit Salad",
        price = 1.2,
        desc = "A delicious salad!",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [12] = {
        item = "consumable_haycube",
        label = "Fan cube",
        price = 0.4,
        desc = "Horse food!",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [13] = {
        item = "consumable_meat_greavy",
        label = "Meat sauce",
        price = 0.8,
        desc = "It goes well with a little meat!",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [14] = {
        item = "consumable_raspberrywater",
        label = "Raspberry water",
        price = 0.4,
        desc = "A 100% natural raspberry syrup!",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [15] = {
        item = "consumable_salmon",
        label = "Salmon",
        price = 1.3,
        desc = "Over cooking! Fresh!",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [16] = {
        item = "consumable_trout",
        label = "Trout",
        price = 1.1,
        desc = "Over cooking! Fresh!",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [17] = {
        item = "consumable_veggies",
        label = "vegetables",
        price = 0.5,
        desc = "Vegetables from the garden!",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [18] = {
        item = "corn",
        label = "Maize",
        price = 0.2,
        desc = "To catch the horse power ..",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [19] = {
        item = "milk",
        label = "Milk",
        price = 0.2,
        desc = "cow's milk!",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [20] = {
        item = "water",
        label = "flat water",
        price = 0.3,
        desc = "0.5L flat water",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [21] = {
        item = "consumable_pear",
        label = "Pear",
        price = 0.2,
        desc = "Good tuica pears!",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [22] = {
        item = "stim",
        label = "Stimulant",
        price = 1.0,
        desc = "Stimulant for your horse.",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [23] = {
        item = "carrots",
        label = "Carrots",
        price = 0.4,
        desc = "Something good for the horse..",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [24] = {
        item = "potato",
        label = "Potato",
        price = 0.2,
        desc = "Romanian potato ..",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
	},
    [25] = {
        item = "coffeebeans",
        label = "Coffee beans",
        price = 0.3,
        desc = "Grinding coffee...",
        type = "item",       
		objects = "" -- OBJECT TO SPAWN ( AVAILABLE IN THE NEXT UPDATE )
    	}   
	}
},
}