Config = {}

Config.AdminCommand = "porno" -- Admin komutunun adı /// name of the admin command
Config.Rang = "admin"         -- The Rang needed for the Admin Command

Config.HowLong = 60           -- oyuncunun ne kadar antitroll suresinin olması ///how long the player should have antitroll on
Config.TimeToSave = 5         -- kac saniyede bir saniye databaseye kaydedilsin (cümle kafa sikti) /// how often the time should be saved in the database

-- ANTITROLL'U KURUYORUZ ///SETTING FOR PLAYERS WITH ANTITROLL ON
Config.DisableVDM = true            -- kısı korumadayken vdm atabilsinmi )true derseniz carptıgında oyuncunun canı gitmez fakat collision devam eder
Config.DriveBy = false              --  arabanın ıcındeyken drıveby atabilsinmi
Config.DisableShooting = false      -- ates edebilsinmi
Config.DisablePunching = true       -- korumadayken oyunculara vurmabilsinmi
Config.DisablePunchingDamage = true -- yumruk hasarını kapar

Config.Framework = "QBCore"         -- hangisini kullanıyosan yaz (ESX, QBCore)

FrameworkObject = nil

function GetFrameworkObject()
    if Config.Framework == "ESX" then
        FrameworkObject = exports["es_extended"]:getSharedObject()
        -- eski ESX destekler
        if not FrameworkObject then
            TriggerEvent('esx:getSharedObject', function(obj) FrameworkObject = obj end)
        end

        return exports["es_extended"]:getSharedObject()
    elseif Config.Framework == "QBCore" then
        FrameworkObject = exports['qb-core']:GetCoreObject()
        return exports['qb-core']:GetCoreObject()
    end
end

-- sunucu fanksiyonları
function GetPlayerIdentifier(id)
    if Config.Framework == "ESX" then
        return FrameworkObject.GetPlayerFromId(id).identifier
    elseif Config.Framework == "QBCore" then
        return FrameworkObject.Functions.GetIdentifier(id, 'license')
    end
end
