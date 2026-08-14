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

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local discordLink = "https://discord.gg/3KjWyZ6uBu"

task.spawn(function()
    pcall(function()
        setclipboard(discordLink)
    end)
    task.wait(0.5)
    pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
            if channel then
                channel:SendAsync("Слито в " .. discordLink)
            end
        else
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Слито в " .. discordLink, "All")
        end
    end)
end)
-- ========================================================

if CoreGui:FindFirstChild("MYhub_MainGui") then
    CoreGui.MYhub_MainGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MYhub_MainGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

getgenv().MYhubConfig = {
    ESP_Roles = false,
    Aimbot = false,
    AimbotFOV = 120,
    AimbotSmoothness = 20,
    SilentAim = false,
    Wallbang = false,
    AntiStun = false,
    AntiFall = false,
    FakeSpeedGlitch = false,
    FakeSpeedMultiplier = 50,
    Spinbot = false,
    SpinbotSpeed = 50,
    FlingMurderer = false,
    FlingSheriff = false,
    AntiFling = false,
    ChamsSelf = false,
    ChamsPlayers = false,
    AngelHalo = false,
    AutoFarmCoins = false,
    KillAll = false,
    JerkMode = false,
    SitOnHead = false,
    DanceMode = false
}

local Config = getgenv().MYhubConfig

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 560, 0, 420)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 120, 255)
MainStroke.Transparency = 0.4
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- ====== ССЫЛКА НА DISCORD В ГУИ ======
local DiscordLabel = Instance.new("TextButton")
DiscordLabel.Size = UDim2.new(0, 230, 0, 22)
DiscordLabel.Position = UDim2.new(0.5, -115, 1, -28)
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Font = Enum.Font.Gotham
DiscordLabel.Text = "🔗 discord.gg/3KjWyZ6uBu"
DiscordLabel.TextColor3 = Color3.fromRGB(100, 150, 255)
DiscordLabel.TextSize = 12
DiscordLabel.Parent = MainFrame

DiscordLabel.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard(discordLink)
        DiscordLabel.Text = "✅ Скопировано!"
        DiscordLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        task.wait(1.5)
        DiscordLabel.Text = "🔗 discord.gg/3KjWyZ6uBu"
        DiscordLabel.TextColor3 = Color3.fromRGB(100, 150, 255)
    end)
end)
-- =====================================

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundTransparency = 1
TopBar.Parent = MainFrame

local AvatarIcon = Instance.new("ImageLabel")
AvatarIcon.Size = UDim2.new(0, 32, 0, 32)
AvatarIcon.Position = UDim2.new(0, 15, 0.5, -16)
AvatarIcon.BackgroundTransparency = 1
AvatarIcon.Image = "rbxassetid://106080912687983"
AvatarIcon.Parent = TopBar

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(0, 4)
AvatarCorner.Parent = AvatarIcon

local LeftTabContainer = Instance.new("ScrollingFrame")
LeftTabContainer.Size = UDim2.new(0, 130, 1, -55)
LeftTabContainer.Position = UDim2.new(0, 10, 0, 48)
LeftTabContainer.BackgroundTransparency = 1
LeftTabContainer.BorderSizePixel = 0
LeftTabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
LeftTabContainer.ScrollBarThickness = 3
LeftTabContainer.Parent = MainFrame

local LeftLayout = Instance.new("UIListLayout")
LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
LeftLayout.Padding = UDim.new(0, 6)
LeftLayout.Parent = LeftTabContainer

local PagesContainer = Instance.new("Folder")
PagesContainer.Name = "PagesContainer"
PagesContainer.Parent = MainFrame

