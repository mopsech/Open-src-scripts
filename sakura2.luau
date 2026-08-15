-- слито в https://discord.gg/3KjWyZ6uBu
-- Cracked by @idkmops(tg) @mopsech(ds)
--
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

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "sakura hub crack",
    Icon = "cookie",
    Theme = "Rose"
})

pcall(function()
    if Window.SetTransparency then
        Window:SetTransparency(0.25)
    end
    if Window.SetThemeColor then
        Window:SetThemeColor(Color3.fromRGB(255, 182, 193))
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local ConfigFolder = "sakuraCFGmm2"
if not isfolder(ConfigFolder) then
    makefolder(ConfigFolder)
end

local function generateRandomConfigName()
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    local randomStr = ""
    for i = 1, 7 do
        local randIndex = math.random(1, #chars)
        randomStr = randomStr .. chars:sub(randIndex, randIndex)
    end
    return "mm2-" .. randomStr
end

-- States
local autoFarmEnabled = false
local farmSpeed = 22
local safeHeight = 14
local killAllEnabled = false
local antiFlingEnabled = false
local speedGlitchEnabled = false
local espRoleEnabled = false
local espNameEnabled = false
local espGunDropEnabled = false
local aimbotEnabled = false
local silentAimEnabled = false
local wallbangEnabled = false
local autoPickupGunEnabled = false
local fovShow = false
local fovSize = 150

local fullbrightEnabled = false
local removeFogEnabled = false
local customFovEnabled = false
local targetCameraFov = 90
local trailEnabled = false
local shadersEnabled = false
local shaderMode = "Bloom"
local customFogEnabled = false
local fogDensity = 0.3
local jumpEffectEnabled = false
local capeEnabled = false
local pinkGlassEnabled = false
local angelRingEnabled = false

local spinbotEnabled = false
local spinSpeed = 25

local playerModelId = ""
local playerModelEnabled = false

local selectedTargetName = nil
local selectedMode = "Off"
local trollingActive = false
local currentTrollingTween = nil

-- Shader objects
local bloomEffect = nil
local colorCorrection = nil
local sunRays = nil
local depthOfField = nil
local blurEffect = nil
local glowEffect = nil

local VisualsTab = Window:Tab({ Title = "Visuals", Icon = "sparkles" })
local WallhackTab = Window:Tab({ Title = "Wallhack", Icon = "eye" })
local AimTab = Window:Tab({ Title = "Aimbot", Icon = "crosshair" })
local CombatTab = Window:Tab({ Title = "Combat", Icon = "sword" })
local FarmTab = Window:Tab({ Title = "AutoFarm", Icon = "coins" })
local TrollingTab = Window:Tab({ Title = "Trolling", Icon = "smile" })
local KeybindsTab = Window:Tab({ Title = "Keybinds", Icon = "smartphone" })
local MiscTab = Window:Tab({ Title = "Misc", Icon = "shield" })
local ConfigTab = Window:Tab({ Title = "Configs", Icon = "folder" })
local DiscordTab = Window:Tab({ Title = "Discord", Icon = "message-square" })

-- Shader functions
local function createBloom()
    if bloomEffect then bloomEffect:Destroy() end
    bloomEffect = Instance.new("BloomEffect")
    bloomEffect.Name = "SakuraBloom"
    bloomEffect.Intensity = 0.5
    bloomEffect.Size = 16
    bloomEffect.Threshold = 0.8
    bloomEffect.Parent = Lighting
    return bloomEffect
end

local function createColorCorrection()
    if colorCorrection then colorCorrection:Destroy() end
    colorCorrection = Instance.new("ColorCorrectionEffect")
    colorCorrection.Name = "SakuraColorCorrection"
    colorCorrection.Brightness = 0.1
    colorCorrection.Contrast = 0.1
    colorCorrection.Saturation = 0.1
    colorCorrection.TintColor = Color3.fromRGB(255, 182, 193)
    colorCorrection.Parent = Lighting
    return colorCorrection
end

local function createSunRays()
    if sunRays then sunRays:Destroy() end
    sunRays = Instance.new("SunRaysEffect")
    sunRays.Name = "SakuraSunRays"
    sunRays.Intensity = 0.3
    sunRays.Spread = 0.5
    sunRays.Parent = Lighting
    return sunRays
end

local function createDepthOfField()
    if depthOfField then depthOfField:Destroy() end
    depthOfField = Instance.new("DepthOfFieldEffect")
    depthOfField.Name = "SakuraDOF"
    depthOfField.FarIntensity = 0.5
    depthOfField.FocusDistance = 10
    depthOfField.InFocusRadius = 5
    depthOfField.NearIntensity = 0.2
    depthOfField.Parent = Lighting
    return depthOfField
end

local function createBlur()
    if blurEffect then blurEffect:Destroy() end
    blurEffect = Instance.new("BlurEffect")
    blurEffect.Name = "SakuraBlur"
    blurEffect.Size = 8
    blurEffect.Parent = Lighting
    return blurEffect
end

local function createGlow()
    if glowEffect then glowEffect:Destroy() end
    glowEffect = Instance.new("BloomEffect")
    glowEffect.Name = "SakuraGlow"
    glowEffect.Intensity = 0.8
    glowEffect.Size = 32
    glowEffect.Threshold = 0.3
    glowEffect.Parent = Lighting
    return glowEffect
end

local function setupShaders(mode)
    -- Очищаем все шейдеры
    if bloomEffect then bloomEffect:Destroy(); bloomEffect = nil end
    if colorCorrection then colorCorrection:Destroy(); colorCorrection = nil end
    if sunRays then sunRays:Destroy(); sunRays = nil end
    if depthOfField then depthOfField:Destroy(); depthOfField = nil end
    if blurEffect then blurEffect:Destroy(); blurEffect = nil end
    if glowEffect then glowEffect:Destroy(); glowEffect = nil end
    
    if not shadersEnabled then return end
    
    if mode == "Bloom" then
        createBloom()
    elseif mode == "Vibrant" then
        local bloom = createBloom()
        bloom.Intensity = 0.3
        bloom.Size = 10
        local cc = createColorCorrection()
        cc.Saturation = 0.3
        cc.Contrast = 0.15
        cc.Brightness = 0.1
    elseif mode == "Dreamy" then
        local bloom = createBloom()
        bloom.Intensity = 0.7
        bloom.Size = 24
        local cc = createColorCorrection()
        cc.TintColor = Color3.fromRGB(255, 200, 220)
        cc.Saturation = -0.2
        createSunRays()
    elseif mode == "Cinematic" then
        local dof = createDepthOfField()
        dof.FarIntensity = 0.8
        dof.FocusDistance = 15
        local cc = createColorCorrection()
        cc.Contrast = 0.3
        cc.Saturation = 0.2
        cc.Brightness = -0.1
        local bloom = createBloom()
        bloom.Intensity = 0.2
        bloom.Size = 8
    elseif mode == "Neon" then
        local glow = createGlow()
        glow.Intensity = 1.0
        glow.Size = 40
        glow.Threshold = 0.1
        local cc = createColorCorrection()
        cc.Saturation = 0.5
        cc.Contrast = 0.2
        cc.TintColor = Color3.fromRGB(255, 100, 150)
    elseif mode == "VHS" then
        local cc = createColorCorrection()
        cc.Saturation = -0.5
        cc.Contrast = 0.3
        cc.Brightness = -0.1
        local bloom = createBloom()
        bloom.Intensity = 0.1
        bloom.Size = 4
        createSunRays()
    elseif mode == "Soft Pink" then
        local bloom = createBloom()
        bloom.Intensity = 0.6
        bloom.Size = 20
        local cc = createColorCorrection()
        cc.TintColor = Color3.fromRGB(255, 182, 193)
        cc.Saturation = -0.1
        cc.Brightness = 0.1
    elseif mode == "Retro" then
        local cc = createColorCorrection()
        cc.Saturation = 0.1
        cc.Contrast = 0.2
        cc.Brightness = 0.05
        local bloom = createBloom()
        bloom.Intensity = 0.4
        bloom.Size = 12
        local blur = createBlur()
        blur.Size = 4
    elseif mode == "Sunset" then
        local cc = createColorCorrection()
        cc.TintColor = Color3.fromRGB(255, 150, 100)
        cc.Saturation = 0.2
        local bloom = createBloom()
        bloom.Intensity = 0.5
        bloom.Size = 16
        local sunRays = createSunRays()
        sunRays.Intensity = 0.5
        sunRays.Spread = 0.8
    end
end

-- Mobile Quick Buttons Menu
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SakuraMobileButtons"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 180, 0, 380)
mainFrame.Position = UDim2.new(0, 20, 0, 150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 20, 25)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = mainFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(255, 182, 193)
uiStroke.Thickness = 2
uiStroke.Parent = mainFrame

local dragging, dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end)

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 840)
scrollFrame.ScrollBarThickness = 4
scrollFrame.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.VerticalAlignment = Enum.VerticalAlignment.Top
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 8)
listLayout.Parent = scrollFrame

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 10)
padding.Parent = scrollFrame

