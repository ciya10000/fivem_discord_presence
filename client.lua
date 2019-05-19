local appid = 'CHANGE ME'
local asset = 'logo'

function SetRP()
    local name = GetPlayerName(PlayerId())
    local id = GetPlayerServerId(PlayerId())
    local info =  " On foot"
    local playerspeed = math.floor((GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*3.6)) .. " KM/h"

    if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
        info = "Riding " .. playerspeed
        if playerspeed == "0 KM/h" then info = "In vehicle" end
    end

    SetRichPresence(name .. ' [' .. id .. '] ' .. info)
    SetDiscordAppId(appid)
    SetDiscordRichPresenceAsset(asset)
end

Citizen.CreateThread(function()
    
    SetRP()
    
    while true do
        Citizen.Wait(2500)
        SetRP()
    end

end)
