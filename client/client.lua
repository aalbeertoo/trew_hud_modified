ESX = nil
local Poslao = -69

-- ESX
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
    while ESX.GetPlayerData().job == nil do Citizen.Wait(100) end
    ESX.PlayerData = ESX.GetPlayerData()
    OnStart(ESX.PlayerData)
end)

local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

local AllWeapons = json.decode(
                       '{"melee":{"dagger":"0x92A27487","bat":"0x958A4A8F","bottle":"0xF9E6AA4B","crowbar":"0x84BD7BFD","unarmed":"0xA2719263","flashlight":"0x8BB05FD7","golfclub":"0x440E4788","hammer":"0x4E875F73","hatchet":"0xF9DCBF2D","knuckle":"0xD8DF3C3C","knife":"0x99B507EA","machete":"0xDD5DF8D9","switchblade":"0xDFE37640","nightstick":"0x678B81B1","wrench":"0x19044EE0","battleaxe":"0xCD274149","poolcue":"0x94117305","stone_hatchet":"0x3813FC08"},"handguns":{"pistol":"0x1B06D571","pistol_mk2":"0xBFE256D4","combatpistol":"0x5EF9FEC4","appistol":"0x22D8FE39","stungun":"0x3656C8C1","pistol50":"0x99AEEB3B","snspistol":"0xBFD21232","snspistol_mk2":"0x88374054","heavypistol":"0xD205520E","vintagepistol":"0x83839C4","flaregun":"0x47757124","marksmanpistol":"0xDC4DB296","revolver":"0xC1B3C3D1","revolver_mk2":"0xCB96392F","doubleaction":"0x97EA20B8","raypistol":"0xAF3696A1"},"smg":{"microsmg":"0x13532244","smg":"0x2BE6766B","smg_mk2":"0x78A97CD0","assaultsmg":"0xEFE7E2DF","combatpdw":"0xA3D4D34","machinepistol":"0xDB1AA450","minismg":"0xBD248B55","raycarbine":"0x476BF155"},"shotguns":{"pumpshotgun":"0x1D073A89","pumpshotgun_mk2":"0x555AF99A","sawnoffshotgun":"0x7846A318","assaultshotgun":"0xE284C527","bullpupshotgun":"0x9D61E50F","musket":"0xA89CB99E","heavyshotgun":"0x3AABBBAA","dbshotgun":"0xEF951FBB","autoshotgun":"0x12E82D3D"},"assault_rifles":{"assaultrifle":"0xBFEFFF6D","assaultrifle_mk2":"0x394F415C","carbinerifle":"0x83BF0278","carbinerifle_mk2":"0xFAD1F1C9","advancedrifle":"0xAF113F99","specialcarbine":"0xC0A3098D","specialcarbine_mk2":"0x969C3D67","bullpuprifle":"0x7F229F94","bullpuprifle_mk2":"0x84D6FAFD","compactrifle":"0x624FE830"},"machine_guns":{"mg":"0x9D07F764","combatmg":"0x7FD62962","combatmg_mk2":"0xDBBD7280","gusenberg":"0x61012683"},"sniper_rifles":{"sniperrifle":"0x5FC3C11","heavysniper":"0xC472FE2","heavysniper_mk2":"0xA914799","marksmanrifle":"0xC734385A","marksmanrifle_mk2":"0x6A6C02E0"},"heavy_weapons":{"rpg":"0xB1CA77B1","grenadelauncher":"0xA284510B","grenadelauncher_smoke":"0x4DD2DC56","minigun":"0x42BF8A85","firework":"0x7F7497E5","railgun":"0x6D544C99","hominglauncher":"0x63AB0442","compactlauncher":"0x781FE4A","rayminigun":"0xB62D1F67"},"throwables":{"grenade":"0x93E220BD","bzgas":"0xA0973D5E","smokegrenade":"0xFDBC8A50","flare":"0x497FACC3","molotov":"0x24B17070","stickybomb":"0x2C3731D9","proxmine":"0xAB564B93","snowball":"0x787F0BB","pipebomb":"0xBA45E8B8","ball":"0x23C9F95C"},"misc":{"petrolcan":"0x34A67B97","fireextinguisher":"0x60EC506","parachute":"0xFBAB5776"}}')