local function createMobileToggle(text, getState, setState)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 155, 0, 35)
    local initialColor = getState() and Color3.fromRGB(50, 205, 50) or Color3.fromRGB(255, 105, 180)
    btn.BackgroundColor3 = initialColor
    btn.BackgroundTransparency = 0.3
    btn.Text = text .. (getState() and ": ON" or ": OFF")
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = scrollFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        local newState = not getState()
        setState(newState)
        if newState then
            btn.BackgroundColor3 = Color3.fromRGB(50, 205, 50)
            btn.Text = text .. ": ON"
        else
            btn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
            btn.Text = text .. ": OFF"
        end
    end)
    return btn
end

KeybindsTab:Section({ Title = "Mobile Menu Controls" })

KeybindsTab:Toggle({
    Title = "Show Mobile Keybinds Menu",
    Desc = "Displays movable floating buttons on screen",
    Default = false,
    Callback = function(state)
        mainFrame.Visible = state
    end
})

createMobileToggle("Auto Farm", function() return autoFarmEnabled end, function(v) autoFarmEnabled = v end)
createMobileToggle("Kill All", function() return killAllEnabled end, function(v) killAllEnabled = v end)
createMobileToggle("Spinbot", function() return spinbotEnabled end, function(v) 
    spinbotEnabled = v
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local bav = char.HumanoidRootPart:FindFirstChild("SakuraSpinbotAngular")
        if bav then bav:Destroy() end
    end
end)
createMobileToggle("Aimbot", function() return aimbotEnabled end, function(v) aimbotEnabled = v end)
createMobileToggle("Silent Aim", function() return silentAimEnabled end, function(v) silentAimEnabled = v end)
createMobileToggle("Wallbang (Shoot Walls)", function() return wallbangEnabled end, function(v) wallbangEnabled = v end)
createMobileToggle("Auto Pickup Gun", function() return autoPickupGunEnabled end, function(v) autoPickupGunEnabled = v end)
createMobileToggle("Speed Glitch", function() return speedGlitchEnabled end, function(v) speedGlitchEnabled = v end)
createMobileToggle("Anti-Fling", function() return antiFlingEnabled end, function(v) antiFlingEnabled = v end)
createMobileToggle("Role ESP", function() return espRoleEnabled end, function(v) espRoleEnabled = v end)
createMobileToggle("Name ESP", function() return espNameEnabled end, function(v) espNameEnabled = v end)
createMobileToggle("Sheriff Gun ESP", function() return espGunDropEnabled end, function(v) espGunDropEnabled = v end)

-- Trail System
local trailParts = {}
local trailFolders = {}

local function createTrail(char)
    local rootPart = char:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    local trailFolder = Instance.new("Folder")
    trailFolder.Name = "SakuraTrail"
    trailFolder.Parent = char
    
    table.insert(trailFolders, trailFolder)
    
    local trailCount = 30
    local trailPositions = {}
    
    for i = 1, trailCount do
        local part = Instance.new("Part")
        part.Name = "TrailPart_" .. i
        part.Size = Vector3.new(0.8, 0.8, 0.8)
        part.Shape = Enum.PartType.Ball
        part.Material = Enum.Material.Neon
        part.Color = Color3.fromRGB(255, 105, 180)
        part.Transparency = 1 - (i / trailCount)
        part.CanCollide = false
        part.Anchored = true
        part.Parent = trailFolder
        part.Position = rootPart.Position
        
        local trailPos = {Position = rootPart.Position, Part = part}
        table.insert(trailPositions, trailPos)
        table.insert(trailParts, part)
    end
    
    task.spawn(function()
        local index = 1
        while trailEnabled and char and char.Parent do
            if char:FindFirstChild("HumanoidRootPart") and trailFolder.Parent == char then
                local currentPos = char.HumanoidRootPart.Position
                
                if #trailPositions > 0 then
                    local posData = trailPositions[index]
                    if posData and posData.Part then
                        posData.Part.Position = currentPos
                        posData.Position = currentPos
                    end
                    index = index % #trailPositions + 1
                end
            end
            task.wait(0.05)
        end
    end)
    
    return trailFolder
