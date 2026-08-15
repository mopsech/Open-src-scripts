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
-- AI PASTA HUB v3.0 (НОВЫЙ ДИЗАЙН КНОПОК ИЗ CANDYZONE)
-- For vibecoders and pasters
-- Discord: @mopsech | Telegram: @idkmops
-- ════════════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════════════
--  SECTION 1: LIBRARY LOADING
-- ════════════════════════════════════════════════════════════════

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- ════════════════════════════════════════════════════════════════
--  SECTION 2: WINDOW CREATION
-- ════════════════════════════════════════════════════════════════

local Window = WindUI:CreateWindow({
    Title = "AI PASTA HUB",
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
--  SECTION 3: SERVICES AND VARIABLES
-- ════════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- States
local espRoleEnabled = false
local espNameEnabled = false
local aimbotEnabled = false
local bhopEnabled = false
local autoGrabEnabled = false
local radioVolume = 2
local radioSound = nil
local radioModel = nil
local noclipEnabled = false
local fullbrightEnabled = false
local stretchEnabled = false
local stretchFactor = 0.75
local autoFarmEnabled = false
local farmSpeed = 22
local bombJumpCooldown = false
local goldBombCooldown = false
local autoShootEnabled = false

-- ════════════════════════════════════════════════════════════════
--  SECTION 4: TAB CREATION
-- ════════════════════════════════════════════════════════════════

local VisualsTab = Window:Tab({ Title = "Visuals", Icon = "eye" })
local CombatTab = Window:Tab({ Title = "Combat", Icon = "sword" })
local FunTab = Window:Tab({ Title = "Fun", Icon = "party-popper" })
local MiscTab = Window:Tab({ Title = "Misc", Icon = "settings" })
local RadioTab = Window:Tab({ Title = "Radio", Icon = "music" })

-- ════════════════════════════════════════════════════════════════
--  SECTION 5: HELPER FUNCTIONS
-- ════════════════════════════════════════════════════════════════

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

-- ════════════════════════════════════════════════════════════════
--  SECTION 6: BOMB JUMP (ИЗ CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local function bombJump(bombType, isGold)
    local char = LocalPlayer.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    if isGold and goldBombCooldown then
        WindUI:Notify({Title = "Cooldown", Content = "Gold bomb on cooldown", Duration = 2})
        return
    end
    if not isGold and bombJumpCooldown then
        WindUI:Notify({Title = "Cooldown", Content = "Bomb on cooldown", Duration = 2})
        return
    end
    
    local remote = ReplicatedStorage:FindFirstChild("Remotes")
    if remote then
        local extras = remote:FindFirstChild("Extras")
        if extras then
            local toyRemote = extras:FindFirstChild("ReplicateToy")
            if toyRemote then
                pcall(function()
                    toyRemote:InvokeServer(bombType)
                    char.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                    hrp.AssemblyLinearVelocity = Vector3.new(
                        hrp.AssemblyLinearVelocity.X,
                        62,
                        hrp.AssemblyLinearVelocity.Z
                    )
                    
                    if isGold then
                        goldBombCooldown = true
                        task.wait(21)
                        goldBombCooldown = false
                    else
                        bombJumpCooldown = true
                        task.wait(4)
                        bombJumpCooldown = false
                    end
                end)
            end
        end
    end
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 7: AUTO SHOOT (ИЗ CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local function autoShoot()
    if not autoShootEnabled then return end
    
    local char = LocalPlayer.Character
    if not char then return end
    
    local gun = char:FindFirstChild("Gun") or char:FindFirstChild("Revolver")
    if not gun then return end
    
    local murderer = getMurderer()
    if murderer and murderer.Character then
        local target = murderer.Character:FindFirstChild("HumanoidRootPart")
        if target then
            local shoot = gun:FindFirstChild("Shoot") or gun:FindFirstChild("Fire")
            if shoot then
                pcall(function()
                    shoot:FireServer(
                        CFrame.new(gun.Handle.Position, target.Position),
                        target.Position
                    )
                end)
            end
        end
    end
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 8: DRAGGABLE BUTTON (ИЗ CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local function makeDraggable(frame)
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    
    frame.InputChanged:Connect(function(input)
        if dragging then
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 9: BUTTON CREATOR (ДИЗАЙН ИЗ CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PastaButtons"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 10
ScreenGui.Parent = game.CoreGui

local buttons = {}

local function createButton(name, pos, color, label, callback)
    local btn = Instance.new("TextButton")
    btn.Name = "PastaBtn_" .. name
    btn.Size = UDim2.new(0, 88, 0, 88)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 0.6
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Parent = ScreenGui
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 12)
    
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = color
    stroke.Thickness = 1.5
    stroke.Transparency = 0.4
    
    local lbl = Instance.new("TextLabel", btn)
    lbl.Name = "Lbl"
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = color
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 12
    lbl.TextYAlignment = Enum.TextYAlignment.Center
    lbl.TextXAlignment = Enum.TextXAlignment.Center
    
    btn.MouseButton1Click:Connect(callback)
    makeDraggable(btn)
    
    buttons[name] = {
        btn = btn,
        stroke = stroke,
        lbl = lbl,
    }
    
    return buttons[name]
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 10: CREATE ALL BUTTONS (ДИЗАЙН ИЗ CANDYZONE)
-- ════════════════════════════════════════════════════════════════

-- Gold Bomb
local goldBtn = createButton(
    "GoldBomb",
    UDim2.new(0.5, -210, 0.78, 0),
    Color3.fromRGB(255, 215, 0),
    "GOLD\nJUMP",
    function()
        bombJump("GoldBomb", true)
    end
)

-- Normal Bomb
local normalBtn = createButton(
    "NormalBomb",
    UDim2.new(0.5, -110, 0.78, 0),
    Color3.fromRGB(0, 170, 255),
    "NORMAL\nJUMP",
    function()
        bombJump("FakeBomb", false)
    end
)

-- Auto Shoot
local shootBtn = createButton(
    "Shoot",
    UDim2.new(0.5, -10, 0.78, 0),
    Color3.fromRGB(255, 255, 255),
    "AUTO\nSHOOT",
    function()
        autoShootEnabled = not autoShootEnabled
        shootBtn.lbl.Text = autoShootEnabled and "AUTO\nON" or "AUTO\nSHOOT"
        shootBtn.stroke.Color = autoShootEnabled and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 255, 255)
        shootBtn.lbl.TextColor3 = autoShootEnabled and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 255, 255)
    end
)

-- ESP
local espBtn = createButton(
    "ESP",
    UDim2.new(0.5, 90, 0.78, 0),
    Color3.fromRGB(10, 140, 30),
    "ESP\nOFF",
    function()
        espRoleEnabled = not espRoleEnabled
        espBtn.lbl.Text = espRoleEnabled and "ESP\nON" or "ESP\nOFF"
        espBtn.stroke.Color = espRoleEnabled and Color3.fromRGB(50, 220, 80) or Color3.fromRGB(10, 140, 30)
        espBtn.lbl.TextColor3 = espRoleEnabled and Color3.fromRGB(50, 220, 80) or Color3.fromRGB(10, 140, 30)
    end
)

-- Speed Glitch
local speedBtn = createButton(
    "Speed",
    UDim2.new(0.5, -278, 0.78, 0),
    Color3.fromRGB(0, 140, 120),
    "SPEED",
    function()
        bhopEnabled = not bhopEnabled
        speedBtn.lbl.Text = bhopEnabled and "SPEED\nON" or "SPEED"
        speedBtn.stroke.Color = bhopEnabled and Color3.fromRGB(0, 220, 200) or Color3.fromRGB(0, 140, 120)
        speedBtn.lbl.TextColor3 = bhopEnabled and Color3.fromRGB(0, 220, 200) or Color3.fromRGB(0, 140, 120)
    end
)

-- Stretch
local stretchBtn = createButton(
    "Stretch",
    UDim2.new(0.5, -214, 0.78, 0),
    Color3.fromRGB(200, 80, 0),
    "STRETCH",
    function()
        stretchEnabled = not stretchEnabled
        stretchBtn.lbl.Text = stretchEnabled and "STRETCH\nON" or "STRETCH"
        stretchBtn.stroke.Color = stretchEnabled and Color3.fromRGB(255, 140, 30) or Color3.fromRGB(200, 80, 0)
        stretchBtn.lbl.TextColor3 = stretchEnabled and Color3.fromRGB(255, 140, 30) or Color3.fromRGB(200, 80, 0)
    end
)

-- ════════════════════════════════════════════════════════════════
--  SECTION 11: ESP SYSTEM (ИЗ FOGYHUB)
-- ════════════════════════════════════════════════════════════════

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

local function removeHighlight(player)
    local character = player.Character
    if character then
        local highlight = character:FindFirstChild("PastaHub_ESP")
        if highlight then highlight:Destroy() end
    end
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 12: VISUALS TAB UI
-- ════════════════════════════════════════════════════════════════

VisualsTab:Section({ Title = "ESP Settings" })

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

VisualsTab:Toggle({
    Title = "Name ESP",
    Desc = "Show player names above heads",
    Default = false,
    Callback = function(state)
        espNameEnabled = state
    end
})

VisualsTab:Section({ Title = "Screen Effects" })

VisualsTab:Toggle({
    Title = "Screen Stretch",
    Desc = "Stretch your screen for better view",
    Default = false,
    Callback = function(state)
        stretchEnabled = state
    end
})

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

-- ════════════════════════════════════════════════════════════════
--  SECTION 13: COMBAT TAB UI
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

-- ════════════════════════════════════════════════════════════════
--  SECTION 14: FUN TAB UI (НОВЫЕ КНОПКИ ДЛЯ GUI)
-- ════════════════════════════════════════════════════════════════

FunTab:Section({ Title = "Bomb Jump" })

FunTab:Button({
    Title = "Gold Bomb Jump",
    Callback = function()
        bombJump("GoldBomb", true)
    end
})

FunTab:Button({
    Title = "Normal Bomb Jump",
    Callback = function()
        bombJump("FakeBomb", false)
    end
})

FunTab:Section({ Title = "Auto Shoot" })

FunTab:Toggle({
    Title = "Auto Shoot Murderer",
    Desc = "Auto shoot when gun equipped",
    Default = false,
    Callback = function(state)
        autoShootEnabled = state
    end
})

FunTab:Section({ Title = "Fling" })

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

FunTab:Button({
    Title = "Fling Murderer",
    Callback = function()
        local m = getMurderer()
        if m then flingPlayer(m) end
    end
})

FunTab:Button({
    Title = "Fling Sheriff",
    Callback = function()
        local s = getSheriff()
        if s then flingPlayer(s) end
    end
})

FunTab:Button({
    Title = "Fling Hero",
    Callback = function()
        local h = getHero()
        if h then flingPlayer(h) end
    end
})

-- ════════════════════════════════════════════════════════════════
--  SECTION 15: MISC TAB UI
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
    Title = "Bhop",
    Desc = "Auto jump when holding space",
    Default = false,
    Callback = function(state)
        bhopEnabled = state
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

MiscTab:Section({ Title = "Coin Farm" })

MiscTab:Toggle({
    Title = "Auto Farm Coins",
    Desc = "Automatically collects coins",
    Default = false,
    Callback = function(state)
        autoFarmEnabled = state
    end
})

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
--  SECTION 16: RADIO TAB UI
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

RadioTab:Button({
    Title = "Stop Radio",
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
--  SECTION 17: BACKGROUND LOOPS
-- ════════════════════════════════════════════════════════════════

-- ESP Loop
RunService.RenderStepped:Connect(function()
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

-- Stretch
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

-- Aimbot
RunService.RenderStepped:Connect(function()
    if aimbotEnabled then
        local m = getMurderer()
        if m and m.Character and m.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, m.Character.Head.Position)
        end
    end
end)

-- Bhop
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

-- Auto Farm Coins
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

task.spawn(function()
    while true do
        task.wait(0.5)
        if autoFarmEnabled then
            pcall(function()
                local char = LocalPlayer.Character                local hrp = char and char:FindFirstChild("HumanoidRootPart")
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

-- Auto Shoot Loop
task.spawn(function()
    while true do
        task.wait(0.15)
        if autoShootEnabled then
            pcall(autoShoot)
        end
    end
end)

-- Button cooldown updates
RunService.Heartbeat:Connect(function()
    if goldBtn and goldBtn.lbl then
        goldBtn.lbl.Text = goldBombCooldown and "WAIT..." or "GOLD\nJUMP"
    end
    if normalBtn and normalBtn.lbl then
        normalBtn.lbl.Text = bombJumpCooldown and "WAIT..." or "NORMAL\nJUMP"
    end
end)

-- ════════════════════════════════════════════════════════════════
--  SECTION 18: STARTUP
-- ════════════════════════════════════════════════════════════════

WindUI:Notify({ 
    Title = "AI PASTA HUB v3.0", 
    Content = "Loaded successfully! New buttons from CandyZone!",
    Duration = 3 
})

print("AI PASTA HUB v3.0 loaded!")
print("New button design from CandyZone!")
print("For vibecoders and pasters")

-- ════════════════════════════════════════════════════════════════
-- CRACKED BY MOPS
-- Discord: @mopsech
-- Telegram: @idkmops
-- https://discord.gg/3KjWyZ6uBu
-- ════════════════════════════════════════════════════════════════