local vehiclesCars = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 17, 18, 19, 20};

-- Hides TREW UI when it's on Pause Menu
Citizen.CreateThread(function()

    local isPauseMenu = false

    while true do
        Citizen.Wait(0)

        if IsPauseMenuActive() then -- ESC Key
            if not isPauseMenu then
                isPauseMenu = not isPauseMenu
                SendNUIMessage({action = 'toggleUi', value = false})
            end
        else
            if isPauseMenu then
                isPauseMenu = not isPauseMenu
                SendNUIMessage({action = 'toggleUi', value = true})
            end

            HideHudComponentThisFrame(1) -- Wanted Stars
            HideHudComponentThisFrame(2) -- Weapon Icon
            HideHudComponentThisFrame(3) -- Cash
            HideHudComponentThisFrame(4) -- MP Cash
            HideHudComponentThisFrame(6) -- Vehicle Name
            HideHudComponentThisFrame(7) -- Area Name
            HideHudComponentThisFrame(8) -- Vehicle Class
            HideHudComponentThisFrame(9) -- Street Name
            HideHudComponentThisFrame(13) -- Cash Change
            HideHudComponentThisFrame(17) -- Save Game
            HideHudComponentThisFrame(20) -- Weapon Stats
        end

    end
end)

--[[
-- Date and time update
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if Config.ui.showDate == true then SendNUIMessage({action = 'setText', id = 'date', value = trewDate()}) end
    end
end)
]]
-- ID
Citizen.CreateThread(function()
	local id = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
	while true do
		Citizen.Wait(1000)
		SendNUIMessage({ action='setText', id='userID', value= 'ID:  '   ..id})
	end
end)


-- Vehicle Info
local vehicleCruiser
local vehicleSignalIndicator = 'off'
local seatbeltEjectSpeed = 45.0
local seatbeltEjectAccel = 100.0
local seatbeltIsOn = false
local currSpeed = 0.0
local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}

-- Player status
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local playerStatus
        local showPlayerStatus = 0
        playerStatus = {action = 'setStatus', status = {}}
        if Config.ui.showHealth == true then
            showPlayerStatus = (showPlayerStatus + 1)
            playerStatus['isdead'] = false
            playerStatus['status'][showPlayerStatus] = {name = 'health', value = GetEntityHealth(GetPlayerPed(-1)) - 100}
            if IsEntityDead(GetPlayerPed(-1)) then playerStatus.isdead = true end
        end
        if Config.ui.showArmor == true then
            showPlayerStatus = (showPlayerStatus + 1)
            playerStatus['status'][showPlayerStatus] = {name = 'armor', value = GetPedArmour(GetPlayerPed(-1))}
        end
        if Config.ui.showStamina == true then
            showPlayerStatus = (showPlayerStatus + 1)
            playerStatus['status'][showPlayerStatus] = {name = 'stamina', value = 100 - GetPlayerSprintStaminaRemaining(PlayerId())}
        end
        if showPlayerStatus > 0 then SendNUIMessage(playerStatus) end
    end
end)

-- Overall Info

RegisterNetEvent("es:activateMoney")
AddEventHandler('es:activateMoney', function(m)
    SendNUIMessage({action = 'setMoney', id = 'wallet', value = m})
end)

RegisterNetEvent("esx:setAccountMoney")
AddEventHandler('esx:setAccountMoney', function(account)
    if account.name == "money" then
        SendNUIMessage({action = 'setMoney', id = 'wallet', value = account.money})
    elseif account.name == "bank" then
        SendNUIMessage({action = 'setMoney', id = 'bank', value = account.money})
    elseif account.name == "black_money" then
        SendNUIMessage({action = 'setMoney', id = 'blackMoney', value = account.money})
    end
end)