local ToggleButton = Instance.new("ImageButton")
ToggleButton.Name = "ToggleMenuBtn"
ToggleButton.Size = UDim2.new(0, 45, 0, 45)
ToggleButton.Position = UDim2.new(0, 20, 0.2, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
ToggleButton.BackgroundTransparency = 0.3
ToggleButton.Image = "rbxassetid://106080912687983"
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(0, 120, 255)
ToggleStroke.Transparency = 0.4
ToggleStroke.Thickness = 1.5
ToggleStroke.Parent = ToggleButton

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

local Tabs = {}
local Pages = {}
local activeTab = nil

local function CreateTab(name)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(1, -5, 0, 34)
    tabBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    tabBtn.BackgroundTransparency = 0.5
    tabBtn.Font = Enum.Font.GothamSemibold
    tabBtn.Text = "  " .. name
    tabBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
    tabBtn.TextSize = 13
    tabBtn.TextXAlignment = Enum.TextXAlignment.Left
    tabBtn.Parent = LeftTabContainer

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = tabBtn

    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, -155, 1, -55)
    page.Position = UDim2.new(0, 145, 0, 48)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.ScrollBarThickness = 4
    page.Visible = false
    page.Parent = PagesContainer

    local pageLayout = Instance.new("UIListLayout")
    pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    pageLayout.Padding = UDim.new(0, 8)
    pageLayout.Parent = page

    pageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, pageLayout.AbsoluteContentSize.Y + 10)
    end)

    tabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        for _, t in pairs(Tabs) do t.BackgroundColor3 = Color3.fromRGB(20, 20, 28); t.TextColor3 = Color3.fromRGB(180, 180, 190) end
        page.Visible = true
        tabBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

    if not activeTab then
        activeTab = name
        page.Visible = true
        tabBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end

    table.insert(Tabs, tabBtn)
    table.insert(Pages, page)
    return page
end

local function AddToggle(page, text, configKey, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -5, 0, 38)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
    frame.BackgroundTransparency = 0.4
    frame.Parent = page

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.Text = text
    label.TextColor3 = Color3.fromRGB(220, 220, 230)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 36, 0, 20)
    toggleBtn.Position = UDim2.new(1, -44, 0.5, -10)
    toggleBtn.BackgroundColor3 = Config[configKey] and Color3.fromRGB(0, 120, 255) or Color3.fromRGB(35, 35, 45)
    toggleBtn.Text = ""
    toggleBtn.Parent = frame

    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(1, 0)
    tCorner.Parent = toggleBtn

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 16, 0, 16)
    circle.Position = Config[configKey] and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.Parent = toggleBtn

    local cCorner = Instance.new("UICorner")
    cCorner.CornerRadius = UDim.new(1, 0)
    cCorner.Parent = circle

    toggleBtn.MouseButton1Click:Connect(function()
        Config[configKey] = not Config[configKey]
        local active = Config[configKey]
        toggleBtn.BackgroundColor3 = active and Color3.fromRGB(0, 120, 255) or Color3.fromRGB(35, 35, 45)
        circle:TweenPosition(active and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
        if callback then callback(active) end
    end)
end

local function AddSlider(page, text, min, max, configKey, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -5, 0, 52)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
    frame.BackgroundTransparency = 0.4
    frame.Parent = page

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 22)
    label.Position = UDim2.new(0, 12, 0, 4)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.Text = text
    label.TextColor3 = Color3.fromRGB(220, 220, 230)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local valueBox = Instance.new("TextBox")
    valueBox.Size = UDim2.new(0, 50, 0, 20)
    valueBox.Position = UDim2.new(1, -60, 0, 5)
    valueBox.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
    valueBox.Font = Enum.Font.GothamBold
    valueBox.Text = tostring(Config[configKey])
    valueBox.TextColor3 = Color3.fromRGB(0, 120, 255)
    valueBox.TextSize = 12
    valueBox.Parent = frame

    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 4)
    boxCorner.Parent = valueBox

    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(1, -24, 0, 6)
    sliderBar.Position = UDim2.new(0, 12, 0, 34)
    sliderBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    sliderBar.BorderSizePixel = 0
    sliderBar.Parent = frame

    local sCorner = Instance.new("UICorner")
    sCorner.CornerRadius = UDim.new(1, 0)
    sCorner.Parent = sliderBar

    local fillBar = Instance.new("Frame")
    fillBar.Size = UDim2.new((Config[configKey] - min) / (max - min), 0, 1, 0)
    fillBar.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    fillBar.BorderSizePixel = 0
    fillBar.Parent = sliderBar

    local fCorner = Instance.new("UICorner")
    fCorner.CornerRadius = UDim.new(1, 0)
    fCorner.Parent = fillBar

    local dragging = false
    local function updateInput(input)
        local pos = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
        local val = math.floor(min + (max - min) * pos)
        Config[configKey] = val
        valueBox.Text = tostring(val)
        fillBar.Size = UDim2.new(pos, 0, 1, 0)
        if callback then callback(val) end
    end

    sliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateInput(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateInput(input)
        end
    end)

    valueBox.FocusLost:Connect(function()
        local num = tonumber(valueBox.Text)
        if num then
            num = math.clamp(num, min, max)
            Config[configKey] = num
            valueBox.Text = tostring(num)
            fillBar.Size = UDim2.new((num - min) / (max - min), 0, 1, 0)
            if callback then callback(num) end
        else
            valueBox.Text = tostring(Config[configKey])
        end
    end)
