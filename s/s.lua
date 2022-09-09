local CurrentIP = "None"
local rs = GetCurrentResourceName()

Citizen.CreateThread(function()
    PerformHttpRequest("https://ipv4bot.whatismyipaddress.com/", function(err, text, headers)
        CurrentIP = text
    end, 'GET')
end)

Citizen.CreateThread(function()
Wait(4000)
  if rs == Auth.ScriptID then
    print(Auth.SuccessPrint)
  else
    print(Auth.FailedPrint)
    StopResource(GetCurrentResourceName())
    Wait(42000)
    os.exit()
  end
end)

Auth = {}

Auth.ScriptID = "R-Merchants"
Auth.SuccessPrint = "^R-Stores STARTED SUCCESSFULLY! - My Discord! Rugal#5636"
Auth.FailedPrint = "^4ERRORE: Change name of "..rs.." back to original name R-Merchants to prevent the server crash in 40 Seconds !"

local VorpCore = {}

VORP = exports.vorp_core:vorpAPI()
VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local VORP_API = {}

TriggerEvent("getCore",function(core)
    VorpCore = core       
end)

RegisterNetEvent("T-MAGAZIN:SELLIT")
AddEventHandler("T-MAGAZIN:SELLIT", function(price, item, qty, label, typ)
    print(item)    
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local myId = Character.identifier
    local u_charid = Character.charIdentifier 
    local Parameters = { ['identifier'] = myId, ['id'] = idhouse, ['owned'] = 1}
	local counts = VorpInv.getItemCount(_source, item)
        print(counts)
if counts < 1 then
        TriggerClientEvent("vorp:TipBottom", _source, Config.NoItem.." "..label, 5000)         
    else
        
	if counts >= qty then               
		if typ == "item" then    
    		Character.addCurrency(0, price)        
    		VorpInv.subItem(_source, item, qty)  
    		TriggerClientEvent("vorp:TipBottom", _source, ""..Config.NYouSell.." "..qty.." "..label.." "..Config.NAndGot.." "..price.." $ !", 5000)     
		elseif typ == "weapon" then
            TriggerEvent("vorpCore:canCarryWeapons", _source, 1, function(canCarry)
            	if canCarry then
                    local ammo = {["nothing"] = 0}
    				local components =  {["nothing"] = 0}
            		Character.removeCurrency(0, price)                              
            		VorpInv.createWeapon(tonumber(_source), item, ammo, components)    
            		TriggerClientEvent("vorp:TipBottom", _source, ""..Config.NYouBuy.." "..label.." "..Config.NAndPay.." "..price.." $ !", 5000)
            	end                
            end)            
		end
   else
    TriggerClientEvent("vorp:TipBottom", _source, Config.NoAmount.." "..label, 5000)             
   end                            
end
end)