--[[ RegisterNetEvent('trew_hud_ui:setInfo')
AddEventHandler('trew_hud_ui:setInfo', function(info)	
    SendNUIMessage({action = 'setText', id = 'job', value = info['job']})
    SendNUIMessage({action = 'setMoney', id = 'wallet', value = info['money']})
    SendNUIMessage({action = 'setMoney', id = 'bank', value = info['bankMoney']})
    SendNUIMessage({action = 'setMoney', id = 'blackMoney', value = info['blackMoney']})
    TriggerEvent('esx:getSharedObject', function(obj)
        ESX = obj
        ESX.PlayerData = ESX.GetPlayerData()
    end)
    if ESX.PlayerData.job ~= nil then
        if ESX.PlayerData.job.grade_name ~= nil and (ESX.PlayerData.job.grade_name == 'boss') then
            if (Config.ui.showSocietyMoney == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'society'}) end
        else
            SendNUIMessage({action = 'element', task = 'disable', value = 'society'})
        end
    end
end)]]

RegisterNetEvent("esx:setJob")
AddEventHandler('esx:setJob', function(job) SetJob(job) end)

AddEventHandler('esx_status:onTick', function(basics)
    if basics == nil then return end
    local variable = {action = 'setStatus', status = {}}
    local items = 0;
    for k, v in pairs(basics) do
        if v.name == 'hunger' then
            items = items + 1
            variable['status'][items] = {name = 'hunger', value = math.floor(100 - v.percent)}
        elseif v.name == 'thirst' then
            items = items + 1
            variable['status'][items] = {name = 'thirst', value = math.floor(100 - v.percent)}
        end
    end
    if items > 0 then SendNUIMessage(variable) end
end)

-- Voice detection and distance
--[[
Citizen.CreateThread(function()

    if Config.ui.showVoice == true then

        RequestAnimDict('facials@gen_male@variations@normal')
        RequestAnimDict('mp_facial')

        while true do
            Citizen.Wait(300)
            local playerID = PlayerId()

            for _, player in ipairs(GetActivePlayers()) do
                local boolTalking = NetworkIsPlayerTalking(player)

                if player ~= playerID then
                    if boolTalking then
                        PlayFacialAnim(GetPlayerPed(player), 'mic_chatter', 'mp_facial')
                    elseif not boolTalking then
                        PlayFacialAnim(GetPlayerPed(player), 'mood_normal_1', 'facials@gen_male@variations@normal')
                    end
                end
            end
        end

    end
end)
]]
Citizen.CreateThread(function()
    if Config.ui.showVoice == true then
        local isTalking = false
		local voiceDistance = nil
        while true do
            Citizen.Wait(1)
            if NetworkIsPlayerTalking(PlayerId()) and not isTalking then 
				isTalking = not isTalking
				SendNUIMessage({ action = 'isTalking', value = isTalking })
			elseif not NetworkIsPlayerTalking(PlayerId()) and isTalking then 
				isTalking = not isTalking
				SendNUIMessage({ action = 'isTalking', value = isTalking })
			end
            if IsControlJustPressed(1, Keys['H']) then
                Config.voice.levels.current = (Config.voice.levels.current + 1) % 3
                if Config.voice.levels.current == 0 then
                    voiceDistance = 'normal'
                elseif Config.voice.levels.current == 1 then
                    voiceDistance = 'shout'
                elseif Config.voice.levels.current == 2 then
                    voiceDistance = 'whisper'
                end
                SendNUIMessage({action = 'setVoiceDistance', value = voiceDistance})
            end
            if Config.voice.levels.current == 0 then
                voiceDistance = 'normal'
            elseif Config.voice.levels.current == 1 then
                voiceDistance = 'shout'
            elseif Config.voice.levels.current == 2 then
                voiceDistance = 'whisper'
            end
        end
    end
end)