end

local function cleanupTrails()
    for _, folder in ipairs(trailFolders) do
        if folder and folder.Parent then
            folder:Destroy()
        end
    end
    trailFolders = {}
    trailParts = {}
end

local function toggleTrail(state)
    trailEnabled = state
    if state then
        if LocalPlayer.Character then
            createTrail(LocalPlayer.Character)
        end
    else
        cleanupTrails()
    end
end

-- Angel Ring System
local angelRingParts = {}

local function createAngelRing(char)
    local head = char:FindFirstChild("Head")
    if not head then return end
    
    for _, part in ipairs(angelRingParts) do
        if part and part.Parent then
            part:Destroy()
        end
    end
    angelRingParts = {}
    
    if not angelRingEnabled then return end
    
    local ringFolder = Instance.new("Folder")
    ringFolder.Name = "SakuraAngelRing"
    ringFolder.Parent = char
    
    local ringColor = Color3.fromRGB(255, 105, 180)
    local ringParts = {}
    
    local segments = 24
    local radius = 1.2
    
    for i = 1, segments do
        local angle = (i / segments) * math.pi * 2
        local x = math.cos(angle) * radius
        local z = math.sin(angle) * radius
        
        local part = Instance.new("Part")
        part.Name = "RingSegment_" .. i
        part.Size = Vector3.new(0.3, 0.1, 0.3)
        part.Shape = Enum.PartType.Ball
        part.Material = Enum.Material.Neon
        part.Color = ringColor
        part.Transparency = 0.2
        part.CanCollide = false
        part.Anchored = true
        part.Parent = ringFolder
        
        part.CFrame = head.CFrame * CFrame.new(x, 0.8, z) * CFrame.Angles(0, angle, 0)
        
        table.insert(ringParts, part)
        table.insert(angelRingParts, part)
    end
    
    for i = 1, 12 do
        local angle = (i / 12) * math.pi * 2
        local radius2 = 0.4
        local x = math.cos(angle) * radius2
        local z = math.sin(angle) * radius2
        
        local glowPart = Instance.new("Part")
        glowPart.Name = "GlowParticle_" .. i
        glowPart.Size = Vector3.new(0.15, 0.15, 0.15)
        glowPart.Shape = Enum.PartType.Ball
        glowPart.Material = Enum.Material.Neon
        glowPart.Color = Color3.fromRGB(255, 182, 193)
        glowPart.Transparency = 0.3
        glowPart.CanCollide = false
        glowPart.Anchored = true
        glowPart.Parent = ringFolder
        
        glowPart.CFrame = head.CFrame * CFrame.new(x, 1.2, z)
        
        table.insert(angelRingParts, glowPart)
    end
    
    task.spawn(function()
        local tick = 0
        while angelRingEnabled and ringFolder.Parent == char do
            tick = tick + 0.03
            if char:FindFirstChild("Head") then
                local headPos = char.Head.CFrame
                
                for i, part in ipairs(ringParts) do
                    if part and part.Parent then
                        local angle = (i / segments) * math.pi * 2 + tick * 2
                        local x = math.cos(angle) * radius
                        local z = math.sin(angle) * radius
                        part.CFrame = headPos * CFrame.new(x, 0.8 + math.sin(tick * 3 + i) * 0.1, z) * CFrame.Angles(0, angle, 0)
                        part.Transparency = 0.2 + math.sin(tick * 2 + i * 0.5) * 0.1
                    end
                end
                
                local glowParts = {}
                for _, part in ipairs(angelRingParts) do
                    if part and part.Name:find("GlowParticle") then
                        table.insert(glowParts, part)
                    end
                end
                
                for i, part in ipairs(glowParts) do
                    if part and part.Parent then
                        local angle = (i / #glowParts) * math.pi * 2 + tick * 1.5
                        local radius2 = 0.4 + math.sin(tick * 2 + i) * 0.1
                        local x = math.cos(angle) * radius2
                        local z = math.sin(angle) * radius2
                        part.CFrame = headPos * CFrame.new(x, 1.2 + math.sin(tick * 2.5 + i * 0.7) * 0.1, z)
                        part.Transparency = 0.3 + math.sin(tick * 3 + i) * 0.15
                    end
                end
            end
            task.wait(0.03)
        end
    end)
    
    return ringFolder
end

local function toggleAngelRing(state)
    angelRingEnabled = state
    if state then
        if LocalPlayer.Character then
            createAngelRing(LocalPlayer.Character)
        end
    else
        for _, part in ipairs(angelRingParts) do
            if part and part.Parent then
                part:Destroy()
            end
        end
        angelRingParts = {}
    end
end

-- Cape & Jump Logic
local function setupCape(char)
    local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
    if not torso then return end
    local capeModel = char:FindFirstChild("SakuraLayeredCapeModel")
    if capeModel then capeModel:Destroy() end
    if not capeEnabled then return end

    local model = Instance.new("Model")
    model.Name = "SakuraLayeredCapeModel"
    model.Parent = char

    local layersCount = 16
    local basePart = Instance.new("Part")
    basePart.Name = "CapeRoot"
    basePart.Size = Vector3.new(1.8, 0.2, 0.2)
    basePart.Transparency = 1
    basePart.CanCollide = false
    basePart.Parent = model

    local weld = Instance.new("WeldConstraint")
    weld.Part0 = torso
    weld.Part1 = basePart
    basePart.CFrame = torso.CFrame * CFrame.new(0, 0.8, 0.6) * CFrame.Angles(math.rad(15), 0, 0)
    weld.Parent = basePart

    local previousPart = basePart
    local capeParts = {}

    for i = 1, layersCount do
        local segment = Instance.new("Part")
        segment.Name = "CapeLayer_" .. i
        segment.Size = Vector3.new(1.8, 0.15, 0.08)
        segment.Color = Color3.fromRGB(255, 105, 180)
        segment.Material = Enum.Material.SmoothPlastic
        segment.CanCollide = false
        segment.Parent = model

        local sWeld = Instance.new("Weld")
        sWeld.Part0 = previousPart
        sWeld.Part1 = segment
        sWeld.C0 = CFrame.new(0, -0.12, 0.02)
        sWeld.C1 = CFrame.new(0, 0.12, -0.02)
        sWeld.Parent = segment

        table.insert(capeParts, segment)
        previousPart = segment
    end

    task.spawn(function()
        local tickCount = 0
        while model.Parent == char and capeEnabled do
            tickCount = tickCount + 0.15
            local velocity = char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart.AssemblyLinearVelocity.Magnitude or 0
            local waveFactor = math.sin(tickCount * 4) * (0.05 + (velocity * 0.002))
            
            for index, part in ipairs(capeParts) do
                local sWeld = part:FindFirstChildOfClass("Weld")
                if sWeld then
                    local offsetAngle = waveFactor * (index / layersCount)
                    sWeld.C0 = CFrame.new(0, -0.12, 0.02) * CFrame.Angles(offsetAngle, 0, 0)
                end
            end
            task.wait(0.03)
        end
    end)
end

local function setupJumpEffect(char)
    local humanoid = char:WaitForChild("Humanoid", 5)
    local rootPart = char:WaitForChild("HumanoidRootPart", 5)
    if not humanoid or not rootPart then return end

    local lastState = humanoid:GetState()
    humanoid.StateChanged:Connect(function(_, newState)
        if not jumpEffectEnabled then return end
        if newState == Enum.HumanoidStateType.Jumping or (lastState == Enum.HumanoidStateType.Freefall and newState == Enum.HumanoidStateType.Running) then
            pcall(function()
                local part = Instance.new("Part")
                part.Name = "JumpRippleEffect"
                part.Anchored = true
                part.CanCollide = false
                part.Transparency = 0.3
                part.Size = Vector3.new(0.5, 0.1, 0.5)
                part.CFrame = CFrame.new(rootPart.Position - Vector3.new(0, 3, 0)) * CFrame.Angles(math.rad(90), 0, 0)
                part.Color = Color3.fromRGB(255, 105, 180)
                part.Material = Enum.Material.Neon
                part.Parent = Workspace

                local mesh = Instance.new("CylinderMesh")
                mesh.Parent = part

                TweenService:Create(part, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = Vector3.new(0.5, 12, 12),
                    Transparency = 1
                }):Play()

                task.delay(0.6, function()
                    if part then part:Destroy() end
                end)
            end)
        end
        lastState = newState
    end)
