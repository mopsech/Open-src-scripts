-- слито в https://discord.gg/3KjWyZ6uBu
-- MM2 HitSound

-- ════════════════════════════════════════════════════════════════
--
--
--   /$$$$$$   /$$$$$$  /$$   /$$ /$$$$$$$  /$$     /$$       /$$$$$$$$  /$$$$$$  /$$   /$$ /$$$$$$$$
--  /$$__  $$ /$$__  $$| $$$ | $$| $$__  $$|  $$   /$$/      |_____ $$  /$$__  $$| $$$ | $$| $$_____/
-- | $$  \__/| $$  \ $$| $$$$| $$| $$  \ $$ \  $$ /$$/            /$$/ | $$  \ $$| $$$$| $$| $$      
-- | $$      | $$$$$$$$| $$ $$ $$| $$  | $$  \  $$$$/            /$$/  | $$  | $$| $$ $$ $$| $$$$$   
-- | $$      | $$__  $$| $$  $$$$| $$  | $$   \  $$/            /$$/   | $$  | $$| $$  $$$$| $$__/   
-- | $$    $$| $$  | $$| $$\  $$$| $$  | $$    | $$            /$$/    | $$  | $$| $$\  $$$| $$      
-- |  $$$$$$/| $$  | $$| $$ \  $$| $$$$$$$/    | $$           /$$$$$$$$|  $$$$$$/| $$ \  $$| $$$$$$$$
--  \______/ |__/  |__/|__/  \__/|_______/     |__/          |________/ \______/ |__/  \__/|________/                                                                                                
--                                                                                                  
--                                                                                                  
--
-- ════════════════════════════════════════════════════════════════
-- 🔥 CRACKED BY MOPS 🔥
-- 💬 Discord: @mopsech
-- ✈️ Telegram: @idkmops
-- 
-- 📢 СКРИПТ СЛИТ В ПУБЛИЧНЫЙ ДОСТУП!
-- 🔗 ССЫЛКА НА КАНАЛ: https://discord.gg/3KjWyZ6uBu
-- 
-- ⭐ СПАСИБО ЗА ИСПОЛЬЗОВАНИЕ!
-- ════════════════════════════════════════════════════════════════

local SoundService = game:GetService("SoundService")

gunshotSounds = {
    ["Alchemist Burst"] = "rbxassetid://130507807370367",
    ["RPGS Candy"]      = "rbxassetid://83995181532586",
    ["RPGE Beary"]      = "rbxassetid://112424028680133",
    ["DB Bloss"]        = "rbxassetid://97681259004692",
    ["Rev Blossom"]     = "rbxassetid://118868788824782",
    ["Kawaii DG"]       = "rbxassetid://135458839245691",
    ["Hit Basic 3"]     = "rbxassetid://90160800327080"
}

knifeKillSounds = {
    ["S3 Coin Hit"]         = "rbxassetid://139857881082762",
    ["Custom Hit 1"]        = "rbxassetid://138592514473573",
    ["Golden Knife Kill"]   = "rbxassetid://6066375795",
    ["Among Us"]            = "rbxassetid://130456049552264",
    ["Jeff Laugh"]          = "rbxassetid://140445930084397",
    ["Pelmeni"]             = "rbxassetid://130226230760992",
    ["Horror Kill"]         = "rbxassetid://128741351184513",
    ["Jeff Stab"]           = "rbxassetid://81483362340487"
}

-- выбирай звуки тут
local selectedGunshot = "RPGS Candy"      -- выстрел пистолета
local selectedKnifeKill = "Golden Knife Kill" -- кил ножом

local hooked = {}
local function hookSound(sound)
    if not sound:IsA("Sound") or hooked[sound] then return end
    hooked[sound] = true
    sound.Played:Connect(function()
        if sound.Name == "Gunshot" and gunshotSounds[selectedGunshot] and sound.SoundId ~= gunshotSounds[selectedGunshot] then
            sound.SoundId = gunshotSounds[selectedGunshot]
            sound.TimePosition = 0
            sound:Play()
        elseif sound.Name == "Kill" and knifeKillSounds[selectedKnifeKill] and sound.SoundId ~= knifeKillSounds[selectedKnifeKill] then
            sound.SoundId = knifeKillSounds[selectedKnifeKill]
            sound.TimePosition = 0
            sound:Play()
        end
    end)
end

workspace.DescendantAdded:Connect(function(d)
    if d:IsA("Sound") and (d.Name == "Gunshot" or d.Name == "Kill") then hookSound(d) end
end)
for _, d in ipairs(workspace:GetDescendants()) do
    if d:IsA("Sound") and (d.Name == "Gunshot" or d.Name == "Kill") then hookSound(d) end
end