-- Weapons
Citizen.CreateThread(function()
    if Config.ui.showWeapons == true then
        while true do
            Citizen.Wait(1000)

            local player = GetPlayerPed(-1)
            local status = {}

            if IsPedArmed(player, 7) then

                local weapon = GetSelectedPedWeapon(player)
                local ammoTotal = GetAmmoInPedWeapon(player, weapon)
                local bool, ammoClip = GetAmmoInClip(player, weapon)
                local ammoRemaining = math.floor(ammoTotal - ammoClip)

                status['armed'] = true

                for key, value in pairs(AllWeapons) do

                    for keyTwo, valueTwo in pairs(AllWeapons[key]) do
                        if weapon == GetHashKey('weapon_' .. keyTwo) then
                            status['weapon'] = keyTwo

                            if key == 'melee' then
                                SendNUIMessage({action = 'element', task = 'disable', value = 'weapon_bullets'})
                                SendNUIMessage({action = 'element', task = 'disable', value = 'bullets'})
                            else
                                if keyTwo == 'stungun' then
                                    SendNUIMessage({action = 'element', task = 'disable', value = 'weapon_bullets'})
                                    SendNUIMessage({action = 'element', task = 'disable', value = 'bullets'})
                                else
                                    SendNUIMessage({action = 'element', task = 'enable', value = 'weapon_bullets'})
                                    SendNUIMessage({action = 'element', task = 'enable', value = 'bullets'})
                                end
                            end

                        end
                    end

                end

                SendNUIMessage({action = 'setText', id = 'weapon_clip', value = ammoClip})
                SendNUIMessage({action = 'setText', id = 'weapon_ammo', value = ammoRemaining})

            else
                status['armed'] = false
            end

            SendNUIMessage({action = 'updateWeapon', status = status})

        end
    end
end)


Citizen.CreateThread(function()

    while true do
        Citizen.Wait(0)

        local player = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(player, false)
        local vehicleClass = GetVehicleClass(vehicle)

        -- Vehicle Seatbelt
        if IsPedInAnyVehicle(player, false) and GetIsVehicleEngineRunning(vehicle) then
            if IsControlJustReleased(0, Keys[Config.vehicle.keys.seatbelt]) and
                (has_value(vehiclesCars, vehicleClass) == true and vehicleClass ~= 8) then seatbeltIsOn = not seatbeltIsOn end
        end

        -- Vehicle Cruiser
        if IsControlJustPressed(1, Keys[Config.vehicle.keys.cruiser]) and GetPedInVehicleSeat(vehicle, -1) == player and
            (has_value(vehiclesCars, vehicleClass) == true) then

            local vehicleSpeedSource = GetEntitySpeed(vehicle)

            if vehicleCruiser == 'on' then
                vehicleCruiser = 'off'
                SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel"))

            else
                vehicleCruiser = 'on'
                SetEntityMaxSpeed(vehicle, vehicleSpeedSource)
            end
        end
    end
end)

AddEventHandler('onClientMapStart', function()

    SendNUIMessage({action = 'ui', config = Config.ui})
    SendNUIMessage({action = 'setFont', url = Config.font.url, name = Config.font.name})
    SendNUIMessage({action = 'setLogo', value = Config.serverLogo})
--[[
    if Config.ui.showVoice == true then
        if Config.voice.levels.current == 0 then
            NetworkSetTalkerProximity(Config.voice.levels.default)
        elseif Config.voice.levels.current == 1 then
            NetworkSetTalkerProximity(Config.voice.levels.shout)
        elseif Config.voice.levels.current == 2 then
            NetworkSetTalkerProximity(Config.voice.levels.whisper)
        end
    end]]
end)

