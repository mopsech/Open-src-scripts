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
-- 🍝 MEGA PASTA HUB v5.0 🍝
-- PASTED FROM CANDYZONE - 2500+ LINES
-- Discord: @mopsech | Telegram: @idkmops
-- ════════════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════════════
--  SECTION 1: LIBRARY LOADING
-- ════════════════════════════════════════════════════════════════

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

if not WindUI then
    error("Failed to load WindUI!")
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 2: WINDOW CREATION
-- ════════════════════════════════════════════════════════════════

local Window = WindUI:CreateWindow({
    Title = "🍝 MEGA PASTA HUB",
    Icon = "spaghetti",
    Author = "pasted from CandyZone",
    Theme = "Crimson"
})

pcall(function()
    if Window.SetTransparency then
        Window:SetTransparency(0.1)
    end
    if Window.SetThemeColor then
        Window:SetThemeColor(Color3.fromRGB(220, 38, 38))
    end
end)

-- ════════════════════════════════════════════════════════════════
--  SECTION 3: SERVICES AND VARIABLES
-- ════════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- ════════════════════════════════════════════════════════════════
--  SECTION 4: STATES
-- ════════════════════════════════════════════════════════════════

local espEnabled = false
local espRoleEnabled = false
local espNameEnabled = false
local bombJumpCooldown = false
local goldBombCooldown = false
local autoShootEnabled = false
local speedGlitchEnabled = false
local speedGlitchSpeed = 200
local noclipEnabled = false
local antiFlingEnabled = false
local antiFlingCap = 200
local stretchEnabled = false
local stretchFactor = 0.5
local fullbrightEnabled = false
local lowGraphicsEnabled = false
local highGraphicsEnabled = false
local fovValue = 70
local crosshairEnabled = false
local crosshairSpin = false
local crosshairId = "5159914132"
local crosshairObject = nil
local crosshairSpinConnection = nil

-- ESP Data
local espData = {}
local espColors = {
    Murderer = Color3.fromRGB(255, 40, 40),
    Sheriff = Color3.fromRGB(40, 130, 255),
    Hero = Color3.fromRGB(255, 215, 0),
    Innocent = Color3.fromRGB(0, 220, 0),
}
local espFilters = {
    Murderer = true,
    Sheriff = true,
    Hero = true,
    Innocent = true,
    Self = true,
}

-- Button states
local buttonStates = {
    GoldBomb = true,
    NormalBomb = true,
    Shoot = true,
    ESP = false,
    Speed = false,
    Stretch = false,
}

-- ════════════════════════════════════════════════════════════════
--  SECTION 5: SCREEN GUI FOR BUTTONS
-- ════════════════════════════════════════════════════════════════

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MegaPasta_Buttons"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 10
ScreenGui.Parent = game.CoreGui

local buttonFrames = {}

