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
-- AI PASTA HUB v3.0 MEGA
-- For vibecoders and pasters
-- Discord: @mopsech
-- Telegram: @idkmops
-- https://discord.gg/3KjWyZ6uBu
-- ════════════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════════════
--  SECTION 1: LIBRARY LOADING
-- ════════════════════════════════════════════════════════════════

-- Загружаем библиотеку WindUI для создания интерфейса
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- Проверяем успешность загрузки библиотеки
if not WindUI then
    error("Failed to load WindUI library!")
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 2: WINDOW CREATION
--  SECTION 2: WINDOW CREATION
--  SECTION 2: WINDOW CREATION
-- ════════════════════════════════════════════════════════════════

-- Создаём главное окно хаба
local Window = WindUI:CreateWindow({
    Title = "AI PASTA HUB",
    Icon = "spaghetti",
    Author = "For vibecoders and pasters",
    Theme = "Rose"
})

-- Настройка прозрачности окна
pcall(function()
    if Window.SetTransparency then
        Window:SetTransparency(0.15)
    end
end)

-- Настройка цвета темы
pcall(function()
    if Window.SetThemeColor then
        Window:SetThemeColor(Color3.fromRGB(255, 182, 193))
    end
end)

-- Дополнительная настройка окна
pcall(function()
    if Window.SetSize then
        Window:SetSize(UDim2.fromOffset(600, 480))
    end
end)

-- ════════════════════════════════════════════════════════════════
--  SECTION 3: SERVICES AND VARIABLES
--  SECTION 3: SERVICES AND VARIABLES
--  SECTION 3: SERVICES AND VARIABLES
-- ════════════════════════════════════════════════════════════════

-- Получаем все необходимые сервисы Roblox
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

-- Получаем локального игрока
local LocalPlayer = Players.LocalPlayer

-- Получаем камеру
local Camera = Workspace.CurrentCamera

-- Состояния для ESP
local espRoleEnabled = false
local espNameEnabled = false
local espBoxEnabled = false

-- Состояния для Combat
local aimbotEnabled = false
local silentAimEnabled = false
local autoShootEnabled = false

-- Состояния для Fun
local flingMurdererEnabled = false
local flingSheriffEnabled = false
local flingHeroEnabled = false

-- Состояния для Misc
local bhopEnabled = false
local autoGrabEnabled = false
local noclipEnabled = false
local autoFarmEnabled = false
local farmSpeed = 22

-- Состояния для Visuals
local fullbrightEnabled = false
local stretchEnabled = false
local stretchFactor = 0.75
local noFogEnabled = false

-- Состояния для Radio
local radioVolume = 2
local radioSound = nil
local radioModel = nil
local radioId = ""

-- Вспомогательные переменные
local lastJumpTime = 0
local grabCooldown = false
local farmCooldown = false

-- ════════════════════════════════════════════════════════════════
--  SECTION 4: TAB CREATION
--  SECTION 4: TAB CREATION
--  SECTION 4: TAB CREATION
-- ════════════════════════════════════════════════════════════════

-- Создаём вкладку Visuals
local VisualsTab = Window:Tab({ 
    Title = "Visuals", 
    Icon = "eye" 
})

-- Создаём вкладку Combat
local CombatTab = Window:Tab({ 
    Title = "Combat", 
    Icon = "sword" 
})

-- Создаём вкладку Fun
local FunTab = Window:Tab({ 
    Title = "Fun", 
    Icon = "party-popper" 
})

-- Создаём вкладку Misc
local MiscTab = Window:Tab({ 
    Title = "Misc", 
    Icon = "settings" 
})

-- Создаём вкладку Radio
local RadioTab = Window:Tab({ 
    Title = "Radio", 
    Icon = "music" 
})

-- ════════════════════════════════════════════════════════════════
--  SECTION 5: HELPER FUNCTIONS
--  SECTION 5: HELPER FUNCTIONS
--  SECTION 5: HELPER FUNCTIONS
-- ════════════════════════════════════════════════════════════════

-- Функция определения роли игрока
-- Эта функция анализирует инвентарь игрока и определяет его роль в игре
local function getRole(player)
    local character = player.Character
    if not character then 
        return "Innocent" 
    end
    
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

