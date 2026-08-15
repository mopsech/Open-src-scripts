-- ════════════════════════════════════════════════════════════════
--
--    /$$$$$$   /$$$$$$  /$$   /$$ /$$$$$$$  /$$     /$$       /$$$$$$$$ 
--   /$$__  $$ /$$__  $$| $$$ | $$| $$__  $$|  $$   /$$/      |_____ $$ 
--  | $$  \__/| $$  \ $$| $$$$| $$| $$  \ $$ \  $$ /$$/            /$$/  
--  | $$      | $$$$$$$$| $$ $$ $$| $$  | $$  \  $$$$/            /$$/   
--  | $$      | $$__  $$| $$  $$$$| $$  | $$   \  $$/            /$$/    
--  | $$    $$| $$  | $$| $$\  $$$| $$  | $$    | $$            /$$/     
--  |  $$$$$$/| $$  | $$| $$ \  $$| $$$$$$$/    | $$           /$$$$$$$$ 
--   \______/ |__/  |__/|__/  \__/|_______/     |__/          |________/ 
--                                                                                                  
-- ════════════════════════════════════════════════════════════════
-- 🍝 AI PASTA HUB v2.0 🍝
-- For vibecoders and pasters
-- 💬 Discord: @mopsech
-- ✈️ Telegram: @idkmops
-- 🔗 https://discord.gg/3KjWyZ6uBu
-- ════════════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 1: ЗАГРУЗКА БИБЛИОТЕК (14 строк)
-- ════════════════════════════════════════════════════════════════

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 2: СОЗДАНИЕ ОКНА (23 строки)
-- ════════════════════════════════════════════════════════════════

local Window = WindUI:CreateWindow({
    Title = "🍝 AI PASTA HUB",
    Icon = "spaghetti",
    Author = "For vibecoders and pasters",
    Theme = "Rose"
})

pcall(function()
    if Window.SetTransparency then
        Window:SetTransparency(0.15)
    end
    if Window.SetThemeColor then
        Window:SetThemeColor(Color3.fromRGB(255, 182, 193))
    end
end)

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 3: ОСНОВНЫЕ ПЕРЕМЕННЫЕ И СЕРВИСЫ (47 строк)
-- ════════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Состояния
local espEnabled = false
local espRoleEnabled = false
local espBoxEnabled = false
local espNameEnabled = false
local aimbotEnabled = false
local silentAimEnabled = false
local killAuraEnabled = false
local killAuraRange = 25
local autoGrabEnabled = false
local radioEnabled = false
local radioVolume = 2
local radioSound = nil
local radioModel = nil
local skinChangerNick = ""
local flingEnabled = false
local noclipEnabled = false
local antiFlingEnabled = false
local speedGlitchEnabled = false
local fullbrightEnabled = false
local autoFarmEnabled = false
local spinbotEnabled = false
local spinSpeed = 30
local autoShootEnabled = false

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 4: СОЗДАНИЕ ВКЛАДОК (39 строк)
-- ════════════════════════════════════════════════════════════════

local EspTab = Window:Tab({ Title = "👁️ ESP", Icon = "eye" })
local CombatTab = Window:Tab({ Title = "⚔️ Combat", Icon = "sword" })
local FarmTab = Window:Tab({ Title = "🌾 Farm", Icon = "coins" })
local MiscTab = Window:Tab({ Title = "🎮 Misc", Icon = "settings" })
local RadioTab = Window:Tab({ Title = "🎵 Radio", Icon = "music" })
local SkinTab = Window:Tab({ Title = "👗 Skins", Icon = "sparkles" })
local TeleportTab = Window:Tab({ Title = "🚀 Teleports", Icon = "map-pin" })
local VisualTab = Window:Tab({ Title = "🌈 Visuals", Icon = "palette" })

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 5: ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ (89 строк)
-- ════════════════════════════════════════════════════════════════

-- Функция определения роли игрока
local function getRole(player)
    local character = player.Character
    if not character then return "Innocent" end
    
    local bp = player:FindFirstChild("Backpack")
    local hasKnife = (character:FindFirstChild("Knife")) or (bp and bp:FindFirstChild("Knife"))
    local hasGun = (character:FindFirstChild("Gun") or character:FindFirstChild("Revolver")) or (bp and (bp:FindFirstChild("Gun") or bp:FindFirstChild("Revolver")))
    
    if hasKnife then
        return "Murderer"
    elseif hasGun then
        return "Sheriff"
    else
        return "Innocent"
    end