-- ════════════════════════════════════════════════════════════════
--  SECTION 6: DRAGGABLE BUTTON FUNCTION (FROM CANDYZONE)
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
--  SECTION 7: BUTTON CREATOR (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local function createPastaButton(name, pos, color, label, callback)
    if buttonFrames[name] then
        buttonFrames[name].btn:Destroy()
        buttonFrames[name] = nil
    end
    
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
    
    local img = Instance.new("ImageLabel", btn)
    img.Name = "SpinImg"
    img.Size = UDim2.new(0, 40, 0, 40)
    img.Position = UDim2.new(0.5, -20, 0.25, 0)
    img.BackgroundTransparency = 1
    img.Visible = false
    
    btn.MouseButton1Click:Connect(callback)
    makeDraggable(btn)
    
    buttonFrames[name] = {
        btn = btn,
        stroke = stroke,
        lbl = lbl,
        img = img,
    }
    
    return buttonFrames[name]
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 8: ESP SYSTEM (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local function getRole(player)
    local char = player.Character
    if not char then return "Innocent" end
    local bp = player:FindFirstChild("Backpack")
    
    if (char:FindFirstChild("Knife") or (bp and bp:FindFirstChild("Knife"))) then
        return "Murderer"
    end
    if (char:FindFirstChild("Gun") or char:FindFirstChild("Revolver") or 
        (bp and (bp:FindFirstChild("Gun") or bp:FindFirstChild("Revolver")))) then
        return "Sheriff"
    end
    return "Innocent"
end

local function applyHighlight(player, color)
    local char = player.Character
    if not char then return end
    
    local hl = char:FindFirstChild("MegaPastaESP")
    if not hl then
        hl = Instance.new("Highlight")
        hl.Name = "MegaPastaESP"
        hl.FillTransparency = 0.6
        hl.OutlineTransparency = 0.15
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        hl.Parent = char
    end
    hl.FillColor = color
    hl.OutlineColor = color
    hl.Enabled = true
end

local function removeHighlight(player)
    local char = player.Character
    if char then
        local hl = char:FindFirstChild("MegaPastaESP")
        if hl then hl:Destroy() end
    end
end

local function updateESP()
    if not espEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            removeHighlight(player)
        end
        return
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer and not espFilters.Self then
            removeHighlight(player)
        elseif player ~= LocalPlayer then
            local role = getRole(player)
            if espFilters[role] then
                applyHighlight(player, espColors[role] or Color3.fromRGB(0, 255, 0))
            else
                removeHighlight(player)
            end
        end
    end
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 9: BOMB JUMP (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local function bombJump(bombType, isGold)
    local char = LocalPlayer.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    if isGold and goldBombCooldown then
        WindUI:Notify({Title = "Cooldown", Content = "Gold bomb on cooldown", Duration = 2, Icon = "bell"})
        return
    end
    if not isGold and bombJumpCooldown then
        WindUI:Notify({Title = "Cooldown", Content = "Bomb on cooldown", Duration = 2, Icon = "bell"})
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
--  SECTION 10: AUTO SHOOT (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local function findMurderer()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if getRole(player) == "Murderer" then
                return player
            end
        end
    end
    return nil
end

local function autoShoot()
    if not autoShootEnabled then return end
    
    local char = LocalPlayer.Character
    if not char then return end
    
    local gun = char:FindFirstChild("Gun") or char:FindFirstChild("Revolver")
    if not gun then return end
    
    local murderer = findMurderer()
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
--  SECTION 11: SPEED GLITCH (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local speedConnection = nil

local function toggleSpeedGlitch(state)
    speedGlitchEnabled = state
    
    if speedConnection then
        speedConnection:Disconnect()
        speedConnection = nil
    end
    
    if state then
        speedConnection = RunService.RenderStepped:Connect(function()
            local char = LocalPlayer.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    local state2 = hum:GetState()
                    if state2 == Enum.HumanoidStateType.Jumping or state2 == Enum.HumanoidStateType.Freefall then
                        hum.WalkSpeed = speedGlitchSpeed
                    else
                        hum.WalkSpeed = 16
                    end
                end
            end
        end)
    else
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.WalkSpeed = 16
            end
        end
    end
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 12: STRETCH (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local stretchConnection = nil

local function toggleStretch(state)
    stretchEnabled = state
    
    if stretchConnection then
        stretchConnection:Disconnect()
        stretchConnection = nil
    end
    
    if state then
        stretchConnection = RunService.RenderStepped:Connect(function()
            local cam = workspace.CurrentCamera
            if cam then
                cam.CFrame = cam.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, stretchFactor, 0, 0, 0, 1)
            end
        end)
    end
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 13: NOCLIP (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local function toggleNoclip(state)
    noclipEnabled = state
end

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
--  SECTION 14: ANTI-FLING (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local antiFlingConnection = nil

local function toggleAntiFling(state)
    antiFlingEnabled = state
    
    if antiFlingConnection then
        antiFlingConnection:Disconnect()
        antiFlingConnection = nil
    end
    
    if state then
        antiFlingConnection = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local vel = hrp.AssemblyLinearVelocity
                    if vel.Magnitude > antiFlingCap then
                        hrp.AssemblyLinearVelocity = vel.Unit * antiFlingCap
                    end
                end
            end
        end)
    end
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 15: FULLBRIGHT (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local function toggleFullbright(state)
    fullbrightEnabled = state
    if state then
        Lighting.Brightness = 2
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.ClockTime = 14
        Lighting.FogEnd = 999999
    else
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        Lighting.FogEnd = 1000
    end
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 16: LOW GRAPHICS (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local lowGraphicsConnection = nil
local savedMaterials = {}

local function toggleLowGraphics(state)
    lowGraphicsEnabled = state
    
    if lowGraphicsConnection then
        lowGraphicsConnection:Disconnect()
        lowGraphicsConnection = nil
    end
    
    if state then
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)
        
        Lighting.GlobalShadows = false
        Lighting.Brightness = 2
        
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                if not savedMaterials[obj] then
                    savedMaterials[obj] = obj.Material
                end
                obj.Material = Enum.Material.SmoothPlastic
                obj.CastShadow = false
            end
            if obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Transparency = 1
            end
        end
        
        lowGraphicsConnection = Workspace.DescendantAdded:Connect(function(desc)
            task.wait(0.1)
            if desc:IsA("BasePart") then
                desc.Material = Enum.Material.SmoothPlastic
                desc.CastShadow = false
            end
            if desc:IsA("Decal") or desc:IsA("Texture") then
                desc.Transparency = 1
            end
        end)
    else
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        end)
        
        Lighting.GlobalShadows = true
        Lighting.Brightness = 1
        
        for obj, mat in pairs(savedMaterials) do
            if obj and obj.Parent then
                obj.Material = mat
                obj.CastShadow = true
            end
        end
        savedMaterials = {}
    end
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 17: HIGH GRAPHICS (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local function toggleHighGraphics(state)
    highGraphicsEnabled = state
    
    if state then
        if lowGraphicsEnabled then
            toggleLowGraphics(false)
        end
        
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level21
        end)
        
        Lighting.GlobalShadows = true
        Lighting.Brightness = 3.5
        Lighting.Ambient = Color3.fromRGB(80, 80, 100)
        Lighting.OutdoorAmbient = Color3.fromRGB(100, 110, 130)
        
        local bloom = Lighting:FindFirstChildOfClass("BloomEffect") or Instance.new("BloomEffect", Lighting)
        bloom.Intensity = 0.6
        bloom.Size = 24
        bloom.Threshold = 0.95
        
        local sunRays = Lighting:FindFirstChildOfClass("SunRaysEffect") or Instance.new("SunRaysEffect", Lighting)
        sunRays.Intensity = 0.25
        sunRays.Spread = 1
        
        local colorCorr = Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect", Lighting)
        colorCorr.Saturation = 0.2
        colorCorr.Contrast = 0.1
        colorCorr.Brightness = 0.05
    else
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        end)
        
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
        Lighting.Ambient = Color3.fromRGB(0, 0, 0)
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        
        for _, child in ipairs(Lighting:GetChildren()) do
            if child:IsA("BloomEffect") or child:IsA("SunRaysEffect") or child:IsA("ColorCorrectionEffect") then
                child:Destroy()
            end
        end
    end
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 18: CROSSHAIR (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

local function createCrosshair()
    if crosshairObject then
        crosshairObject:Destroy()
        crosshairObject = nil
    end
    
    if crosshairSpinConnection then
        crosshairSpinConnection:Disconnect()
        crosshairSpinConnection = nil
    end
    
    if not crosshairEnabled then return end
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "MegaPastaCrosshair"
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 25
    gui.IgnoreGuiInset = true
    gui.Parent = game.CoreGui
    
    local img = Instance.new("ImageLabel", gui)
    img.AnchorPoint = Vector2.new(0.5, 0.5)
    img.Position = UDim2.new(0.5, 0, 0.5, 0)
    img.Size = UDim2.new(0, 42, 0, 42)
    img.BackgroundTransparency = 1
    img.Image = "rbxassetid://" .. crosshairId
    img.ZIndex = 10
    img.Visible = false
    
    crosshairObject = img
    
    if crosshairSpin then
        crosshairSpinConnection = RunService.RenderStepped:Connect(function()
            if img and img.Parent and img.Visible then
                img.Rotation = img.Rotation + 4
            end
        end)
    end
    
    RunService.RenderStepped:Connect(function()
        if img and img.Parent then
            local visible = crosshairEnabled and (UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter)
            img.Visible = visible
            UserInputService.MouseIconEnabled = not visible
        end
    end)
end

-- ════════════════════════════════════════════════════════════════
--  SECTION 19: CREATE ALL BUTTONS
-- ════════════════════════════════════════════════════════════════

-- Gold Bomb
local goldBtn = createPastaButton(
    "GoldBomb",
    UDim2.new(0.5, -210, 0.78, 0),
    Color3.fromRGB(255, 215, 0),
    "GOLD\nJUMP",
    function()
        bombJump("GoldBomb", true)
    end
)

-- Normal Bomb
local normalBtn = createPastaButton(
    "NormalBomb",
    UDim2.new(0.5, -110, 0.78, 0),
    Color3.fromRGB(0, 170, 255),
    "NORMAL\nJUMP",
    function()
        bombJump("FakeBomb", false)
    end
)

-- Auto Shoot
local shootBtn = createPastaButton(
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
local espBtn = createPastaButton(
    "ESP",
    UDim2.new(0.5, 90, 0.78, 0),
    Color3.fromRGB(10, 140, 30),
    "ESP\nOFF",
    function()
        espEnabled = not espEnabled
        espBtn.lbl.Text = espEnabled and "ESP\nON" or "ESP\nOFF"
        espBtn.stroke.Color = espEnabled and Color3.fromRGB(50, 220, 80) or Color3.fromRGB(10, 140, 30)
        espBtn.lbl.TextColor3 = espEnabled and Color3.fromRGB(50, 220, 80) or Color3.fromRGB(10, 140, 30)
        updateESP()
    end
)

-- Speed Glitch
local speedBtn = createPastaButton(
    "Speed",
    UDim2.new(0.5, -278, 0.78, 0),
    Color3.fromRGB(0, 140, 120),
    "SPEED",
    function()
        speedGlitchEnabled = not speedGlitchEnabled
        toggleSpeedGlitch(speedGlitchEnabled)
        speedBtn.lbl.Text = speedGlitchEnabled and "SPEED\nON" or "SPEED"
        speedBtn.stroke.Color = speedGlitchEnabled and Color3.fromRGB(0, 220, 200) or Color3.fromRGB(0, 140, 120)
        speedBtn.lbl.TextColor3 = speedGlitchEnabled and Color3.fromRGB(0, 220, 200) or Color3.fromRGB(0, 140, 120)
    end
)

-- Stretch
local stretchBtn = createPastaButton(
    "Stretch",
    UDim2.new(0.5, -214, 0.78, 0),
    Color3.fromRGB(200, 80, 0),
    "STRETCH",
    function()
        stretchEnabled = not stretchEnabled
        toggleStretch(stretchEnabled)
        stretchBtn.lbl.Text = stretchEnabled and "STRETCH\nON" or "STRETCH"
        stretchBtn.stroke.Color = stretchEnabled and Color3.fromRGB(255, 140, 30) or Color3.fromRGB(200, 80, 0)
        stretchBtn.lbl.TextColor3 = stretchEnabled and Color3.fromRGB(255, 140, 30) or Color3.fromRGB(200, 80, 0)
    end
)

-- ════════════════════════════════════════════════════════════════
--  SECTION 20: UI UPDATE LOOP (FROM CANDYZONE)
-- ════════════════════════════════════════════════════════════════

RunService.Heartbeat:Connect(function()
    if goldBtn and goldBtn.lbl then
        goldBtn.lbl.Text = goldBombCooldown and "WAIT..." or "GOLD\nJUMP"
    end
    if normalBtn and normalBtn.lbl then
        normalBtn.lbl.Text = bombJumpCooldown and "WAIT..." or "NORMAL\nJUMP"
    end
    if shootBtn and shootBtn.lbl then
        local hasKnife = LocalPlayer.Backpack:FindFirstChild("Knife") or 
                        (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Knife"))
        shootBtn.lbl.Text = hasKnife and "THROW" or "AUTO\nSHOOT"
    end
end)

-- ════════════════════════════════════════════════════════════════
--  SECTION 21: BACKGROUND LOOPS
-- ════════════════════════════════════════════════════════════════

-- ESP Update Loop
RunService.Heartbeat:Connect(function()
    updateESP()
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

-- ════════════════════════════════════════════════════════════════
--  SECTION 22: WINDUI TABS
-- ════════════════════════════════════════════════════════════════

local MainTab = Window:Tab({ Title = "Main", Icon = "zap" })
local EspTab = Window:Tab({ Title = "ESP", Icon = "eye" })
local VisualTab = Window:Tab({ Title = "Visuals", Icon = "palette" })

-- ════════════════════════════════════════════════════════════════
--  SECTION 23: MAIN TAB UI
-- ════════════════════════════════════════════════════════════════

MainTab:Paragraph({
    Title = "Auto-Loaded Buttons",
    Content = "Gold Bomb, Normal Bomb and Auto Shoot are enabled by default.",
})

MainTab:Toggle({
    Title = "Show Gold Bomb",
    Default = true,
    Callback = function(state)
        if state then
            goldBtn.btn.Visible = true
        else
            goldBtn.btn.Visible = false
        end
    end
})

MainTab:Toggle({
    Title = "Show Normal Bomb",
    Default = true,
    Callback = function(state)
        if state then
            normalBtn.btn.Visible = true
        else
            normalBtn.btn.Visible = false
        end
    end
})

MainTab:Toggle({
    Title = "Show Auto Shoot",
    Default = true,
    Callback = function(state)
        if state then
            shootBtn.btn.Visible = true
        else
            shootBtn.btn.Visible = false
        end
    end
})

MainTab:Divider()

MainTab:Paragraph({
    Title = "Optional Buttons",
    Content = "Toggle to add or remove from screen.",
})

MainTab:Toggle({
    Title = "Load ESP Toggle",
    Default = false,
    Callback = function(state)
        espBtn.btn.Visible = state
    end
})

MainTab:Toggle({
    Title = "Load Speed Glitch",
    Default = false,
    Callback = function(state)
        speedBtn.btn.Visible = state
    end
})

MainTab:Toggle({
    Title = "Load Stretch",
    Default = false,
    Callback = function(state)
        stretchBtn.btn.Visible = state
    end
})

MainTab:Divider()

MainTab:Button({
    Title = "Speed Glitch Slider",
    Description = "Set speed value (50-600)",
    Callback = function()
        local function showSlider()
            local gui = Instance.new("ScreenGui", game.CoreGui)
            gui.Name = "SpeedSlider"
            gui.ResetOnSpawn = false
            
            local frame = Instance.new("Frame", gui)
            frame.Size = UDim2.new(0, 300, 0, 150)
            frame.Position = UDim2.new(0.5, -150, 0.35, 0)
            frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
            frame.BackgroundTransparency = 0.08
            frame.BorderSizePixel = 0
            Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
            
            local label = Instance.new("TextLabel", frame)
            label.Size = UDim2.new(1, 0, 0, 36)
            label.Position = UDim2.new(0, 0, 0, 0)
            label.BackgroundTransparency = 1
            label.Text = "Speed Glitch: " .. speedGlitchSpeed
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 14
            
            local slider = Instance.new("Frame", frame)
            slider.Size = UDim2.new(1, -30, 0, 10)
            slider.Position = UDim2.new(0, 15, 0, 50)
            slider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            slider.BorderSizePixel = 0
            Instance.new("UICorner", slider).CornerRadius = UDim.new(1, 0)
            
            local fill = Instance.new("Frame", slider)
            local percent = (speedGlitchSpeed - 50) / (600 - 50)
            fill.Size = UDim2.new(percent, 0, 1, 0)
            fill.BackgroundColor3 = Color3.fromRGB(220, 38, 38)
            fill.BorderSizePixel = 0
            Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
            
            local knob = Instance.new("TextButton", slider)
            knob.Size = UDim2.new(0, 26, 0, 26)
            knob.Position = UDim2.new(percent, -13, 0.5, -13)
            knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            knob.Text = ""
            knob.BorderSizePixel = 0
            Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)
            
            local apply = Instance.new("TextButton", frame)
            apply.Size = UDim2.new(0.8, 0, 0, 36)
            apply.Position = UDim2.new(0.1, 0, 1, -46)
            apply.BackgroundColor3 = Color3.fromRGB(20, 160, 20)
            apply.Text = "Apply"
            apply.TextColor3 = Color3.fromRGB(255, 255, 255)
            apply.Font = Enum.Font.GothamBold
            apply.TextSize = 13
            Instance.new("UICorner", apply).CornerRadius = UDim.new(0, 6)
            
            local dragging = false
            
            local function updateSlider(x)
                local pos = math.clamp((x - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
                local value = math.round(50 + pos * 550)
                speedGlitchSpeed = value
                fill.Size = UDim2.new(pos, 0, 1, 0)
                knob.Position = UDim2.new(pos, -13, 0.5, -13)
                label.Text = "Speed Glitch: " .. value
                if speedGlitchEnabled then
                    toggleSpeedGlitch(false)
                    toggleSpeedGlitch(true)
                end
            end
            
            knob.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                end
            end)
            
            slider.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    updateSlider(input.Position.X)
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    updateSlider(input.Position.X)
                end
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)
            
            apply.MouseButton1Click:Connect(function()
                gui:Destroy()
                WindUI:Notify({Title = "Speed", Content = "Speed set to " .. speedGlitchSpeed, Duration = 2, Icon = "bell"})
            end)
        end
        
        pcall(showSlider)
    end
})

MainTab:Toggle({
    Title = "Noclip",
    Description = "Walk through walls",
    Default = false,
    Callback = function(state)
        toggleNoclip(state)
    end
})

MainTab:Toggle({
    Title = "Anti-Fling",
    Description = "Prevent being flung",
    Default = false,
    Callback = function(state)
        toggleAntiFling(state)
    end
})

MainTab:Dropdown({
    Title = "Anti-Fling Cap",
    Options = {"50", "100", "150", "200", "300", "500"},
    Default = "200",
    Callback = function(value)
        antiFlingCap = tonumber(value) or 200
        if antiFlingEnabled then
            toggleAntiFling(false)
            toggleAntiFling(true)
        end
    end
})

-- ════════════════════════════════════════════════════════════════
--  SECTION 24: ESP TAB UI
-- ════════════════════════════════════════════════════════════════

EspTab:Toggle({
    Title = "Enable ESP",
    Default = false,
    Callback = function(state)
        espEnabled = state
        if not state then
            for _, player in ipairs(Players:GetPlayers()) do
                removeHighlight(player)
            end
        end
        updateESP()
    end
})

EspTab:Divider()

EspTab:Toggle({
    Title = "Show Murderer",
    Default = true,
    Callback = function(state)
        espFilters.Murderer = state
        updateESP()
    end
})

EspTab:Toggle({
    Title = "Show Sheriff",
    Default = true,
    Callback = function(state)
        espFilters.Sheriff = state
        updateESP()
    end
})

EspTab:Toggle({
    Title = "Show Hero",
    Default = true,
    Callback = function(state)
        espFilters.Hero = state
        updateESP()
    end
})

EspTab:Toggle({
    Title = "Show Innocents",
    Default = true,
    Callback = function(state)
        espFilters.Innocent = state
        updateESP()
    end
})

EspTab:Toggle({
    Title = "Show Self",
    Default = true,
    Callback = function(state)
        espFilters.Self = state
        updateESP()
    end
})

EspTab:Divider()

EspTab:ColorPicker({
    Title = "Murderer Color",
    Default = Color3.fromRGB(255, 40, 40),
    Callback = function(color)
        espColors.Murderer = color
        updateESP()
    end
})

EspTab:ColorPicker({
    Title = "Sheriff Color",
    Default = Color3.fromRGB(40, 130, 255),
    Callback = function(color)
        espColors.Sheriff = color
        updateESP()
    end
})

EspTab:ColorPicker({
    Title = "Hero Color",
    Default = Color3.fromRGB(255, 215, 0),
    Callback = function(color)
        espColors.Hero = color
        updateESP()
    end
})

EspTab:ColorPicker({
    Title = "Innocent Color",
    Default = Color3.fromRGB(0, 220, 0),
    Callback = function(color)
        espColors.Innocent = color
        updateESP()
    end
})

-- ════════════════════════════════════════════════════════════════
--  SECTION 25: VISUALS TAB UI
-- ════════════════════════════════════════════════════════════════

VisualTab:Toggle({
    Title = "Fullbright",
    Default = false,
    Callback = function(state)
        toggleFullbright(state)
    end
})

VisualTab:Toggle({
    Title = "Low Graphics (FPS Boost)",
    Default = false,
    Callback = function(state)
        if state and highGraphicsEnabled then
            toggleHighGraphics(false)
        end
        toggleLowGraphics(state)
    end
})

VisualTab:Toggle({
    Title = "High Graphics (Beautiful)",
    Default = false,
    Callback = function(state)
        if state and lowGraphicsEnabled then
            toggleLowGraphics(false)
        end
        toggleHighGraphics(state)
    end
})

VisualTab:Button({
    Title = "FOV Slider",
    Description = "Field of view selector",
    Callback = function()
        local function showFOVSlider()
            local gui = Instance.new("ScreenGui", game.CoreGui)
            gui.Name = "FOVSlider"
            gui.ResetOnSpawn = false
            
            local frame = Instance.new("Frame", gui)
            frame.Size = UDim2.new(0, 300, 0, 150)
            frame.Position = UDim2.new(0.5, -150, 0.35, 0)
            frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
            frame.BackgroundTransparency = 0.08
            frame.BorderSizePixel = 0
            Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
            
            local label = Instance.new("TextLabel", frame)
            label.Size = UDim2.new(1, 0, 0, 36)
            label.Position = UDim2.new(0, 0, 0, 0)
            label.BackgroundTransparency = 1
            label.Text = "FOV: " .. fovValue
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 14
            
            local slider = Instance.new("Frame", frame)
            slider.Size = UDim2.new(1, -30, 0, 10)
            slider.Position = UDim2.new(0, 15, 0, 50)
            slider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            slider.BorderSizePixel = 0
            Instance.new("UICorner", slider).CornerRadius = UDim.new(1, 0)
            
            local fill = Instance.new("Frame", slider)
            local percent = (fovValue - 30) / (120 - 30)
            fill.Size = UDim2.new(percent, 0, 1, 0)
            fill.BackgroundColor3 = Color3.fromRGB(220, 38, 38)
            fill.BorderSizePixel = 0
            Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
            
            local knob = Instance.new("TextButton", slider)
            knob.Size = UDim2.new(0, 26, 0, 26)
            knob.Position = UDim2.new(percent, -13, 0.5, -13)
            knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            knob.Text = ""
            knob.BorderSizePixel = 0
            Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)
            
            local apply = Instance.new("TextButton", frame)
            apply.Size = UDim2.new(0.8, 0, 0, 36)
            apply.Position = UDim2.new(0.1, 0, 1, -46)
            apply.BackgroundColor3 = Color3.fromRGB(20, 160, 20)
            apply.Text = "Apply"
            apply.TextColor3 = Color3.fromRGB(255, 255, 255)
            apply.Font = Enum.Font.GothamBold
            apply.TextSize = 13
            Instance.new("UICorner", apply).CornerRadius = UDim.new(0, 6)
            
            local dragging = false
            
            local function updateSlider(x)
                local pos = math.clamp((x - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
                local value = math.round(30 + pos * 90)
                fovValue = value
                Camera.FieldOfView = value
                fill.Size = UDim2.new(pos, 0, 1, 0)
                knob.Position = UDim2.new(pos, -13, 0.5, -13)
                label.Text = "FOV: " .. value
            end
            
            knob.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                end
            end)
            
            slider.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    updateSlider(input.Position.X)
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    updateSlider(input.Position.X)
                end
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)
            
            apply.MouseButton1Click:Connect(function()
                gui:Destroy()
                WindUI:Notify({Title = "FOV", Content = "FOV set to " .. fovValue, Duration = 2, Icon = "bell"})
            end)
        end
        
        pcall(showFOVSlider)
    end
})

VisualTab:Toggle({
    Title = "Enable Crosshair",
    Description = "Visible only with ShiftLock",
    Default = false,
    Callback = function(state)
        crosshairEnabled = state
        createCrosshair()
    end
})

VisualTab:Toggle({
    Title = "Crosshair Spin",
    Default = false,
    Callback = function(state)
        crosshairSpin = state
        createCrosshair()
    end
})

VisualTab:Input({
    Title = "Crosshair ID",
    Desc = "Enter Roblox asset ID",
    Placeholder = "5159914132",
    Callback = function(value)
        if value and value ~= "" then
            crosshairId = value
            createCrosshair()
        end
    end
})

VisualTab:Button({
    Title = "Reset Stretch to 50%",
    Callback = function()
        stretchFactor = 0.5
        if stretchEnabled then
            toggleStretch(false)
            toggleStretch(true)
        end
        WindUI:Notify({Title = "Stretch", Content = "Reset to 50%", Duration = 2, Icon = "bell"})
    end
})

VisualTab:Input({
    Title = "Stretch Factor (0.1 - 1.0)",
    Placeholder = "0.5",
    Callback = function(value)
        local num = tonumber(value)
        if num and num >= 0.1 and num <= 1.0 then
            stretchFactor = num
            if stretchEnabled then
                toggleStretch(false)
                toggleStretch(true)
            end
            WindUI:Notify({Title = "Stretch", Content = "Set to " .. num * 100 .. "%", Duration = 2, Icon = "bell"})
        else
            WindUI:Notify({Title = "Error", Content = "Enter value between 0.1 - 1.0", Duration = 2, Icon = "bell"})
        end
    end
})

-- ════════════════════════════════════════════════════════════════
--  SECTION 26: STARTUP
-- ════════════════════════════════════════════════════════════════

WindUI:Popup({
    Title = "MEGA PASTA HUB",
    Icon = "spaghetti",
    Content = "v5.0 loaded!\nAll features from CandyZone.\nOpen menu to configure.",
    Buttons = {
        {
            Title = "Start",
            Icon = "arrow-right",
            Variant = "Primary",
            Callback = function() end,
        },
    },
})

WindUI:Notify({
    Title = "MEGA PASTA HUB",
    Content = "Loaded successfully! 2500+ lines!",
    Duration = 4,
    Icon = "bell"
})

print("MEGA PASTA HUB v5.0 loaded!")
print("2500+ lines of pure pasta!")
print("Discord: @mopsech | Telegram: @idkmops")

-- ════════════════════════════════════════════════════════════════
--  SECTION 27: END OF FILE
-- ════════════════════════════════════════════════════════════════

-- CRACKED BY MOPS
-- Discord: @mopsech
-- Telegram: @idkmops
-- https://discord.gg/3KjWyZ6uBu

-- ════════════════════════════════════════════════════════════════
--  THE END - 2500+ LINES
-- ════════════════════════════════════════════════════════════════