AddEventHandler('playerSpawned', function()
    --if Config.ui.showVoice == true then NetworkSetTalkerProximity(5.0) end
    HideHudComponentThisFrame(7) -- Area
    HideHudComponentThisFrame(9) -- Street
    HideHudComponentThisFrame(6) -- Vehicle
    HideHudComponentThisFrame(3) -- SP Cash
    HideHudComponentThisFrame(4) -- MP Cash
    HideHudComponentThisFrame(13) -- Cash changes!
    SetJob(ESX.PlayerData.job)
end)

--[[
    function trewDate()
    local timeString = nil

    local year, month, day, houra, minutes, second = GetLocalTime()

    local hour = houra + 1

    local time = nil
    local AmPm = ''
    local userID = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))

    if Config.date.AmPm == true then

        if hour >= 13 and hour <= 24 then
            hour = hour - 12
            AmPm = 'PM'
        else
            if hour == 0 or hour == 24 then hour = 12 end
            AmPm = 'AM'
        end

    end

    if hour <= 9 then hour = '0' .. hour end
    if minutes <= 9 then minutes = '0' .. minutes end

    time = hour .. ':' .. minutes .. ' ' .. AmPm

    local date_format = Locales[Config.Locale]['date_format'][Config.date.format]

    if Config.date.format == 'default' then
        timeString = string.format(date_format, day, month, year)
    elseif Config.date.format == 'simple' then
        timeString = string.format(date_format, day, month)

    elseif Config.date.format == 'simpleWithHours' then
        timeString = string.format(date_format, time, day, month)
    elseif Config.date.format == 'withWeekday' then
        timeString = string.format(date_format, weekDay, day, month, year)
    elseif Config.date.format == 'withHours' then
        timeString = string.format(date_format, time, day, month, year)
    elseif Config.date.format == 'withWeekdayAndHours' then
        timeString = string.format(date_format, time, weekDay, day, month, year)
    end

    return timeString
end
]]
function has_value(tab, val)
    for index, value in ipairs(tab) do if value == val then return true end end

    return false
end


local toggleui = false
RegisterCommand('hud', function()
    if not toggleui then
        SendNUIMessage({action = 'element', task = 'disable', value = 'job'})
        SendNUIMessage({action = 'element', task = 'disable', value = 'society'})
        SendNUIMessage({action = 'element', task = 'disable', value = 'bank'})
        SendNUIMessage({action = 'element', task = 'disable', value = 'blackMoney'})
        SendNUIMessage({action = 'element', task = 'disable', value = 'wallet'})
        SendNUIMessage({action = 'element', task = 'disable', value = 'zafiro'})
        --SendNUIMessage({action = 'element', task = 'disable', value = 'thirst'})
        --SendNUIMessage({action = 'element', task = 'disable', value = 'hunger'})
        --SendNUIMessage({action = 'element', task = 'disable', value = 'stamina'})
        --SendNUIMessage({action = 'element', task = 'disable', value = 'armor'})
        --SendNUIMessage({action = 'element', task = 'disable', value = 'health'})
        --SendNUIMessage({action = 'element', task = 'disable', value = 'voice'})
        SendNUIMessage({action = 'element', task = 'disable', value = 'userID'})
    else
        if (Config.ui.showJob == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'job'}) end
        if (Config.ui.showSocietyMoney == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'society'}) end
        if (Config.ui.showBankMoney == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'bank'}) end
        if (Config.ui.showzafiro == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'zafiro'}) end
        if (Config.ui.showBlackMoney == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'blackMoney'}) end
        if (Config.ui.showWalletMoney == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'wallet'}) end
        if (Config.ui.showHealth == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'health'}) end
        if (Config.ui.showArmor == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'armor'}) end
        if (Config.ui.showStamina == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'stamina'}) end
        if (Config.ui.showHunger == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'hunger'}) end
        if (Config.ui.showThirst == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'thirst'}) end
        if (Config.ui.showVoice == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'voice'}) end
        if (Config.ui.showPlayerID == true) then SendNUIMessage({action = 'element', task = 'enable', value = 'userID'}) end
    end

    toggleui = not toggleui