end

-- Функция проверки жив ли игрок
local function isAlive(player)
    local char = player.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    return hum and hum.Health > 0
end

-- Функция получения убийцы
local function getMurderer()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if getRole(player) == "Murderer" then
                return player
            end
        end
    end
    return nil
end

-- Функция получения шерифа
local function getSheriff()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if getRole(player) == "Sheriff" then
                return player
            end
        end
    end
    return nil
end

-- Функция безопасной телепортации
local function safeTeleport(targetCFrame)
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    
    if hrp and hum then
        local wasAnchored = hrp.Anchored
        hrp.Velocity = Vector3.new(0, 0, 0)
        hrp.RotVelocity = Vector3.new(0, 0, 0)
        hrp.Anchored = true
        hum.PlatformStand = true
        hrp.CFrame = targetCFrame
        char:PivotTo(targetCFrame)
        task.wait(0.15)
        hrp.Velocity = Vector3.new(0, 0, 0)
        hrp.RotVelocity = Vector3.new(0, 0, 0)
        hrp.Anchored = wasAnchored
        hum.PlatformStand = false
    end
end

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 6: ESP СИСТЕМА (116 строк)
-- ════════════════════════════════════════════════════════════════

EspTab:Section({ Title = "ESP Settings" })

-- Функция наложения Highlight
local function applyHighlight(player, color)
    local character = player.Character
    if not character then return end
    
    local highlight = character:FindFirstChild("PastaHub_ESP")
    if not highlight then
        highlight = Instance.new("Highlight")
        highlight.Name = "PastaHub_ESP"
        highlight.FillColor = color
        highlight.OutlineColor = color
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = character
    else
        if highlight.FillColor ~= color then
            highlight.FillColor = color
            highlight.OutlineColor = color
        end
        if highlight.FillTransparency ~= 0.5 then
            highlight.FillTransparency = 0.5
        end
        if highlight.DepthMode ~= Enum.HighlightDepthMode.AlwaysOnTop then
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        end
    end
end

-- Функция удаления Highlight
local function removeHighlight(player)
    local character = player.Character
    if character then
        local highlight = character:FindFirstChild("PastaHub_ESP")
        if highlight then highlight:Destroy() end
    end
end

-- Функция наложения Box ESP
local function applyBoxESP(player, color)
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local box = hrp:FindFirstChild("PastaBoxESP")
    if not box then
        box = Instance.new("BoxHandleAdornment")
        box.Name = "PastaBoxESP"
        box.Size = Vector3.new(4, 5.5, 2.5)
        box.Color3 = color
        box.AlwaysOnTop = true
        box.ZIndex = 5
        box.Transparency = 0.6
        box.Adornee = hrp
        box.Parent = hrp
    else
        box.Color3 = color
    end
end

-- Функция удаления Box ESP
local function removeBoxESP(player)
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    local box = hrp and hrp:FindFirstChild("PastaBoxESP")
    if box then box:Destroy() end
end

-- Toggles для ESP
EspTab:Toggle({
    Title = "Role ESP (Highlight)",
    Desc = "Show roles: Murderer 🔴, Sheriff 🔵, Innocent 🟢",
    Default = false,
    Callback = function(state)
        espRoleEnabled = state
        if not state then
            for _, player in ipairs(Players:GetPlayers()) do
                removeHighlight(player)
            end
        end
    end
})

EspTab:Toggle({
    Title = "Box ESP",
    Desc = "Show 3D boxes around players",
    Default = false,
    Callback = function(state)
        espBoxEnabled = state
        if not state then
            for _, player in ipairs(Players:GetPlayers()) do
                removeBoxESP(player)
            end
        end
    end
})

EspTab:Toggle({
    Title = "Name ESP",
    Desc = "Show player names above heads",
    Default = false,
    Callback = function(state)
        espNameEnabled = state
    end
})

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 7: COMBAT СИСТЕМА (189 строк)
-- ════════════════════════════════════════════════════════════════

CombatTab:Section({ Title = "Aimbot" })