end

local pageVisual = CreateTab("Visuals")
local pageCombat = CreateTab("Combat")
local pageMovement = CreateTab("Movement")

AddToggle(pageVisual, "ESP Roles (1s Refresh)", "ESP_Roles")
AddToggle(pageVisual, "Chams Self", "ChamsSelf")
AddToggle(pageVisual, "Chams Players", "ChamsPlayers")
AddToggle(pageVisual, "Angel Ring (Halo)", "AngelHalo")
AddToggle(pageVisual, "Jerk Mode", "JerkMode")
AddToggle(pageVisual, "Sit on Head", "SitOnHead")
AddToggle(pageVisual, "Dance Mode", "DanceMode", function(state)
    if state then
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync("/e dance") end
        else
            pcall(function() ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/e dance", "All") end)
        end
    end
end)

AddToggle(pageCombat, "Aimbot", "Aimbot")
AddSlider(pageCombat, "Aimbot FOV Radius", 5, 500, "AimbotFOV")
AddSlider(pageCombat, "Aimbot Smoothness (0-100)", 0, 100, "AimbotSmoothness")
AddToggle(pageCombat, "Silent Aim", "SilentAim")
AddToggle(pageCombat, "Wallbang (Big Hitboxes)", "Wallbang")
AddToggle(pageCombat, "Anti-Stun", "AntiStun")
AddToggle(pageCombat, "Kill All", "KillAll")

AddToggle(pageMovement, "Anti-Fall", "AntiFall")
AddToggle(pageMovement, "Spinbot", "Spinbot")
AddSlider(pageMovement, "Spinbot Speed", 5, 300, "SpinbotSpeed")
AddToggle(pageMovement, "Fake Speed Glitch", "FakeSpeedGlitch")
AddSlider(pageMovement, "Fake Speed Multiplier", 5, 300, "FakeSpeedMultiplier")
AddToggle(pageMovement, "Autofarm Coins", "AutoFarmCoins")
AddToggle(pageMovement, "Anti-Fling (Players Only)", "AntiFling")
AddToggle(pageMovement, "Fling Murderer", "FlingMurderer")
AddToggle(pageMovement, "Fling Sheriff", "FlingSheriff")

-- ВРАЩАЮЩЕЕСЯ И КРУГЛОЕ КОЛЬЦО АНГЕЛА С ДЫРОЧКОЙ --
RunService.RenderStepped:Connect(function()
    if Config.AngelHalo and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
        local head = LocalPlayer.Character.Head
        local halo = head:FindFirstChild("MYhub_AngelHalo")

        if not halo then
            halo = Instance.new("Part")
            halo.Name = "MYhub_AngelHalo"
            halo.Size = Vector3.new(2, 0.4, 2)
            halo.Material = Enum.Material.Neon
            halo.Color = Color3.fromRGB(255, 215, 0)
            halo.CanCollide = false
            halo.Anchored = false
            halo.CastShadow = false

            local mesh = Instance.new("SpecialMesh")
            mesh.MeshId = "rbxassetid://3270017"
            mesh.Scale = Vector3.new(1.8, 1.8, 0.5)
            mesh.Parent = halo

            local weld = Instance.new("Weld")
            weld.Name = "HaloWeld"
            weld.Part0 = head
            weld.Part1 = halo
            weld.C0 = CFrame.new(0, 1.8, 0) * CFrame.Angles(math.rad(90), 0, 0)
            weld.Parent = halo

            halo.Parent = head
        else
            local timeFactor = os.clock()
            local weld = halo:FindFirstChild("HaloWeld")
            if weld then
                weld.C0 = CFrame.new(0, 1.8 + math.sin(timeFactor * 3) * 0.1, 0) 
                        * CFrame.Angles(math.rad(90), 0, timeFactor * 3)
            end
        end
    else
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
            local halo = LocalPlayer.Character.Head:FindFirstChild("MYhub_AngelHalo")
            if halo then halo:Destroy() end
        end
    end
end)

-- АНТИ-ФЛИНГ --
RunService.Stepped:Connect(function()
    if Config.AntiFling then
        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer ~= LocalPlayer and otherPlayer.Character then
                for _, part in pairs(otherPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
    end
end)

-- ANTI-FALL --
RunService.Heartbeat:Connect(function()
    if Config.AntiFall and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        if hrp.Position.Y < -50 then
            local safeTarget = nil
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    if plr.Character.HumanoidRootPart.Position.Y > 0 then
                        safeTarget = plr.Character.HumanoidRootPart.CFrame
                        break
                    end
                end
            end
            if safeTarget then
                hrp.CFrame = safeTarget * CFrame.new(0, 3, 0)
            else
                hrp.CFrame = CFrame.new(0, 10, 0)
            end
            hrp.AssemblyLinearVelocity = Vector3.zero
        end
    end
end)

-- ANTI-STUN --
RunService.Stepped:Connect(function()
    if Config.AntiStun and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hum = LocalPlayer.Character.Humanoid
        if hum.PlatformStand then hum.PlatformStand = false end
        if hum.Sit then hum.Sit = false end
        for _, obj in pairs(LocalPlayer.Character:GetDescendants()) do
            if obj:IsA("StringValue") or obj:IsA("BoolValue") then
                local name = string.lower(obj.Name)
                if name:find("stun") or name:find("freeze") or name:find("ragdoll") then
                    obj:Destroy()
                end
            end
        end
    end
end)

-- WALLBANG (BIG HITBOXES) --
task.spawn(function()
    while true do
        if Config.Wallbang then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = plr.Character.HumanoidRootPart
                    hrp.Size = Vector3.new(20, 20, 20)
                    hrp.Transparency = 0.7
                    hrp.BrickColor = BrickColor.new("Bright red")
                    hrp.Material = Enum.Material.Neon
                    hrp.CanCollide = false
                end
            end
        else
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = plr.Character.HumanoidRootPart
                    if hrp.Size == Vector3.new(20, 20, 20) then
                        hrp.Size = Vector3.new(2, 2, 1)
                        hrp.Transparency = 1
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)

-- JERK MODE --
local jerkAnimTrack = nil
RunService.Stepped:Connect(function()
    if Config.JerkMode and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hum = LocalPlayer.Character.Humanoid
        if not jerkAnimTrack then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://148840371"
            jerkAnimTrack = hum:LoadAnimation(anim)
        end
        if jerkAnimTrack and not jerkAnimTrack.IsPlaying then
            jerkAnimTrack:Play()
            jerkAnimTrack:AdjustSpeed(8)
        end
    else
        if jerkAnimTrack and jerkAnimTrack.IsPlaying then
            jerkAnimTrack:Stop()
        end
    end
end)

-- SIT ON HEAD --
RunService.Heartbeat:Connect(function()
    if Config.SitOnHead and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local myRoot = LocalPlayer.Character.HumanoidRootPart
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                myRoot.CFrame = plr.Character.Head.CFrame * CFrame.new(0, 2.5, 0)
                break
            end
        end
    end
end)

-- АВТОФАРМ МОНЕТ --
task.spawn(function()
    while true do
        if Config.AutoFarmCoins and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LocalPlayer.Character.HumanoidRootPart
            local coinContainer = Workspace:FindFirstChild("Normal") or Workspace:FindFirstChild("Map") or Workspace

            local targetCoin = nil
            local shortestDist = math.huge

            for _, obj in pairs(coinContainer:GetDescendants()) do
                if obj.Name == "CoinContainer" or obj.Name == "Coin_Server" or (obj:IsA("BasePart") and obj.Name == "Coin") then
                    local coinPart = obj:IsA("BasePart") and obj or obj:FindFirstChildOfClass("BasePart")
                    if coinPart then
                        local dist = (hrp.Position - coinPart.Position).Magnitude
                        if dist < shortestDist then
                            shortestDist = dist
                            targetCoin = coinPart
                        end
                    end
                end
            end

            if targetCoin then
                hrp.CFrame = targetCoin.CFrame
            end
        end
        task.wait(0.1)
    end
end)

-- KILL ALL --
task.spawn(function()
    while true do
        if Config.KillAll and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LocalPlayer.Character.HumanoidRootPart
            local char = LocalPlayer.Character
            local tool = char:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool")

            if tool then
                tool.Parent = char
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                        local targetHrp = plr.Character.HumanoidRootPart
                        hrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, 2)
                        tool:Activate()
                        task.wait(0.1)
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1.5
FOVCircle.NumSides = 64
FOVCircle.Radius = Config.AimbotFOV
FOVCircle.Filled = false
FOVCircle.Color = Color3.fromRGB(0, 120, 255)
FOVCircle.Visible = false

RunService.RenderStepped:Connect(function()
    FOVCircle.Visible = Config.Aimbot
    FOVCircle.Radius = Config.AimbotFOV
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
end)

local function getMM2Role(plr)
    if not plr or not plr.Character then return "Innocent" end
    local backpack = plr:FindFirstChildOfClass("Backpack")
    local char = plr.Character
    local function hasTool(container)
        if not container then return false end
        for _, tool in pairs(container:GetChildren()) do
            if tool:IsA("Tool") then
                local name = string.lower(tool.Name)
                if name:find("gun") or name:find("revolver") then
                    return "Sheriff"
                elseif name:find("knife") or name:find("dagger") then
                    return "Murderer"
                end
            end
        end
        return false
    end
    return hasTool(char) or hasTool(backpack) or "Innocent"
end

task.spawn(function()
    while true do
        if Config.ESP_Roles then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = plr.Character.HumanoidRootPart
                    local role = getMM2Role(plr)

                    local billboard = hrp:FindFirstChild("MYhub_ESP")
                    if not billboard then
                        billboard = Instance.new("BillboardGui")
                        billboard.Name = "MYhub_ESP"
                        billboard.Size = UDim2.new(0, 100, 0, 40)
                        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                        billboard.AlwaysOnTop = true

                        local textLbl = Instance.new("TextLabel")
                        textLbl.Name = "RoleText"
                        textLbl.Size = UDim2.new(1, 0, 1, 0)
                        textLbl.BackgroundTransparency = 1
                        textLbl.Font = Enum.Font.GothamBold
                        textLbl.TextSize = 12
                        textLbl.TextStrokeTransparency = 0.2
                        textLbl.Parent = billboard

                        billboard.Parent = hrp
                    end

                    local txt = billboard:FindFirstChild("RoleText")
                    if txt then
                        txt.Text = "[" .. role:upper() .. "]"
                        if role == "Murderer" then
                            txt.TextColor3 = Color3.fromRGB(255, 50, 50)
                        elseif role == "Sheriff" then
                            txt.TextColor3 = Color3.fromRGB(50, 120, 255)
                        else
                            txt.TextColor3 = Color3.fromRGB(50, 255, 50)
                        end
                    end
                end
            end
        else
            for _, plr in pairs(Players:GetPlayers()) do
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local esp = plr.Character.HumanoidRootPart:FindFirstChild("MYhub_ESP")
                    if esp then esp:Destroy() end
                end
            end
        end
        task.wait(1)
    end
end)

RunService.RenderStepped:Connect(function()
    if Config.ChamsSelf and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                local highlight = part:FindFirstChild("MYhub_Chams")
                if not highlight then
                    highlight = Instance.new("Highlight")
                    highlight.Name = "MYhub_Chams"
                    highlight.FillColor = Color3.fromRGB(0, 120, 255)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.Parent = part
                end
            end
        end
    elseif LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                local h = part:FindFirstChild("MYhub_Chams")
                if h then h:Destroy() end
            end
        end
    end

    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local role = getMM2Role(plr)
            local targetColor = Color3.fromRGB(50, 255, 50)
            if role == "Murderer" then
                targetColor = Color3.fromRGB(255, 50, 50)
            elseif role == "Sheriff" then
                targetColor = Color3.fromRGB(50, 120, 255)
            end

            for _, part in pairs(plr.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    local highlight = part:FindFirstChild("MYhub_ChamsPlayer")
                    if Config.ChamsPlayers then
                        if not highlight then
                            highlight = Instance.new("Highlight")
                            highlight.Name = "MYhub_ChamsPlayer"
                            highlight.Parent = part
                        end
                        highlight.FillColor = targetColor
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    else
                        if highlight then highlight:Destroy() end
                    end
                end
            end
        end
    end
end)

-- AIMBOT & SILENT AIM --
local rawIndexHook
rawIndexHook = hookmetamethod(game, "__index", function(self, key)
    if not checkcaller() and Config.SilentAim and key == "Hit" and self:IsA("Mouse") then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and getMM2Role(plr) == "Murderer" and plr.Character and plr.Character:FindFirstChild("Head") then
                return plr.Character.Head.CFrame
            end
        end
    end
    return rawIndexHook(self, key)
end)

RunService.RenderStepped:Connect(function(dt)
    if Config.Aimbot then
        local bestTarget = nil
        local shortestDist = Config.AimbotFOV
        local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                local role = getMM2Role(plr)
                if role == "Murderer" then
                    local headPart = plr.Character.Head
                    local screenPoint, onScreen = Camera:WorldToViewportPoint(headPart.Position)
                    if onScreen then
                        local dist = (Vector2.new(screenPoint.X, screenPoint.Y) - screenCenter).Magnitude
                        if dist < shortestDist then
                            shortestDist = dist
                            bestTarget = headPart
                        end
                    end
                end
            end
        end

        if bestTarget then
            local targetPos = bestTarget.Position
            local currentCFrame = Camera.CFrame
            local targetCFrame = CFrame.new(currentCFrame.Position, targetPos)
            
            local smoothVal = math.clamp(Config.AimbotSmoothness, 0, 100)
            local lerpAlpha = (smoothVal == 0) and 1 or math.clamp((101 - smoothVal) * dt * 0.5, 0.01, 1)

            Camera.CFrame = currentCFrame:Lerp(targetCFrame, lerpAlpha)
        end
    end
end)

local currentSpeedVal = 0

RunService.Heartbeat:Connect(function(dt)
    if Config.FakeSpeedGlitch and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        local hum = LocalPlayer.Character.Humanoid

        local isMoving = hum.MoveDirection.Magnitude > 0
        local targetSpeed = Config.FakeSpeedMultiplier

        if isMoving then
            currentSpeedVal = math.min(currentSpeedVal + (targetSpeed * dt * 3), targetSpeed)
        else
            currentSpeedVal = math.max(currentSpeedVal - (targetSpeed * dt * 4), 0)
        end

        if currentSpeedVal > 0 then
            local moveDir = hum.MoveDirection.Magnitude > 0 and hum.MoveDirection or hrp.CFrame.LookVector
            local currentVel = hrp.AssemblyLinearVelocity
            local targetVel = moveDir * currentSpeedVal

            local lerpFactor = (hum.FloorMaterial == Enum.Material.Air) and (dt * 12) or (dt * 6)
            local newHorizVel = Vector3.new(currentVel.X, 0, currentVel.Z):Lerp(Vector3.new(targetVel.X, 0, targetVel.Z), math.clamp(lerpFactor, 0, 1))

            hrp.AssemblyLinearVelocity = Vector3.new(newHorizVel.X, currentVel.Y, newHorizVel.Z)
        end
    else
        currentSpeedVal = 0
    end
end)

RunService.RenderStepped:Connect(function()
    if Config.Spinbot and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        local hum = LocalPlayer.Character.Humanoid

        hum.AutoRotate = false
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(Config.SpinbotSpeed), 0)
    elseif LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.AutoRotate = true
    end
end)

RunService.Heartbeat:Connect(function()
    local targetRole = nil
    if Config.FlingMurderer then targetRole = "Murderer" end
    if Config.FlingSheriff then targetRole = "Sheriff" end

    if targetRole and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local myRoot = LocalPlayer.Character.HumanoidRootPart
        local myHum = LocalPlayer.Character.Humanoid

        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and getMM2Role(plr) == targetRole and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local targetRoot = plr.Character.HumanoidRootPart

                myHum.PlatformStand = true
                myRoot.CFrame = targetRoot.CFrame * CFrame.new(math.random(-1, 1), 0, math.random(-1, 1))
                myRoot.Velocity = Vector3.new(30000, 30000, 30000)
                myRoot.RotVelocity = Vector3.new(30000, 30000, 30000)
                return
            end
        end
        myHum.PlatformStand = false
    end
end)
