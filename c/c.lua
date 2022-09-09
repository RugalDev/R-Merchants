local VORPCore = {}
local prompts = GetRandomIntInRange(0, 0xffffff)
local npcs = {}
local blips = {}

Citizen.CreateThread(function()
    while not VORPCore do        
        TriggerEvent("getCore", function(core)
            VORPCore = core       
        end)
        Citizen.Await(200)   
    end
print("R-Stores Loading... !")
STARTING()     
end)

Citizen.CreateThread(function()
while true do
        Wait(1)
        local canwait = true
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
for k,v in pairs(Config.Stores) do
            local positions = v.pos
            for k, s in pairs(v.positions) do
            local dist =  Vdist(coords, s.x, s.y, s.z)
            if dist or dist2 < 20 then
               canwait = false
            end      
	if dist < v.distance  then  
                    canwait = false
                	local label  = CreateVarString(10, 'LITERAL_STRING', v.name)
                	PromptSetActiveGroupThisFrame(prompts, label)
                	if Citizen.InvokeNative(0xC92AC953F0A982AE, openShop) then
                    local store = v    
                    local items = v.items
                   	SELLIT(store, items)
                	end
	end 
    end                
end
	if canwait then
	Wait(1000)
	end             
end       
end)

MenuData = {}
TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)

function SELLIT(store, items)
    local s = store
	local elements = {} 
    local total = 0
	local price = 0
	local qty = 0
    local tip = false
	for k, v in pairs(items) do
    table.insert(elements, {label = (('%s <span style="color:MediumSeaGreen;">[ $%s ]</span>'):format(v.label,v.price)), name = v.label, price = v.price, item = v.item, typ = v.type, desc = "<div style='display: flex;align-items: center;justify-content: space-evenly;flex-direction: row;align-content: center;'<p>"..v.desc.."</p></center> <img style='max-height: 50px;max-width: 50px;' src='nui://vorp_inventory/html/img/items/"..v.item..".png'></div>" , value = 0})
    MenuData.CloseAll()
    MenuData.Open('default', GetCurrentResourceName(), 'food_menu',
    {title = s.name, subtext = s.desc,  align = Config.Align, elements = elements},
    function(data, menu)
		price = data.current.price
        item = data.current.item
        label = data.current.name
        tip = data.current.typ        
        MenuData.Open('default', GetCurrentResourceName(), 'foods_menu',           
		{title = s.name, subtext = s.desc, align = Config.Align,        
        elements = {
        {label = label.." "..price.." $", cant = "add", value = 0, price = v.price, desc = v.desc, type = "slider" , min = 0 , max = 100, hop= 1},               
		{label = Config.BuyIt.." "..total.. " $", desc = Config.DescBuyIt, value = "buy"},
        }
        },
    	function(data2, menu2) 
        	if data2.current.cant == "add" then            
    		   qty = data2.current.value
               total = (tonumber(price) * tonumber(qty))
               --total = total
            elseif data2.current.value == "buy" then  
              	MenuData.Open('default', GetCurrentResourceName(), 'foodsss_menu',           
				{title = s.name, subtext = s.desc, align = Config.Align,     
        		elements = {
        		{label = label.." "..price.." $", value = qty, price = v.price, butt = "add", desc = v.desc, type = "slider" , min = 0 , max = 100, hop= 1},    
				{label = Config.Confirm.." "..total.. " $", desc = Config.DescBuyIt, butt = "buy"},
        		}
       			 },
    			function(data3, menu3)   
                       if data3.current.butt == "buy" then              
               			TriggerServerEvent("T-MAGAZIN:SELLIT", total, item, qty, label, tip)
                            menu3.close()
                            menu2.close()
                            typ = false            
                			qty = 0
    						price = 0
    						total = 0                           
                       else
                       menu3.close()                     
                       end                                       
                end, function(data3, menu3)
    			menu3.close()
				end)                      
            end         
 		end, function(data2, menu2)
    	menu2.close()
        typ = false            
        qty = 0
    	price = 0
    	total = 0                   
		end)                                             
	end, function(data, menu)
    menu.close()
	end)              
	end     
end                 

function STARTING()
    for k, v in pairs(Config.Stores) do
        loadModel(v.npcmodel)
        if v.type == "seller" then
            for k, j in pairs(v.positions) do
            local npc = CreatePed(v.npcmodel, j.x, j.y, j.z, j.h, false, true, true, true)
        	Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
            SetEntityCanBeDamaged(npc, false)
            SetEntityInvincible(npc, true)
            Wait(500)
            FreezeEntityPosition(npc, true) -- NPC can't escape
            SetBlockingOfNonTemporaryEvents(npc, true) -- NPC can't be scared
        	Wait(500)
            if v.showblip then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, j.x, j.y, j.z)
            SetBlipSprite(blip, v.blip, 1)
            SetBlipScale(blip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.name)
        	table.insert(blips, {blip=blip,coords = vector3(j.x, j.y, j.z)})
            end
            table.insert(npcs, {npc=npc, coords = vector3(j.x, j.y, j.z)})
            end
       end     
    end
end

function loadModel(model)
    local model = GetHashKey(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(100)
    end
end
   
Citizen.CreateThread(function()
    Citizen.Wait(5000)
    local str = Config.Button
	openShop = PromptRegisterBegin()
	PromptSetControlAction(openShop, Config.Key)
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(openShop, str)
	PromptSetEnabled(openShop, 1)
	PromptSetVisible(openShop, 1)
	PromptSetStandardMode(openShop,1)
    PromptSetHoldMode(openShop, 1)
	PromptSetGroup(openShop, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,openShop,true)
	PromptRegisterEnd(openShop)
end)

AddEventHandler("onResourceStop",function(resourceName)
if resourceName == GetCurrentResourceName() then
print("CLEAR")
for k,v in pairs(npcs) do 
DeleteEntity(v.npc)
DeletePed(v.npc)                
end
for k,v in pairs(blips) do 
RemoveBlip(v.blip)              
end            
end
end)