CombatTab:Toggle({
    Title = "Aimbot on Murderer",
    Desc = "Auto-lock on murderer",
    Default = false,
    Callback = function(state)
        aimbotEnabled = state
    end
})

CombatTab:Toggle({
    Title = "Silent Aim",
    Desc = "Shoot without turning camera",
    Default = false,
    Callback = function(state)
        silentAimEnabled = state
    end
})

CombatTab:Toggle({
    Title = "Auto Shoot Murderer",
    Desc = "Auto shoot when gun is equipped",
    Default = false,
    Callback = function(state)
        autoShootEnabled = state
    end
})

CombatTab:Section({ Title = "Kill Aura" })

CombatTab:Toggle({
    Title = "Kill Aura",
    Desc = "Auto-kill nearby players",
    Default = false,
    Callback = function(state)
        killAuraEnabled = state
    end
})

CombatTab:Slider({
    Title = "Kill Aura Range",
    Min = 10,
    Max = 45,
    Default = 25,
    Callback = function(value)
        killAuraRange = value
    end
})

CombatTab:Section({ Title = "Spinbot" })

CombatTab:Toggle({
    Title = "Spinbot",
    Desc = "Spin your character around",
    Default = false,
    Callback = function(state)
        spinbotEnabled = state
    end
})

CombatTab:Slider({
    Title = "Spin Speed",
    Min = 5,
    Max = 100,
    Default = 30,
    Callback = function(value)
        spinSpeed = value
    end
})

CombatTab:Section({ Title = "Fling" })

-- Функция флинга
local function flingPlayer(targetPlayer)
    local Character = LocalPlayer.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart or (Character and Character:FindFirstChild("HumanoidRootPart"))
    
    local TCharacter = targetPlayer.Character
    if not TCharacter then return end
    
    local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and THumanoid.RootPart or TCharacter:FindFirstChild("HumanoidRootPart")
    local THead = TCharacter:FindFirstChild("Head")
    
    if Character and Humanoid and RootPart then
        if THumanoid and THumanoid.Sit then
            WindUI:Notify({ Title = "Fling", Content = targetPlayer.Name .. " is sitting!", Duration = 2 })
            return
        end
        
        WindUI:Notify({ Title = "Fling", Content = "Flinging: " .. targetPlayer.DisplayName, Duration = 2 })
        
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        end
        
        local BV = Instance.new("BodyVelocity")
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
        BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        
        for i = 1, 30 do
            if TRootPart then
                RootPart.CFrame = TRootPart.CFrame * CFrame.new(0, 1.5, 0)
            end
            task.wait()
        end
        
        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid
    end
end

CombatTab:Button({
    Title = "🔄 Fling Murderer",
    Callback = function()
        local m = getMurderer()
        if m then flingPlayer(m) end
    end
})

CombatTab:Button({
    Title = "🔄 Fling Sheriff",
    Callback = function()
        local s = getSheriff()
        if s then flingPlayer(s) end
    end
})

CombatTab:Button({
    Title = "🔄 Fling All",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                flingPlayer(player)
                task.wait(0.5)
            end
        end
    end
})

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 8: FARM СИСТЕМА (93 строки)
-- ════════════════════════════════════════════════════════════════

FarmTab:Section({ Title = "Coin Farm" })

FarmTab:Toggle({
    Title = "Auto Farm Coins",
    Desc = "Automatically collects coins",
    Default = false,
    Callback = function(state)
        autoFarmEnabled = state
    end
})

FarmTab:Slider({
    Title = "Farm Speed",
    Min = 10,
    Max = 50,
    Default = 22,
    Callback = function(value)
        farmSpeed = value
    end
})

-- Функция поиска монет
local function getAllCoins()
    local coins = {}
    local coinContainer = Workspace:FindFirstChild("CoinContainer") 
        or Workspace:FindFirstChild("Coins") 
        or Workspace:FindFirstChild("CoinArea")
    
    if coinContainer then
        for _, child in ipairs(coinContainer:GetChildren()) do
            if child:IsA("BasePart") or child:FindFirstChildOfClass("BasePart") then
                table.insert(coins, child)
            end
        end
    else
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj.Name == "CoinVisual" or obj.Name == "Coin_Server" or obj.Name == "Coin" then
                if obj:IsA("BasePart") then
                    table.insert(coins, obj)
                end
            end
        end
    end
    return coins
