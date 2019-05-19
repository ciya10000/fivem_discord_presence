local appid = 'CHANGE ME'
local asset = 'CHANGE ME'

function Presence()
    local name = GetPlayerName(PlayerId())
    local id = GetPlayerServerId(PlayerId())
    local info
    local playerspeed = math.floor((GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*3.6)) .. " KM/h"

    if info == nil then info = " On foot" end

    if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
        info = "Riding vehicle " .. playerspeed
        if playerspeed == "0 KM/h" then info = "In vehicle" end
    end

    SetRichPresence(name .. ' [' .. id .. '] ' .. info)
    SetDiscordAppId(appid)
    SetDiscordRichPresenceAsset(asset)
end

Citizen.CreateThread(function()
    
    Presence()
    
    while true do
        Citizen.Wait(2500)
        Presence()
    end

end)