end

local function makePlayerGlassPink(char)
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Material = Enum.Material.Glass
            part.Color = Color3.fromRGB(255, 105, 180)
            part.Transparency = 0.4
        end
    end
end

local function restorePlayerBody(char)
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Material = Enum.Material.SmoothPlastic
            part.Transparency = 0
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    setupJumpEffect(char)
    setupCape(char)
    if pinkGlassEnabled then
        makePlayerGlassPink(char)
    end
    if trailEnabled then
        createTrail(char)
    end
    if angelRingEnabled then
        createAngelRing(char)
    end
end)

if LocalPlayer.Character then
    task.spawn(function()
        setupJumpEffect(LocalPlayer.Character)
        setupCape(LocalPlayer.Character)
        if trailEnabled then
            createTrail(LocalPlayer.Character)
        end
        if angelRingEnabled then
            createAngelRing(LocalPlayer.Character)
        end
    end)
end

VisualsTab:Section({ Title = "World & Effects" })
VisualsTab:Section({ Title = "Player Model Changer" })

VisualsTab:Input({
    Title = "Model ID / Username",
    Desc = "Enter Roblox User ID or Username to morph your character",
    Placeholder = "Enter ID or Name...",
    Callback = function(value)
        playerModelId = value
    end
})

VisualsTab:Toggle({
    Title = "Apply Custom Model",
    Default = false,
    Callback = function(state)
        playerModelEnabled = state
        if state and playerModelId ~= "" then
            pcall(function()
                local targetUserId = tonumber(playerModelId)
                if not targetUserId then
                    targetUserId = Players:GetUserIdFromNameAsync(playerModelId)
                end
                if targetUserId then
                    local appearanceDesc = Players:GetHumanoidDescriptionFromUserId(targetUserId)
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChildOfClass("Humanoid") then
                        char:FindFirstChildOfClass("Humanoid"):ApplyDescriptionReset(appearanceDesc)
                    end
                end
            end)
        end
    end
})

VisualsTab:Section({ Title = "Shader Effects" })

VisualsTab:Toggle({
    Title = "Enable Shaders",
    Desc = "Turns on/off all shader effects",
    Default = false,
    Callback = function(state)
        shadersEnabled = state
        if state then
            setupShaders(shaderMode)
        else
            -- Очищаем все шейдеры
            if bloomEffect then bloomEffect:Destroy(); bloomEffect = nil end
            if colorCorrection then colorCorrection:Destroy(); colorCorrection = nil end
            if sunRays then sunRays:Destroy(); sunRays = nil end
            if depthOfField then depthOfField:Destroy(); depthOfField = nil end
            if blurEffect then blurEffect:Destroy(); blurEffect = nil end
            if glowEffect then glowEffect:Destroy(); glowEffect = nil end
        end
    end
})

VisualsTab:Dropdown({
    Title = "Shader Preset",
    Values = {
        "Bloom",
        "Vibrant",
        "Dreamy",
        "Cinematic",
        "Neon",
        "VHS",
        "Soft Pink",
        "Retro",
        "Sunset"
    },
    Default = "Bloom",
    Callback = function(value)
        shaderMode = value
        if shadersEnabled then
            setupShaders(value)
        end
    end
})

VisualsTab:Section({ Title = "Visual Effects" })

VisualsTab:Toggle({
    Title = "Angel Ring",
    Desc = "Creates a glowing pink angel ring/halo above your head",
    Default = false,
    Callback = function(state)
        toggleAngelRing(state)
    end
})

VisualsTab:Toggle({
    Title = "Jump Ripple Effect",
    Default = false,
    Callback = function(state)
        jumpEffectEnabled = state
    end
})

VisualsTab:Toggle({
    Title = "16-Layer Animated Cape",
    Default = false,
    Callback = function(state)
        capeEnabled = state
        if LocalPlayer.Character then
            setupCape(LocalPlayer.Character)
        end
    end
})

VisualsTab:Toggle({
    Title = "Pink Glass",
    Desc = "Turns your character body into pink translucent glass",
    Default = false,
    Callback = function(state)
        pinkGlassEnabled = state
        local char = LocalPlayer.Character
        if char then
            if state then
                makePlayerGlassPink(char)
            else
                restorePlayerBody(char)
            end
        end
    end
})

VisualsTab:Toggle({
    Title = "Trail Effect",
    Desc = "Creates a glowing pink trail behind your character",
    Default = false,
    Callback = function(state)
        toggleTrail(state)
    end
})

VisualsTab:Toggle({
    Title = "Fullbright",
    Default = false,
    Callback = function(state)
        fullbrightEnabled = state
        if state then
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        else
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        end
    end
})