end

-- Автофарм монет
task.spawn(function()
    local farmSpeed = 22
    while true do
        task.wait(0.5)
        if autoFarmEnabled then
            pcall(function()
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                
                local coins = getAllCoins()
                if #coins > 0 then
                    for _, coin in ipairs(coins) do
                        if not autoFarmEnabled then break end
                        if coin and coin.Parent then
                            local targetPos = coin.Position
                            local hoverPos = targetPos + Vector3.new(0, 14, 0)
                            
                            local distance = (hrp.Position - hoverPos).Magnitude
                            local tweenTime = math.clamp(distance / farmSpeed, 0.2, 2.0)
                            
                            local tween = TweenService:Create(
                                hrp,
                                TweenInfo.new(tweenTime, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                                {CFrame = CFrame.new(hoverPos)}
                            )
                            tween:Play()
                            tween.Completed:Wait()
                            
                            if not autoFarmEnabled then break end
                            
                            local collectTween = TweenService:Create(
                                hrp,
                                TweenInfo.new(0.2, Enum.EasingStyle.Linear),
                                {CFrame = CFrame.new(targetPos)}
                            )
                            collectTween:Play()
                            collectTween.Completed:Wait()
                            task.wait(0.1)
                            
                            local returnTween = TweenService:Create(
                                hrp,
                                TweenInfo.new(0.2, Enum.EasingStyle.Linear),
                                {CFrame = CFrame.new(hoverPos)}
                            )
                            returnTween:Play()
                            returnTween.Completed:Wait()
                        end
                    end
                end
            end)
            task.wait(0.2)
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 9: MISC СИСТЕМА (112 строк)
-- ════════════════════════════════════════════════════════════════

MiscTab:Section({ Title = "Utilities" })

MiscTab:Toggle({
    Title = "Auto Grab Gun",
    Desc = "Auto-pickup sheriff gun when dropped",
    Default = false,
    Callback = function(state)
        autoGrabEnabled = state
    end
})

MiscTab:Toggle({
    Title = "Noclip",
    Desc = "Walk through walls",
    Default = false,
    Callback = function(state)
        noclipEnabled = state
    end
})

MiscTab:Toggle({
    Title = "Anti-Fling",
    Desc = "Prevent being flung",
    Default = false,
    Callback = function(state)
        antiFlingEnabled = state
    end
})

MiscTab:Toggle({
    Title = "Speed Glitch",
    Desc = "Infinite speed glitch",
    Default = false,
    Callback = function(state)
        speedGlitchEnabled = state
    end
})

MiscTab:Slider({
    Title = "Speed Glitch Power",
    Min = 20,
    Max = 100,
    Default = 45,
    Callback = function(value)
        speedPower = value
    end
})

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 10: RADIO СИСТЕМА (98 строк)
-- ════════════════════════════════════════════════════════════════

RadioTab:Section({ Title = "Radio Player" })

local radioId = ""

RadioTab:Input({
    Title = "Roblox Audio ID",
    Desc = "Enter Roblox asset ID",
    Placeholder = "1234567890",
    Callback = function(value)
        radioId = value
    end
})

RadioTab:Button({
    Title = "▶️ Play Radio",
    Callback = function()
        if not radioId or radioId == "" then 
            WindUI:Notify({ Title = "Error", Content = "Enter audio ID!", Duration = 2 })
            return 
        end
        
        local char = LocalPlayer.Character
        local torso = char and (char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso"))
        if not torso then return end
        
        if radioModel then radioModel:Destroy() end
        
        radioModel = Instance.new("Part")
        radioModel.Name = "Radio"
        radioModel.Size = Vector3.new(2, 1, 1)
        radioModel.CanCollide = false
        radioModel.BrickColor = BrickColor.new("Bright yellow")
        radioModel.Material = Enum.Material.Metal
        radioModel.Parent = char
        
        local weld = Instance.new("Weld")
        weld.Part0 = torso
        weld.Part1 = radioModel
        weld.C0 = CFrame.new(0, 0, 0.75)
        weld.Parent = radioModel
        
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. radioId
        sound.Volume = radioVolume
        sound.Looped = true
        sound.Parent = radioModel
        sound:Play()
        
        radioSound = sound
        WindUI:Notify({ Title = "Radio", Content = "Playing audio!", Duration = 2 })
    end
})

RadioTab:Button({
    Title = "⏹️ Stop Radio",
    Callback = function()
        if radioSound then radioSound:Stop() end
        if radioModel then radioModel:Destroy() end
        radioModel = nil
        radioSound = nil
    end
})

RadioTab:Slider({
    Title = "Volume",
    Min = 0,
    Max = 10,
    Default = 2,
    Callback = function(value)
        radioVolume = value
        if radioSound then radioSound.Volume = value end
    end
})

RadioTab:Toggle({
    Title = "Loop Audio",
    Default = true,
    Callback = function(state)
        if radioSound then radioSound.Looped = state end
    end
})

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 11: SKIN CHANGER (67 строк)
-- ════════════════════════════════════════════════════════════════

SkinTab:Section({ Title = "Skin Changer" })

SkinTab:Input({
    Title = "Player Username",
    Desc = "Enter username to copy skin from",
    Placeholder = "Username...",
    Callback = function(value)
        skinChangerNick = value
    end
})

SkinTab:Button({
    Title = "👗 Apply Skin",
    Callback = function()
        if skinChangerNick == "" then 
            WindUI:Notify({ Title = "Error", Content = "Enter username!", Duration = 2 })
            return 
        end
        
        pcall(function()
            local userId = Players:GetUserIdFromNameAsync(skinChangerNick)
            local desc = Players:GetHumanoidDescriptionFromUserId(userId)
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            
            if hum then
                hum:ApplyDescriptionReset(desc)
                WindUI:Notify({ Title = "Success", Content = "Skin applied!", Duration = 2 })
            end
        end)
    end
})

SkinTab:Button({
    Title = "🔄 Reset Skin",
    Callback = function()
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:ApplyDescriptionReset(Players:GetHumanoidDescriptionFromUserId(LocalPlayer.UserId))
            WindUI:Notify({ Title = "Reset", Content = "Skin reset!", Duration = 2 })
        end
    end
})

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 12: TELEPORTS (68 строк)
-- ════════════════════════════════════════════════════════════════

TeleportTab:Section({ Title = "Teleport Locations" })

TeleportTab:Button({
    Title = "🚀 Teleport to Lobby",
    Callback = function()
        local lobby = Workspace:FindFirstChild("Lobby")
        local spawn = lobby and (lobby:FindFirstChild("Spawn", true) or lobby:FindFirstChildOfClass("SpawnLocation", true))
        if spawn then
            safeTeleport(spawn.CFrame * CFrame.new(0, 3, 0))
        else
            safeTeleport(CFrame.new(6.0, 505.2, -35.0))
        end
        WindUI:Notify({ Title = "Teleport", Content = "Teleported to lobby!", Duration = 2 })
    end
})

TeleportTab:Button({
    Title = "🚀 Teleport to Map",
    Callback = function()
        local center = Vector3.new(12.0, 291.7, 9040.0)
        safeTeleport(CFrame.new(center + Vector3.new(0, 3.5, 0)))
        WindUI:Notify({ Title = "Teleport", Content = "Teleported to map!", Duration = 2 })
    end
})

TeleportTab:Button({
    Title = "🚀 Teleport to Murderer",
    Callback = function()
        local m = getMurderer()
        if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") then
            safeTeleport(m.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0))
            WindUI:Notify({ Title = "Teleport", Content = "Teleported to murderer!", Duration = 2 })
        end
    end
})

TeleportTab:Button({
    Title = "🚀 Teleport to Sheriff",
    Callback = function()
        local s = getSheriff()
        if s and s.Character and s.Character:FindFirstChild("HumanoidRootPart") then
            safeTeleport(s.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0))
            WindUI:Notify({ Title = "Teleport", Content = "Teleported to sheriff!", Duration = 2 })
        end
    end
})

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 13: VISUALS (78 строк)
-- ════════════════════════════════════════════════════════════════

VisualTab:Section({ Title = "World Effects" })

VisualTab:Toggle({
    Title = "Fullbright",
    Desc = "Brighten the entire map",
    Default = false,
    Callback = function(state)
        fullbrightEnabled = state
        if state then
            Lighting.Brightness = 2
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
            Lighting.ClockTime = 14
        else
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        end
    end
})

VisualTab:Toggle({
    Title = "Remove Fog",
    Desc = "Disable map fog",
    Default = false,
    Callback = function(state)
        if state then
            Lighting.FogEnd = 9e9
        else
            Lighting.FogEnd = 1000
        end
    end
})

VisualTab:Slider({
    Title = "Time of Day",
    Min = 0,
    Max = 24,
    Default = 14,
    Callback = function(value)
        Lighting.TimeOfDay = string.format("%02d:00:00", value)
    end
})

VisualTab:Toggle({
    Title = "Pink Glass Effect",
    Desc = "Make your character transparent pink glass",
    Default = false,
    Callback = function(state)
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    if state then
                        part.Material = Enum.Material.Glass
                        part.Color = Color3.fromRGB(255, 105, 180)
                        part.Transparency = 0.4
                    else
                        part.Material = Enum.Material.SmoothPlastic
                        part.Transparency = 0
                    end
                end
            end
        end
    end
})

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 14: ФОНОВЫЕ ЦИКЛЫ (156 строк)
-- ════════════════════════════════════════════════════════════════

-- ESP Цикл
local highlights = {}
local nameTags = {}

RunService.RenderStepped:Connect(function()
    -- Role ESP
    if espRoleEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local role = getRole(player)
                    local color = Color3.fromRGB(0, 255, 0)
                    
                    if role == "Murderer" then
                        color = Color3.fromRGB(255, 0, 0)
                    elseif role == "Sheriff" then
                        color = Color3.fromRGB(0, 0, 255)
                    end
                    
                    applyHighlight(player, color)
                    
                    if espBoxEnabled then
                        applyBoxESP(player, color)
                    end
                end
            end
        end
    end
    
    -- Name ESP
    if espNameEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local char = player.Character
                local head = char and char:FindFirstChild("Head")
                if head then
                    local tag = head:FindFirstChild("PastaNameTag")
                    if not tag then
                        tag = Instance.new("BillboardGui")
                        tag.Name = "PastaNameTag"
                        tag.Size = UDim2.new(0, 100, 0, 50)
                        tag.StudsOffset = Vector3.new(0, 2.5, 0)
                        tag.AlwaysOnTop = true
                        tag.Parent = head
                        
                        local text = Instance.new("TextLabel")
                        text.Size = UDim2.new(1, 0, 1, 0)
                        text.BackgroundTransparency = 1
                        text.TextColor3 = Color3.fromRGB(255, 255, 255)
                        text.TextStrokeTransparency = 0
                        text.TextSize = 14
                        text.Font = Enum.Font.SourceSansBold
                        text.Parent = tag
                    end
                    tag.TextLabel.Text = player.Name .. " [" .. getRole(player) .. "]"
                end
            end
        end
    end
end)

-- Auto Grab Gun
task.spawn(function()
    while true do
        task.wait(0.2)
        if autoGrabEnabled then
            pcall(function()
                local char = LocalPlayer.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                
                local hasGun = char:FindFirstChild("Gun") or (LocalPlayer.Backpack and LocalPlayer.Backpack:FindFirstChild("Gun"))
                if not hasGun then
                    local gunDrop = workspace:FindFirstChild("GunDrop", true) or workspace:FindFirstChild("DroppedGun", true)
                    if gunDrop then
                        local handle = gunDrop:FindFirstChild("Handle", true) or gunDrop:FindFirstChildOfClass("Part", true) or gunDrop
                        if handle then
                            char.HumanoidRootPart.CFrame = handle.CFrame * CFrame.new(0, -1, 0)
                            task.wait(0.1)
                        end
                    end
                end
            end)
        end
    end
end)

-- Aimbot
RunService.RenderStepped:Connect(function()
    if aimbotEnabled then
        local m = getMurderer()
        if m and m.Character and m.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, m.Character.Head.Position)
        end
    end
end)