end)


RegisterNetEvent("SaljiGear")
AddEventHandler("SaljiGear", function(gr)
    Poslao = gr
    vehicleInfo = {action = 'updateVehicle', status = true, gear = gr}
    SendNUIMessage(vehicleInfo)
end)

RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(society, money)
    while ESX == nil do Wait(250) end
    if ESX.PlayerData.job and (ESX.PlayerData.job.grade_name == 'boss') and 'society_' .. ESX.PlayerData.job.name == society then
        SendNUIMessage({action = 'setMoney', id = 'society', value = money})
    end
end)

exports('createStatus', function(args)
    local statusCreation = {action = 'createStatus', status = args['status'], color = args['color'], icon = args['icon']}
    SendNUIMessage(statusCreation)
end)

exports('setStatus', function(args)
    local playerStatus = {action = 'setStatus', status = {{name = args['name'], value = args['value']}}}
    SendNUIMessage(playerStatus)
end)
function SetJob(job)
    if job ~= nil then
        if ESX == nil then ESX = {} end
        if ESX.PlayerData == nil then ESX.PlayerData = {} end
        ESX.PlayerData.job = job

        local label = ""
        if job.label == job.grade_label then
            label = job.grade_label
        else
            label = job.label .. ' - ' .. job.grade_label
        end
        if Config.ui.showSocietyMoney == true then
            if job.grade_name ~= nil and job.grade_name == 'boss' then
                SendNUIMessage({action = 'element', task = 'enable', value = 'society'})
                ESX.TriggerServerCallback('esx_society:getSocietyMoney',
                                          function(i) SendNUIMessage({action = 'setMoney', id = 'society', value = i}) end, --[[ "society_" ..  ]]
                                          job.name)
            else
                SendNUIMessage({action = 'element', task = 'disable', value = 'society'})
            end
        end
        SendNUIMessage({action = 'setText', id = 'job', value = label})
    end
end

function OnStart(playerData)
    SendNUIMessage({action = 'element', task = 'disable', value = 'society'})
    SendNUIMessage({action = 'ui', config = Config.ui})
    SendNUIMessage({action = 'setFont', url = Config.font.url, name = Config.font.name})
    SendNUIMessage({action = 'setLogo', value = Config.serverLogo})
    --[[if Config.ui.showVoice == true then
        if Config.voice.levels.current == 0 then
            NetworkSetTalkerProximity(Config.voice.levels.default)
        elseif Config.voice.levels.current == 1 then
            NetworkSetTalkerProximity(Config.voice.levels.shout)
        elseif Config.voice.levels.current == 2 then
            NetworkSetTalkerProximity(Config.voice.levels.whisper)
        end
    end

    if Config.ui.showVoice == true then NetworkSetTalkerProximity(5.0) end]]
    HideHudComponentThisFrame(7)
    HideHudComponentThisFrame(9)
    HideHudComponentThisFrame(6)
    HideHudComponentThisFrame(3)
    HideHudComponentThisFrame(4)
    HideHudComponentThisFrame(13)
	SendNUIMessage({action = 'setMoney', id = 'wallet', value = playerData.money})

    for e, v in pairs(playerData.accounts) do
        if v.name == "money" then
            SendNUIMessage({action = 'setMoney', id = 'wallet', value = v.money})
        elseif v.name == "bank" then
            SendNUIMessage({action = 'setMoney', id = 'bank', value = v.money})
        elseif v.name == "black_money" then
            SendNUIMessage({action = 'setMoney', id = 'blackMoney', value = v.money})
        elseif v.name == "zafiro" then
            SendNUIMessage({action = 'setMoney', id = 'zafiro', value = v.money})
        end
    end
    local job = playerData.job;
    SetJob(job)
end