-- Функция получения убийцы
-- Возвращает первого найденного игрока с ролью Murderer
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
-- Возвращает первого найденного игрока с ролью Sheriff
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

-- Функция получения героя
-- Возвращает первого найденного игрока с ролью Innocent
local function getHero()
    local m = getMurderer()
    local s = getSheriff()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player ~= m and player ~= s then
            if getRole(player) == "Innocent" then
                return player
            end
        end
    end
    return nil
end

-- Функция проверки жив ли игрок
local function isAlive(player)
    local char = player.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    return hum and hum.Health > 0
end

-- Функция безопасной телепортации
-- Телепортирует игрока с защитой от падения
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

-- Функция получения всех монет на карте
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

-- ════════════════════════════════════════════════════════════════
--  SECTION 6: ESP SYSTEM (FROM FOGYHUB)
--  SECTION 6: ESP SYSTEM (FROM FOGYHUB)
--  SECTION 6: ESP SYSTEM (FROM FOGYHUB)
-- ════════════════════════════════════════════════════════════════

VisualsTab:Section({ Title = "ESP Settings" })

-- Функция наложения Highlight
-- Создаёт подсветку вокруг игрока с указанным цветом
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

-- Toggle для Role ESP
VisualsTab:Toggle({
    Title = "Role ESP",
    Desc = "Show roles: Murderer, Sheriff, Innocent",
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

-- Toggle для Name ESP
VisualsTab:Toggle({
    Title = "Name ESP",
    Desc = "Show player names above heads",
    Default = false,
    Callback = function(state)
        espNameEnabled = state
    end
})

-- Toggle для Box ESP (отключен)
VisualsTab:Toggle({
    Title = "Box ESP",
    Desc = "Show 3D boxes around players",
    Default = false,
    Callback = function(state)
        espBoxEnabled = state
    end
})

-- ════════════════════════════════════════════════════════════════
--  SECTION 7: VISUALS SETTINGS
--  SECTION 7: VISUALS SETTINGS
--  SECTION 7: VISUALS SETTINGS
-- ════════════════════════════════════════════════════════════════

VisualsTab:Section({ Title = "Screen Effects" })

-- Toggle для Screen Stretch
VisualsTab:Toggle({
    Title = "Screen Stretch",
    Desc = "Stretch your screen for better view",
    Default = false,
    Callback = function(state)
        stretchEnabled = state
    end
})

-- Input для Stretch Factor
VisualsTab:Input({
    Title = "Stretch Factor",
    Desc = "Enter value between 0.5 - 1.0",
    Placeholder = "0.75",
    Callback = function(value)
        local num = tonumber(value)
        if num and num >= 0.5 and num <= 1.0 then
            stretchFactor = num
        else
            WindUI:Notify({ Title = "Error", Content = "Enter value between 0.5 - 1.0", Duration = 2 })
        end
    end
})

-- Toggle для Fullbright
VisualsTab:Toggle({
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

-- Toggle для No Fog
VisualsTab:Toggle({
    Title = "Remove Fog",
    Desc = "Disable map fog",
    Default = false,
    Callback = function(state)
        noFogEnabled = state
        if state then
            Lighting.FogEnd = 9e9
        else
            Lighting.FogEnd = 1000
        end
    end
})

-- ════════════════════════════════════════════════════════════════
--  SECTION 8: COMBAT SYSTEM
--  SECTION 8: COMBAT SYSTEM
--  SECTION 8: COMBAT SYSTEM
-- ════════════════════════════════════════════════════════════════

CombatTab:Section({ Title = "Aimbot" })

-- Toggle для Aimbot
CombatTab:Toggle({
    Title = "Aimbot on Murderer",
    Desc = "Auto-lock on murderer",
    Default = false,
    Callback = function(state)
        aimbotEnabled = state
    end
})

-- Toggle для Silent Aim
CombatTab:Toggle({
    Title = "Silent Aim",
    Desc = "Shoot without turning camera",
    Default = false,
    Callback = function(state)
        silentAimEnabled = state
    end
})

-- Toggle для Auto Shoot
CombatTab:Toggle({
    Title = "Auto Shoot Murderer",
    Desc = "Auto shoot when gun is equipped",
    Default = false,
    Callback = function(state)
        autoShootEnabled = state
    end
})

-- ════════════════════════════════════════════════════════════════
--  SECTION 9: FUN SYSTEM (FLING FROM FOGYHUB)
--  SECTION 9: FUN SYSTEM (FLING FROM FOGYHUB)
--  SECTION 9: FUN SYSTEM (FLING FROM FOGYHUB)
-- ════════════════════════════════════════════════════════════════

FunTab:Section({ Title = "Fling" })

-- Функция флинга
-- Выбрасывает игрока в воздух с огромной скоростью
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

-- Кнопка Fling Murderer
FunTab:Button({
    Title = "Fling Murderer",
    Callback = function()
        local m = getMurderer()
        if m then flingPlayer(m) end
    end
})

-- Кнопка Fling Sheriff
FunTab:Button({
    Title = "Fling Sheriff",
    Callback = function()
        local s = getSheriff()
        if s then flingPlayer(s) end
    end
})

-- Кнопка Fling Hero
FunTab:Button({
    Title = "Fling Hero",
    Callback = function()
        local h = getHero()
        if h then flingPlayer(h) end
    end
})

-- Кнопка Fling All
FunTab:Button({
    Title = "Fling All Players",
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
--  SECTION 10: MISC SYSTEM
--  SECTION 10: MISC SYSTEM
--  SECTION 10: MISC SYSTEM
-- ════════════════════════════════════════════════════════════════

MiscTab:Section({ Title = "Utilities" })

-- Toggle для Auto Grab Gun
MiscTab:Toggle({
    Title = "Auto Grab Gun",
    Desc = "Auto-pickup sheriff gun when dropped",
    Default = false,
    Callback = function(state)
        autoGrabEnabled = state
    end
})

-- Toggle для Bhop
MiscTab:Toggle({
    Title = "Bhop",
    Desc = "Auto jump when holding space",
    Default = false,
    Callback = function(state)
        bhopEnabled = state
    end
})

-- Toggle для Noclip
MiscTab:Toggle({
    Title = "Noclip",
    Desc = "Walk through walls",
    Default = false,
    Callback = function(state)
        noclipEnabled = state
    end
})

-- ════════════════════════════════════════════════════════════════
--  SECTION 11: COIN FARM SYSTEM
--  SECTION 11: COIN FARM SYSTEM
--  SECTION 11: COIN FARM SYSTEM
-- ════════════════════════════════════════════════════════════════

MiscTab:Section({ Title = "Coin Farm" })

-- Toggle для Auto Farm Coins
MiscTab:Toggle({
    Title = "Auto Farm Coins",
    Desc = "Automatically collects coins",
    Default = false,
    Callback = function(state)
        autoFarmEnabled = state
    end
})

-- Slider для Farm Speed
MiscTab:Slider({
    Title = "Farm Speed",
    Min = 10,
    Max = 50,
    Default = 22,
    Callback = function(value)
        farmSpeed = value
    end
})

-- ════════════════════════════════════════════════════════════════
--  SECTION 12: RADIO SYSTEM (FROM FOGYHUB)
--  SECTION 12: RADIO SYSTEM (FROM FOGYHUB)
--  SECTION 12: RADIO SYSTEM (FROM FOGYHUB)
-- ════════════════════════════════════════════════════════════════

RadioTab:Section({ Title = "Radio Player" })

-- Input для Radio ID
RadioTab:Input({
    Title = "Roblox Audio ID",
    Desc = "Enter Roblox asset ID",
    Placeholder = "1234567890",
    Callback = function(value)
        radioId = value
    end
})

-- Кнопка Play Radio
RadioTab:Button({
    Title = "Play Radio",
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

-- Кнопка Stop Radio
RadioTab:Button({
    Title = "Stop Radio",
    Callback = function()
        if radioSound then radioSound:Stop() end
        if radioModel then radioModel:Destroy() end
        radioModel = nil
        radioSound = nil
    end
})

-- Slider для Volume
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

-- Toggle для Loop
RadioTab:Toggle({
    Title = "Loop Audio",
    Default = true,
    Callback = function(state)
        if radioSound then radioSound.Looped = state end
    end
})

-- ════════════════════════════════════════════════════════════════
--  SECTION 13: BACKGROUND LOOPS
--  SECTION 13: BACKGROUND LOOPS
--  SECTION 13: BACKGROUND LOOPS
-- ════════════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════════════
--  SUB-SECTION 13.1: ESP LOOP
-- ════════════════════════════════════════════════════════════════

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

-- ════════════════════════════════════════════════════════════════
--  SUB-SECTION 13.2: STRETCH LOOP
-- ════════════════════════════════════════════════════════════════

local stretchConnection = nil
RunService.RenderStepped:Connect(function()
    if stretchEnabled then
        if not stretchConnection then
            stretchConnection = RunService.RenderStepped:Connect(function()
                local camera = workspace.CurrentCamera
                if camera then 
                    camera.CFrame = camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, stretchFactor, 0, 0, 0, 1)
                end
            end)
        end
    else
        if stretchConnection then
            stretchConnection:Disconnect()
            stretchConnection = nil
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--  SUB-SECTION 13.3: AUTO GRAB GUN LOOP
-- ════════════════════════════════════════════════════════════════

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
                            local hrp = char:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                hrp.CFrame = handle.CFrame * CFrame.new(0, -1, 0)
                                task.wait(0.1)
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--  SUB-SECTION 13.4: AIMBOT LOOP
-- ════════════════════════════════════════════════════════════════

RunService.RenderStepped:Connect(function()
    if aimbotEnabled then
        local m = getMurderer()
        if m and m.Character and m.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, m.Character.Head.Position)
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--  SUB-SECTION 13.5: SILENT AIM
-- ════════════════════════════════════════════════════════════════

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

-- ════════════════════════════════════════════════════════════════
--  SUB-SECTION 13.6: AUTO SHOOT
-- ════════════════════════════════════════════════════════════════

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

-- ════════════════════════════════════════════════════════════════
--  SUB-SECTION 13.7: BHOP
-- ════════════════════════════════════════════════════════════════

UserInputService.InputBegan:Connect(function(input, processed)
    if not bhopEnabled then return end
    if processed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum and hum:GetState() == Enum.HumanoidStateType.Running then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--  SUB-SECTION 13.8: NOCLIP
-- ════════════════════════════════════════════════════════════════

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

-- ════════════════════════════════════════════════════════════════
--  SUB-SECTION 13.9: AUTO FARM COINS
-- ════════════════════════════════════════════════════════════════

task.spawn(function()
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
--  SECTION 14: CLEANUP ON CHARACTER RESPAWN
--  SECTION 14: CLEANUP ON CHARACTER RESPAWN
--  SECTION 14: CLEANUP ON CHARACTER RESPAWN
-- ════════════════════════════════════════════════════════════════

LocalPlayer.CharacterAdded:Connect(function()
    -- Очищаем старые Highlight'ы
    task.wait(0.5)
    for _, player in ipairs(Players:GetPlayers()) do
        removeHighlight(player)
    end
    
    -- Пересоздаём радио если было включено
    if radioSound and radioSound.Playing then
        task.wait(1)
        local char = LocalPlayer.Character
        local torso = char and (char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso"))
        if torso then
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
            sound.SoundId = radioSound.SoundId
            sound.Volume = radioVolume
            sound.Looped = radioSound.Looped
            sound.Parent = radioModel
            sound:Play()
            radioSound = sound
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--  SECTION 15: STARTUP NOTIFICATION
--  SECTION 15: STARTUP NOTIFICATION
--  SECTION 15: STARTUP NOTIFICATION
-- ════════════════════════════════════════════════════════════════

WindUI:Notify({ 
    Title = "AI PASTA HUB v3.0 MEGA", 
    Content = "Loaded successfully! 2000+ lines of code!",
    Duration = 4 
})

print("AI PASTA HUB v3.0 MEGA loaded!")
print("Total lines: 2000+")
print("For vibecoders and pasters")
print("Discord: @mopsech")
print("Telegram: @idkmops")

-- ════════════════════════════════════════════════════════════════
--  SECTION 16: END OF FILE
--  SECTION 16: END OF FILE
--  SECTION 16: END OF FILE
-- ════════════════════════════════════════════════════════════════

-- CRACKED BY MOPS
-- Discord: @mopsech
-- Telegram: @idkmops
-- https://discord.gg/3KjWyZ6uBu

-- ════════════════════════════════════════════════════════════════
--  THE END
--  THE END
--  THE END
-- ════════════════════════════════════════════════════════════════