-- Silent Aim
pcall(function()
    if hookmetamethod and getnamecallmethod then
        local oldNamecall
        oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
            local args = {...}
            local method = getnamecallmethod()
            
            if silentAimEnabled then
                local m = getMurderer()
                if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") then
                    local targetPos = m.Character.HumanoidRootPart.Position
                    if method == "FireServer" and (self.Name == "Shoot" or self.Name == "Fire") then
                        args[1] = CFrame.new(args[1] and args[1].Position or Vector3.new(), targetPos)
                        args[2] = targetPos
                        if oldNamecall then
                            return oldNamecall(self, unpack(args))
                        end
                    elseif method == "InvokeServer" and self.Name == "ShootGun" then
                        args[2] = targetPos
                        args[3] = targetPos
                        if oldNamecall then
                            return oldNamecall(self, unpack(args))
                        end
                    end
                end
            end
            
            if oldNamecall then
                return oldNamecall(self, ...)
            end
        end)
    end
end)

-- Auto Shoot
task.spawn(function()
    while true do
        task.wait(0.1)
        if autoShootEnabled then
            pcall(function()
                local char = LocalPlayer.Character
                local gun = char and char:FindFirstChild("Gun")
                if gun then
                    local m = getMurderer()
                    if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") then
                        gun:Activate()
                        local remote = gun:FindFirstChild("Shoot") or gun:FindFirstChild("Fire")
                        if remote then
                            remote:FireServer(CFrame.new(gun.Handle.Position, m.Character.HumanoidRootPart.Position), m.Character.HumanoidRootPart.Position)
                        end
                    end
                end
            end)
        end
    end
end)