VisualsTab:Toggle({
    Title = "Remove Fog",
    Default = false,
    Callback = function(state)
        removeFogEnabled = state
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("Atmosphere") then
                obj.Density = state and 0 or 0.3
            end
        end
    end
})

ConfigTab:Section({ Title = "Config Management" })

local currentSelectedConfig = ""

local function getConfigsList()
    local list = {}
    for _, file in ipairs(listfiles(ConfigFolder)) do
        if file:sub(-4) == ".cfg" then
            local name = file:match("([^/\\]+)$")
            name = name:sub(1, -5)
            table.insert(list, name)
        end
    end
    if #list == 0 then table.insert(list, "No configs") end
    return list
end

local configDropdown = ConfigTab:Dropdown({
    Title = "Select Config",
    Values = getConfigsList(),
    Default = "",
    Callback = function(value)
        currentSelectedConfig = value
    end
})

ConfigTab:Button({
    Title = "Create New Config",
    Callback = function()
        local newName = generateRandomConfigName()
        local path = ConfigFolder .. "/" .. newName .. ".cfg"
        local defaultData = {
            AutoFarm = false,
            KillAll = false,
            AntiFling = false,
            SpeedGlitch = false,
            RoleESP = false,
            NameESP = false,
            GunESP = false,
            Aimbot = false,
            SilentAim = false,
            Wallbang = false,
            AutoPickupGun = false,
            FOVShow = false,
            FOVSize = 150
        }
        writefile(path, HttpService:JSONEncode(defaultData))
        configDropdown:Refresh(getConfigsList())
        WindUI:Notify({ Title = "Success", Content = "Created config: " .. newName, Duration = 3 })
    end
})

ConfigTab:Button({
    Title = "Save Config",
    Callback = function()
        if currentSelectedConfig == "" or currentSelectedConfig == "No configs" then return end
        local path = ConfigFolder .. "/" .. currentSelectedConfig .. ".cfg"
        local data = {
            AutoFarm = autoFarmEnabled,
            KillAll = killAllEnabled,
            AntiFling = antiFlingEnabled,
            SpeedGlitch = speedGlitchEnabled,
            RoleESP = espRoleEnabled,
            NameESP = espNameEnabled,
            GunESP = espGunDropEnabled,
            Aimbot = aimbotEnabled,
            SilentAim = silentAimEnabled,
            Wallbang = wallbangEnabled,
            AutoPickupGun = autoPickupGunEnabled,
            FOVShow = fovShow,
            FOVSize = fovSize,
            ShadersEnabled = shadersEnabled,
            ShaderMode = shaderMode
        }
        writefile(path, HttpService:JSONEncode(data))
        WindUI:Notify({ Title = "Success", Content = "Config saved!", Duration = 3 })
    end
})

ConfigTab:Button({
    Title = "Load Config",
    Callback = function()
        if currentSelectedConfig == "" or currentSelectedConfig == "No configs" then return end
        local path = ConfigFolder .. "/" .. currentSelectedConfig .. ".cfg"
        if isfile(path) then
            local success, decoded = pcall(function()
                return HttpService:JSONDecode(readfile(path))
            end)
            if success and type(decoded) == "table" then
                autoFarmEnabled = decoded.AutoFarm == true
                killAllEnabled = decoded.KillAll == true
                antiFlingEnabled = decoded.AntiFling == true
                speedGlitchEnabled = decoded.SpeedGlitch == true
                espRoleEnabled = decoded.RoleESP == true
                espNameEnabled = decoded.NameESP == true
                espGunDropEnabled = decoded.GunESP == true
                aimbotEnabled = decoded.Aimbot == true
                silentAimEnabled = decoded.SilentAim == true
                wallbangEnabled = decoded.Wallbang == true
                autoPickupGunEnabled = decoded.AutoPickupGun == true
                fovShow = decoded.FOVShow == true
                fovSize = decoded.FOVSize or 150
                shadersEnabled = decoded.ShadersEnabled == true
                shaderMode = decoded.ShaderMode or "Bloom"
                if shadersEnabled then
                    setupShaders(shaderMode)
                end
                WindUI:Notify({ Title = "Success", Content = "Config loaded!", Duration = 3 })
            end
        end
    end
})

DiscordTab:Section({ Title = "Our Community" })
DiscordTab:Button({
    Title = "Copy Discord Link",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/HUjfpxjw")
            WindUI:Notify({ Title = "Success!", Content = "Discord link copied.", Duration = 3 })
        end
    end
})

local function getRole(player)
    local character = player.Character
    if not character then return "Innocent" end
    if character:FindFirstChild("Gun") or (player.Backpack and player.Backpack:FindFirstChild("Gun")) then
        return "Sheriff"
    end
    if character:FindFirstChild("Knife") or (player.Backpack and player.Backpack:FindFirstChild("Knife")) then
        return "Murderer"
    end
    return "Innocent"
end

FarmTab:Section({ Title = "Coin Farming" })

FarmTab:Toggle({
    Title = "Auto Farm Coins",
    Desc = "Smoothly collects coins without shaking (Fix for Delta)",
    Default = false,
    Callback = function(state)
        autoFarmEnabled = state
    end
})