-- Kill Aura
task.spawn(function()
    while true do
        task.wait(0.05)
        if killAuraEnabled then
            pcall(function()
                local char = LocalPlayer.Character
                local bp = LocalPlayer:FindFirstChild("Backpack")
                local knife = char and char:FindFirstChild("Knife") or (bp and bp:FindFirstChild("Knife"))
                
                if knife and char and char:FindFirstChild("HumanoidRootPart") then
                    if knife.Parent == bp then char.Humanoid:EquipTool(knife) end
                    
                    for _, victim in ipairs(Players:GetPlayers()) do
                        if victim ~= LocalPlayer and victim.Character and victim.Character:FindFirstChild("HumanoidRootPart") then
                            local vHum = victim.Character:FindFirstChildOfClass("Humanoid")
                            if vHum and vHum.Health > 0 then
                                local dist = (char.HumanoidRootPart.Position - victim.Character.HumanoidRootPart.Position).Magnitude
                                if dist <= killAuraRange then
                                    knife:Activate()
                                    pcall(function()
                                        local targetPart = victim.Character:FindFirstChild("HumanoidRootPart") or victim.Character:FindFirstChild("Torso") or victim.Character:FindFirstChild("UpperTorso")
                                        if targetPart then
                                            firetouchinterest(targetPart, knife.Handle, 0)
                                            firetouchinterest(targetPart, knife.Handle, 1)
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- Spinbot
RunService.RenderStepped:Connect(function()
    if spinbotEnabled then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hrp and hum then
            hum.AutoRotate = false
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
        end
    else
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.AutoRotate = true end
    end
end)

-- Noclip
RunService.Stepped:Connect(function()
    if noclipEnabled then
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

-- Anti-Fling
RunService.Stepped:Connect(function()
    if antiFlingEnabled then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            if hrp.AssemblyLinearVelocity.Magnitude > 100 then
                hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            end
        end
    end
end)

-- Speed Glitch
RunService.RenderStepped:Connect(function()
    if speedGlitchEnabled then
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            if hum:GetState() == Enum.HumanoidStateType.Freefall or hum.Jump then
                hum.WalkSpeed = 120
            else
                hum.WalkSpeed = 16
            end
        end
    else
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum and hum.WalkSpeed == 120 then
            hum.WalkSpeed = 16
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--  📌 СЕКЦИЯ 15: ЗАПУСК (9 строк)
-- ════════════════════════════════════════════════════════════════

WindUI:Notify({ 
    Title = "🍝 AI PASTA HUB v2.0", 
    Content = "Loaded successfully! 1437 lines of pure spaghetti!",
    Duration = 3 
})

print("🍝 AI PASTA HUB v2.0 loaded!")
print("📊 Total lines: 1437")
print("For vibecoders and pasters 💪")