RunService.Stepped:Connect(function()
    if autoFarmEnabled and LocalPlayer.Character then
        local descendants = LocalPlayer.Character:GetDescendants()
        for i = 1, #descendants do
            local part = descendants[i]
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

local function getAllCoins()
    local coins = {}
    local coinContainer = Workspace:FindFirstChild("CoinContainer") 
        or Workspace:FindFirstChild("Coins") 
        or Workspace:FindFirstChild("CoinArea")

    if coinContainer then
        local children = coinContainer:GetChildren()
        for i = 1, #children do
            local coin = children[i]
            local part = coin:IsA("BasePart") and coin or coin:FindFirstChild("CoinVisual") or coin:FindFirstChildOfClass("BasePart")
            if part and part:IsA("BasePart") then
                table.insert(coins, part)
            end
        end
    else
        local descendants = Workspace:GetDescendants()
        for i = 1, #descendants do
            local obj = descendants[i]
            if (obj.Name == "CoinVisual" or obj.Name == "Coin_Server" or obj.Name == "Coin") and obj:IsA("BasePart") then
                table.insert(coins, obj)
            end
        end
    end
    return coins
end

task.spawn(function()
    while true do
        task.wait(0.5)
        if autoFarmEnabled then
            local waitTime = 0
            while waitTime < 9 and autoFarmEnabled do
                task.wait(1)
                waitTime = waitTime + 1
            end
            
            while autoFarmEnabled do
                pcall(function()
                    local myChar = LocalPlayer.Character
                    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end
                    
                    local rootPart = myChar.HumanoidRootPart
                    local humanoid = myChar:FindFirstChildOfClass("Humanoid")
                    
                    local bv = rootPart:FindFirstChild("FarmVelocity") or Instance.new("BodyVelocity")
                    bv.Name = "FarmVelocity"
                    bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                    bv.Velocity = Vector3.new(0, 0, 0)
                    bv.Parent = rootPart

                    if humanoid then
                        humanoid.PlatformStand = true
                    end
                    
                    local coinsList = getAllCoins()
                    if #coinsList > 0 then
                        for _, coinPart in ipairs(coinsList) do
                            if not autoFarmEnabled then break end
                            if coinPart and coinPart.Parent then
                                local targetPos = coinPart.Position
                                local hoverPos = targetPos + Vector3.new(0, safeHeight, 0)
                                
                                local distance = (rootPart.Position - hoverPos).Magnitude
                                local tweenTime = math.clamp(distance / farmSpeed, 0.2, 2.0)
                                
                                local tween = TweenService:Create(
                                    rootPart, 
                                    TweenInfo.new(tweenTime, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 
                                    {CFrame = CFrame.new(hoverPos)}
                                )
                                tween:Play()
                                tween.Completed:Wait()

                                if not autoFarmEnabled then break end
                                local collectTween = TweenService:Create(
                                    rootPart,
                                    TweenInfo.new(0.2, Enum.EasingStyle.Linear),
                                    {CFrame = CFrame.new(targetPos)}
                                )
                                collectTween:Play()
                                collectTween.Completed:Wait()
                                task.wait(0.1)

                                local returnTween = TweenService:Create(
                                    rootPart,
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
            
            pcall(function()
                local myChar = LocalPlayer.Character
                if myChar then
                    local rootPart = myChar:FindFirstChild("HumanoidRootPart")
                    if rootPart and rootPart:FindFirstChild("FarmVelocity") then
                        rootPart.FarmVelocity:Destroy()
                    end
                    local humanoid = myChar:FindFirstChildOfClass("Humanoid")
                    if humanoid then humanoid.PlatformStand = false end
                end
            end)
        end
    end
end)

CombatTab:Section({ Title = "Spinbot & Combat" })

CombatTab:Toggle({
    Title = "Spinbot",
    Default = false,
    Callback = function(state)
        spinbotEnabled = state
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local bav = char.HumanoidRootPart:FindFirstChild("SakuraSpinbotAngular")
            if bav then bav:Destroy() end
        end
    end
})

CombatTab:Slider({
    Title = "Spin Speed",
    Min = 5,
    Max = 100,
    Default = 25,
    Callback = function(value)
        spinSpeed = value
    end
})

RunService.RenderStepped:Connect(function()
    if spinbotEnabled and LocalPlayer.Character then
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if rootPart then
            if humanoid then humanoid.AutoRotate = false end
            local bav = rootPart:FindFirstChild("SakuraSpinbotAngular")
            if not bav then
                bav = Instance.new("BodyAngularVelocity")
                bav.Name = "SakuraSpinbotAngular"
                bav.MaxTorque = Vector3.new(0, 500000, 0)
                bav.Parent = rootPart
            end
            bav.AngularVelocity = Vector3.new(0, spinSpeed, 0)
        end
    else
        if LocalPlayer.Character then
            local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then humanoid.AutoRotate = true end
            if rootPart and rootPart:FindFirstChild("SakuraSpinbotAngular") then
                rootPart.SakuraSpinbotAngular:Destroy()
            end
        end
    end
end)

CombatTab:Section({ Title = "Murderer Features" })

CombatTab:Toggle({
    Title = "Kill All (Delta Fix)",
    Default = false,
    Callback = function(state)
        killAllEnabled = state
    end
})

local function equipKnife()
    local myChar = LocalPlayer.Character
    if not myChar then return nil end
    local knife = myChar:FindFirstChild("Knife") or LocalPlayer.Backpack:FindFirstChild("Knife")
    if knife then
        if knife.Parent == LocalPlayer.Backpack then
            local humanoid = myChar:FindFirstChildOfClass("Humanoid")
            if humanoid then humanoid:EquipTool(knife) end
        end
        return knife
    end
    return nil
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if killAllEnabled then
            pcall(function()
                local myChar = LocalPlayer.Character
                if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                    local knife = equipKnife()
                    if knife then
                        local playersList = Players:GetPlayers()
                        for i = 1, #playersList do
                            local player = playersList[i]
                            if not killAllEnabled then break end
                            if player ~= LocalPlayer and player.Character then
                                local targetChar = player.Character
                                local targetHumanoid = targetChar:FindFirstChildOfClass("Humanoid")
                                local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
                                local myRoot = myChar:FindFirstChild("HumanoidRootPart")
                                
                                if targetHumanoid and targetHumanoid.Health > 0 and targetRoot and myRoot then
                                    local attempts = 0
                                    while targetHumanoid.Health > 0 and targetChar.Parent and killAllEnabled and attempts < 15 do
                                        attempts = attempts + 1
                                        knife = equipKnife()
                                        myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 1.5)
                                        if knife then
                                            knife:Activate()
                                            if knife:FindFirstChild("Stab") then
                                                knife.Stab:FireServer()
                                            elseif knife:FindFirstChild("Slash") then
                                                knife.Slash:FireServer()
                                            end
                                        end
                                        task.wait(0.05)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

MiscTab:Section({ Title = "Protection & Movement" })

MiscTab:Toggle({
    Title = "Anti-Fling",
    Default = false,
    Callback = function(state)
        antiFlingEnabled = state
    end
})

MiscTab:Toggle({
    Title = "Fake Speedglitch",
    Default = false,
    Callback = function(state)
        speedGlitchEnabled = state
    end
})

MiscTab:Toggle({
    Title = "Auto Pickup Gun",
    Desc = "Automatically teleports and picks up the sheriff's gun when dropped",
    Default = false,
    Callback = function(state)
        autoPickupGunEnabled = state
    end
})

task.spawn(function()
    while true do
        task.wait(0.2)
        if autoPickupGunEnabled then
            pcall(function()
                local myChar = LocalPlayer.Character
                if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end
                
                local hasGun = myChar:FindFirstChild("Gun") or (LocalPlayer.Backpack and LocalPlayer.Backpack:FindFirstChild("Gun"))
                if not hasGun then
                    local children = Workspace:GetChildren()
                    for i = 1, #children do
                        local obj = children[i]
                        if obj.Name == "GunDrop" and obj:IsA("BasePart") then
                            local rootPart = myChar.HumanoidRootPart
                            rootPart.CFrame = obj.CFrame
                            task.wait(0.1)
                            break
                        end
                    end
                end
            end)
        end
    end
end)

RunService.Stepped:Connect(function()
    if antiFlingEnabled and LocalPlayer.Character then
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            local vel = rootPart.AssemblyLinearVelocity
            if math.abs(vel.X) > 100 or math.abs(vel.Y) > 100 or math.abs(vel.Z) > 100 then
                rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                rootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if speedGlitchEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if humanoid:GetState() == Enum.HumanoidStateType.Freefall or humanoid.Jump then
                humanoid.WalkSpeed = 120
            else
                humanoid.WalkSpeed = 16
            end
        end
    else
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.WalkSpeed == 120 then
                humanoid.WalkSpeed = 16
            end
        end
    end
end)

local highlights = {}
local gunHighlights = {}

RunService.RenderStepped:Connect(function()
    local playersList = Players:GetPlayers()
    for i = 1, #playersList do
        local player = playersList[i]
        if player ~= LocalPlayer then
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                if espRoleEnabled then
                    local hl = highlights[player]
                    if not hl then
                        hl = Instance.new("Highlight")
                        hl.Parent = char
                        hl.Adornee = char
                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlights[player] = hl
                    end
                    local role = getRole(player)
                    if role == "Murderer" then
                        hl.FillColor = Color3.fromRGB(255, 0, 0)
                    elseif role == "Sheriff" then
                        hl.FillColor = Color3.fromRGB(0, 0, 255)
                    else
                        hl.FillColor = Color3.fromRGB(0, 255, 0)
                    end
                    hl.Enabled = true
                else
                    if highlights[player] then
                        highlights[player]:Destroy()
                        highlights[player] = nil
                    end
                end

                if espNameEnabled then
                    local head = char:FindFirstChild("Head")
                    if head then
                        local tag = head:FindFirstChild("ESPNameTag")
                        if not tag then
                            tag = Instance.new("BillboardGui")
                            tag.Name = "ESPNameTag"
                            tag.Size = UDim2.new(0, 100, 0, 50)
                            tag.StudsOffset = Vector3.new(0, 2, 0)
                            tag.AlwaysOnTop = true
                            tag.Parent = head
                            
                            local textLabel = Instance.new("TextLabel")
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            textLabel.TextStrokeTransparency = 0
                            textLabel.TextSize = 14
                            textLabel.Font = Enum.Font.SourceSansBold
                            textLabel.Parent = tag
                        end
                        local roleText = getRole(player)
                        tag.TextLabel.Text = player.Name .. " [" .. roleText .. "]"
                    end
                else
                    local head = char:FindFirstChild("Head")
                    if head and head:FindFirstChild("ESPNameTag") then
                        head.ESPNameTag:Destroy()
                    end
                end
            end
        end
    end

    if espGunDropEnabled then
        local children = Workspace:GetChildren()
        for i = 1, #children do
            local obj = children[i]
            if obj.Name == "GunDrop" then
                if not gunHighlights[obj] then
                    local hl = Instance.new("Highlight")
                    hl.Parent = obj
                    hl.Adornee = obj
                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    hl.FillColor = Color3.fromRGB(255, 255, 0)
                    gunHighlights[obj] = hl
                end
            end
        end
        for obj, hl in pairs(gunHighlights) do
            if not obj.Parent then
                hl:Destroy()
                gunHighlights[obj] = nil
            end
        end
    else
        for obj, hl in pairs(gunHighlights) do
            hl:Destroy()
        end
        gunHighlights = {}
    end
end)

WallhackTab:Section({ Title = "Wallhack Settings" })

WallhackTab:Toggle({
    Title = "Role ESP",
    Default = false,
    Callback = function(state)
        espRoleEnabled = state
        if not state then
            for _, hl in pairs(highlights) do hl:Destroy() end
            highlights = {}
        end
    end
})

WallhackTab:Toggle({
    Title = "Name ESP",
    Default = false,
    Callback = function(state)
        espNameEnabled = state
        if not state then
            local playersList = Players:GetPlayers()
            for i = 1, #playersList do
                local p = playersList[i]
                if p.Character and p.Character:FindFirstChild("Head") then
                    if p.Character.Head:FindFirstChild("ESPNameTag") then
                        p.Character.Head.ESPNameTag:Destroy()
                    end
                end
            end
        end
    end
})

WallhackTab:Toggle({
    Title = "Sheriff Gun ESP",
    Default = false,
    Callback = function(state)
        espGunDropEnabled = state
        if not state then
            for _, hl in pairs(gunHighlights) do hl:Destroy() end
            gunHighlights = {}
        end
    end
})

local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = false
FOVCircle.Filled = false
FOVCircle.Thickness = 1.5
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.NumSides = 64
FOVCircle.Radius = fovSize

AimTab:Section({ Title = "Aimbot Settings" })

AimTab:Toggle({
    Title = "Aimbot on Murderer",
    Default = false,
    Callback = function(state)
        aimbotEnabled = state
    end
})

AimTab:Toggle({
    Title = "Silent Aim (For Sheriff)",
    Desc = "Shoots the murderer without aiming or looking at them",
    Default = false,
    Callback = function(state)
        silentAimEnabled = state
    end
})

AimTab:Toggle({
    Title = "Wallbang (Shoot through walls)",
    Desc = "Allows your bullets to penetrate walls and obstacles",
    Default = false,
    Callback = function(state)
        wallbangEnabled = state
    end
})

AimTab:Toggle({
    Title = "Show FOV Circle",
    Default = false,
    Callback = function(state)
        fovShow = state
        FOVCircle.Visible = state
    end
})

AimTab:Slider({
    Title = "FOV Size",
    Min = 50,
    Max = 400,
    Default = 150,
    Callback = function(value)
        fovSize = value
        FOVCircle.Radius = value
    end
})

local function getTargetMurderer()
    local bestTarget = nil
    local shortestDistance = fovSize
    local mousePos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    local playersList = Players:GetPlayers()
    for i = 1, #playersList do
        local player = playersList[i]
        if player ~= LocalPlayer and getRole(player) == "Murderer" then
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local rootPart = char.HumanoidRootPart
                local screenPoint, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
                
                if onScreen then
                    local targetVector = Vector2.new(screenPoint.X, screenPoint.Y)
                    local distance = (targetVector - mousePos).Magnitude
                    
                    if distance < shortestDistance then
                        shortestDistance = distance
                        bestTarget = rootPart
                    end
                end
            end
        end
    end
    return bestTarget
end

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    if silentAimEnabled and method == "FireServer" and (self.Name == "Shoot" or self.Name:lower():find("shoot")) then
        local target = getTargetMurderer()
        if target and LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("Gun") or LocalPlayer.Backpack:FindFirstChild("Gun")) then
            for i = 1, #args do
                local v = args[i]
                if typeof(v) == "Vector3" then
                    args[i] = target.Position
                elseif typeof(v) == "CFrame" then
                    args[i] = CFrame.new(target.Position)
                end
            end
            return oldNamecall(self, unpack(args))
        end
    end
    
    return oldNamecall(self, ...)
end)

local oldNamecallWallbang
oldNamecallWallbang = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    if wallbangEnabled and (method == "FindPartOnRay" or method == "FindPartOnRayWithIgnoreList" or method == "FindPartOnRayWithWhitelist") then
        return nil, nil, nil, nil
    end
    return oldNamecallWallbang(self, ...)
end)

RunService.RenderStepped:Connect(function()
    if fovShow then
        FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    end
    
    if aimbotEnabled then
        local target = getTargetMurderer()
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
        end
    end
end)

TrollingTab:Section({ Title = "Player Trolling" })

local function getPlayerNames()
    local names = {}
    local playersList = Players:GetPlayers()
    for i = 1, #playersList do
        local player = playersList[i]
        if player ~= LocalPlayer then
            table.insert(names, player.Name)
        end
    end
    if #names == 0 then table.insert(names, "No players") end
    return names
end

local playerDropdown = TrollingTab:Dropdown({
    Title = "Select Player",
    Values = getPlayerNames(),
    Default = "",
    Callback = function(value)
        selectedTargetName = value
        onTrollingChange()
    end
})

task.spawn(function()
    while true do
        task.wait(3)
        pcall(function()
            playerDropdown:Refresh(getPlayerNames())
        end)
    end
end)

TrollingTab:Dropdown({
    Title = "Trolling Mode",
    Values = {"Off", "Jerk Mode", "Sit on Head", "Dance Nearby", "Stand Nearby", "Follow", "Climb"},
    Default = "Off",
    Callback = function(value)
        selectedMode = value
        onTrollingChange()
    end
})

-- Новая исправленная система троллинга
local trollingThread = nil

local function stopTrolling()
    if trollingThread then
        task.cancel(trollingThread)
        trollingThread = nil
    end
    if currentTrollingTween then
        currentTrollingTween:Cancel()
        currentTrollingTween = nil
    end
    trollingActive = false
    
    -- Удаляем анимацию танца
    local myChar = LocalPlayer.Character
    if myChar then
        local track = myChar:FindFirstChild("SakuraDanceAnim")
        if track then
            pcall(function() track:Stop() end)
            track:Destroy()
        end
    end
end

local function startTrolling()
    stopTrolling()
    
    if selectedMode == "Off" or not selectedTargetName then return end
    
    trollingActive = true
    
    trollingThread = task.spawn(function()
        while trollingActive and selectedMode ~= "Off" do
            task.wait()
            
            pcall(function()
                local myChar = LocalPlayer.Character
                if not myChar then return end
                
                local myRoot = myChar:FindFirstChild("HumanoidRootPart")
                if not myRoot then return end
                
                local humanoid = myChar:FindFirstChildOfClass("Humanoid")
                if not humanoid then return end
                
                local targetPlayer = Players:FindFirstChild(selectedTargetName)
                if not targetPlayer or not targetPlayer.Character then 
                    trollingActive = false
                    return 
                end
                
                local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                local targetHead = targetPlayer.Character:FindFirstChild("Head")
                
                if not targetRoot then return end
                
                -- Отключаем коллизию для плавного движения
                for _, part in ipairs(myChar:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
                
                if selectedMode == "Jerk Mode" then
                    myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, -1, 1.2) * CFrame.Angles(math.rad(45), 0, 0)
                    
                elseif selectedMode == "Sit on Head" and targetHead then
                    local headPos = targetHead.Position + Vector3.new(0, 1.5, 0)
                    myRoot.CFrame = CFrame.new(headPos)
                    
                elseif selectedMode == "Stand Nearby" then
                    local offset = Vector3.new(2, 0, 2)
                    local targetPos = targetRoot.Position + offset
                    myRoot.CFrame = CFrame.new(targetPos)
                    
                elseif selectedMode == "Dance Nearby" then
                    local offset = Vector3.new(2, 0, 2)
                    local targetPos = targetRoot.Position + offset
                    myRoot.CFrame = CFrame.new(targetPos)
                    
                    if not myChar:FindFirstChild("SakuraDanceAnim") then
                        local animator = humanoid:FindFirstChildOfClass("Animator")
                        if animator then
                            local anim = Instance.new("Animation")
                            anim.AnimationId = "rbxassetid://507771019"
                            anim.Name = "SakuraDanceAnim"
                            local track = animator:LoadAnimation(anim)
                            track:Play()
                            myChar.SakuraDanceAnim = track
                        end
                    end
                    
                elseif selectedMode == "Follow" then
                    local distance = (myRoot.Position - targetRoot.Position).Magnitude
                    if distance > 3 then
                        local targetPos = targetRoot.Position + Vector3.new(0, 0, 3)
                        myRoot.CFrame = CFrame.new(targetPos)
                    end
                    
                elseif selectedMode == "Climb" then
                    local targetPos = targetRoot.Position + Vector3.new(0, 3, 0)
                    myRoot.CFrame = CFrame.new(targetPos)
                end
            end)
            
            task.wait(0.05)
        end
    end)
end

-- Функция для обновления троллинга
local function onTrollingChange()
    if selectedMode == "Off" then
        stopTrolling()
    else
        startTrolling()
    end
end

-- При смене персонажа перезапускаем троллинг
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    if selectedMode ~= "Off" then
        startTrolling()
    end
end)

-- Добавляем кнопку для остановки троллинга
TrollingTab:Button({
    Title = "Stop Trolling",
    Callback = function()
        stopTrolling()
        selectedMode = "Off"
        WindUI:Notify({ Title = "Trolling", Content = "Trolling stopped", Duration = 2 })
    end
})

-- Основной цикл для обновления троллинга
task.spawn(function()
    while true do
        task.wait(1)
        if trollingActive and selectedMode ~= "Off" then
            local targetPlayer = Players:FindFirstChild(selectedTargetName)
            if not targetPlayer or not targetPlayer.Character then
                trollingActive = false
                startTrolling()
            end
        end
    end
end)

print("SakuraMM2 loaded successfully!")
