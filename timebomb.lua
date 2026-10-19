-- candy.cc UI for Roblox Executor
-- timebomb duels

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Camera = workspace.CurrentCamera
local LP = Players.LocalPlayer

local function loadAsset(url, name)
    local asset = ""
    pcall(function()
        local data = game:HttpGet(url)
        if data and #data > 0 then
            local fn = name .. "_" .. tostring(os.time()) .. ".png"
            if writefile then
                writefile(fn, data)
                if getcustomasset then asset = getcustomasset(fn) end
            end
        end
    end)
    if asset == "" then asset = "rbxassetid://0" end
    return asset
end

local logoAsset = loadAsset("https://raw.githubusercontent.com/mopsech/candyhub/main/candy.png", "candy_logo")
local heartAsset = loadAsset("https://raw.githubusercontent.com/mopsech/candyhub/main/icons8-%D1%81%D0%B5%D1%80%D0%B4%D1%86%D0%B5-50.png", "candy_heart")

-- ============================================================
-- ТЕМЫ
-- ============================================================
local Themes = {
    dark = {
        Bg = Color3.fromRGB(18, 18, 18), Panel = Color3.fromRGB(26, 26, 26),
        Card = Color3.fromRGB(32, 32, 32), Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(150, 150, 150), Border = Color3.fromRGB(50, 50, 50),
        Accent = Color3.fromRGB(255, 255, 255),
    },
    light = {
        Bg = Color3.fromRGB(245, 245, 245), Panel = Color3.fromRGB(235, 235, 235),
        Card = Color3.fromRGB(225, 225, 225), Text = Color3.fromRGB(20, 20, 20),
        SubText = Color3.fromRGB(100, 100, 100), Border = Color3.fromRGB(180, 180, 180),
        Accent = Color3.fromRGB(30, 30, 30),
    },
}
local Theme = {}
for k, v in pairs(Themes.dark) do Theme[k] = v end

local AccentTargets, ThemeTargets, ToggleTargets = {}, {}, {}
local function regAccent(inst, prop) table.insert(AccentTargets, {inst = inst, prop = prop}); inst[prop] = Theme.Accent end
local function regTheme(inst, prop, key) table.insert(ThemeTargets, {inst = inst, prop = prop, key = key}); inst[prop] = Theme[key] end
local function regToggleBg(inst, getState) table.insert(ToggleTargets, {inst = inst, getState = getState}) end
local function applyAccent(c)
    Theme.Accent = c
    for _, t in ipairs(AccentTargets) do pcall(function() t.inst[t.prop] = c end) end
    for _, t in ipairs(ToggleTargets) do pcall(function() if t.getState() then t.inst.BackgroundColor3 = Theme.Accent end end) end
end
local function applyTheme(name)
    local t = Themes[name] or Themes.dark
    for k, v in pairs(t) do Theme[k] = v end
    for _, o in ipairs(ThemeTargets) do pcall(function() o.inst[o.prop] = Theme[o.key] end) end
    for _, o in ipairs(ToggleTargets) do pcall(function() o.inst.BackgroundColor3 = o.getState() and Theme.Accent or Theme.Border end) end
end

local old = CoreGui:FindFirstChild("candy_cc_ui"); if old then old:Destroy() end
local old2 = LP.PlayerGui:FindFirstChild("candy_cc_ui"); if old2 then old2:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "candy_cc_ui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LP:WaitForChild("PlayerGui") end

-- ============================================================
-- ГЛАВНЫЙ ФРЕЙМ
-- ============================================================
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 720, 0, 480)
Main.Position = UDim2.new(0.5, -360, 0.5, -240)
Main.BackgroundColor3 = Theme.Bg
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = ScreenGui
regTheme(Main, "BackgroundColor3", "Bg")
local MainCorner = Instance.new("UICorner"); MainCorner.CornerRadius = UDim.new(0, 14); MainCorner.Parent = Main
local MainStroke = Instance.new("UIStroke"); MainStroke.Color = Theme.Border; MainStroke.Thickness = 1; MainStroke.Parent = Main
regTheme(MainStroke, "Color", "Border")
Main.Size = UDim2.new(0, 0, 0, 0)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.BackgroundTransparency = 1
TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 720, 0, 480),
    Position = UDim2.new(0.5, -360, 0.5, -240),
    BackgroundTransparency = 0,
}):Play()

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 60)
Header.BackgroundTransparency = 1
Header.Parent = Main
local dragging, dragStart, startPos = false, nil, nil
Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 32, 0, 32); Logo.Position = UDim2.new(0, 16, 0, 14)
Logo.BackgroundTransparency = 1; Logo.Image = logoAsset; Logo.ScaleType = Enum.ScaleType.Fit; Logo.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 220, 0, 20); Title.Position = UDim2.new(0, 56, 0, 12)
Title.BackgroundTransparency = 1; Title.Text = "candy.cc"; Title.TextColor3 = Theme.Text
Title.TextSize = 18; Title.Font = Enum.Font.GothamBold; Title.TextXAlignment = Enum.TextXAlignment.Left; Title.Parent = Header
regTheme(Title, "TextColor3", "Text")

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0, 220, 0, 14); Subtitle.Position = UDim2.new(0, 56, 0, 32)
Subtitle.BackgroundTransparency = 1; Subtitle.Text = "timebomb duels"; Subtitle.TextColor3 = Theme.SubText
Subtitle.TextSize = 11; Subtitle.Font = Enum.Font.GothamBold; Subtitle.TextXAlignment = Enum.TextXAlignment.Left; Subtitle.Parent = Header
regTheme(Subtitle, "TextColor3", "SubText")

local copyBtn = Instance.new("TextButton")
copyBtn.Size = UDim2.new(0, 28, 0, 28)
copyBtn.Position = UDim2.new(1, -74, 0.5, -14)
copyBtn.BackgroundColor3 = Theme.Panel
copyBtn.BorderSizePixel = 0
copyBtn.Text = ""
copyBtn.ZIndex = 5
copyBtn.Parent = Header
regTheme(copyBtn, "BackgroundColor3", "Panel")
Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 6)
local copyIcon = Instance.new("ImageLabel")
copyIcon.Size = UDim2.new(0, 16, 0, 16)
copyIcon.Position = UDim2.new(0.5, -8, 0.5, -8)
copyIcon.BackgroundTransparency = 1
copyIcon.Image = "rbxassetid://86131768436965"
copyIcon.ImageColor3 = Theme.Text
copyIcon.Parent = copyBtn
regTheme(copyIcon, "ImageColor3", "Text")
copyBtn.MouseEnter:Connect(function() TweenService:Create(copyBtn, TweenInfo.new(0.1), {BackgroundColor3 = Theme.Border}):Play() end)
copyBtn.MouseLeave:Connect(function() TweenService:Create(copyBtn, TweenInfo.new(0.1), {BackgroundColor3 = Theme.Panel}):Play() end)
copyBtn.MouseButton1Click:Connect(function()
    pcall(function() setclipboard("t.me/candyware") end)
    Notify("candy.cc", "copied: t.me/candyware", 2.5, "copy")
end)

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -38, 0.5, -14)
closeBtn.BackgroundColor3 = Theme.Panel
closeBtn.BorderSizePixel = 0
closeBtn.Text = ""
closeBtn.ZIndex = 5
closeBtn.Parent = Header
regTheme(closeBtn, "BackgroundColor3", "Panel")
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
local closeIcon = Instance.new("TextLabel")
closeIcon.Size = UDim2.new(1, 0, 1, 0)
closeIcon.BackgroundTransparency = 1
closeIcon.Text = "✕"
closeIcon.TextColor3 = Theme.Text
closeIcon.TextSize = 16
closeIcon.Font = Enum.Font.GothamBold
closeIcon.Parent = closeBtn
regTheme(closeIcon, "TextColor3", "Text")
closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(200, 50, 50)}):Play()
    closeIcon.TextColor3 = Color3.new(1, 1, 1)
end)
closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.1), {BackgroundColor3 = Theme.Panel}):Play()
    closeIcon.TextColor3 = Theme.Text
end)

local reopenBtn = Instance.new("TextButton")
reopenBtn.Size = UDim2.new(0, 120, 0, 34)
reopenBtn.Position = UDim2.new(0, 16, 0, 16)
reopenBtn.BackgroundColor3 = Theme.Card
reopenBtn.BorderSizePixel = 0
reopenBtn.Text = "candy.cc"
reopenBtn.TextColor3 = Theme.Text
reopenBtn.TextSize = 13
reopenBtn.Font = Enum.Font.GothamBold
reopenBtn.Visible = false
reopenBtn.Parent = ScreenGui
regTheme(reopenBtn, "BackgroundColor3", "Card")
regTheme(reopenBtn, "TextColor3", "Text")
Instance.new("UICorner", reopenBtn).CornerRadius = UDim.new(0, 8)
local reopenStroke = Instance.new("UIStroke"); reopenStroke.Color = Theme.Border; reopenStroke.Thickness = 1; reopenStroke.Parent = reopenBtn
regTheme(reopenStroke, "Color", "Border")

local function closeUI()
    TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 1,
    }):Play()
    task.delay(0.26, function() Main.Visible = false; reopenBtn.Visible = true end)
end
local function openUI()
    reopenBtn.Visible = false; Main.Visible = true
    Main.Size = UDim2.new(0, 0, 0, 0); Main.Position = UDim2.new(0.5, 0, 0.5, 0); Main.BackgroundTransparency = 1
    TweenService:Create(Main, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 720, 0, 480), Position = UDim2.new(0.5, -360, 0.5, -240), BackgroundTransparency = 0,
    }):Play()
end
closeBtn.MouseButton1Click:Connect(closeUI)
reopenBtn.MouseButton1Click:Connect(openUI)
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.LeftControl then
        if Main.Visible then closeUI() else openUI() end
    end
end)

-- ============================================================
-- УВЕДОМЛЕНИЯ
-- ============================================================
local NotifHolder = Instance.new("Frame")
NotifHolder.Size = UDim2.new(0, 280, 0, 0)
NotifHolder.AnchorPoint = Vector2.new(1, 0)
NotifHolder.Position = UDim2.new(1, -16, 0, 16)
NotifHolder.BackgroundTransparency = 1
NotifHolder.AutomaticSize = Enum.AutomaticSize.Y
NotifHolder.Parent = ScreenGui
local NotifList = Instance.new("UIListLayout")
NotifList.Padding = UDim.new(0, 8); NotifList.SortOrder = Enum.SortOrder.LayoutOrder; NotifList.Parent = NotifHolder

local ICONS = {
    default = "rbxassetid://106205298246017",
    success = "rbxassetid://106205298246017",
    copy = "rbxassetid://86131768436965",
    warn = "rbxassetid://106205298246017",
}

local function Notify(title, text, duration, kind)
    kind = kind or "default"
    local n = Instance.new("Frame")
    n.Size = UDim2.new(1, 0, 0, 0)
    n.BackgroundColor3 = Theme.Card; n.BackgroundTransparency = 1
    n.BorderSizePixel = 0; n.ClipsDescendants = true; n.Parent = NotifHolder
    regTheme(n, "BackgroundColor3", "Card")
    local nc = Instance.new("UICorner"); nc.CornerRadius = UDim.new(0, 12); nc.Parent = n
    local ns = Instance.new("UIStroke"); ns.Color = Theme.Border; ns.Thickness = 1; ns.Transparency = 1; ns.Parent = n
    regTheme(ns, "Color", "Border")
    local accent = Instance.new("Frame")
    accent.Size = UDim2.new(0, 4, 1, -16); accent.Position = UDim2.new(0, 8, 0, 8)
    accent.BackgroundColor3 = Theme.Accent; accent.BackgroundTransparency = 1
    accent.BorderSizePixel = 0; accent.Parent = n
    regAccent(accent, "BackgroundColor3")
    Instance.new("UICorner", accent).CornerRadius = UDim.new(1, 0)
    local iconWrap = Instance.new("Frame")
    iconWrap.Size = UDim2.new(0, 32, 0, 32); iconWrap.Position = UDim2.new(0, 20, 0, 12)
    iconWrap.BackgroundColor3 = Theme.Panel; iconWrap.BackgroundTransparency = 1
    iconWrap.BorderSizePixel = 0; iconWrap.Parent = n
    regTheme(iconWrap, "BackgroundColor3", "Panel")
    Instance.new("UICorner", iconWrap).CornerRadius = UDim.new(0, 8)
    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.new(0, 18, 0, 18); icon.Position = UDim2.new(0.5, -9, 0.5, -9)
    icon.BackgroundTransparency = 1; icon.Image = ICONS[kind] or ICONS.default
    icon.ImageColor3 = Theme.Accent; icon.ImageTransparency = 1; icon.Parent = iconWrap
    regAccent(icon, "ImageColor3")
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -74, 0, 18); t.Position = UDim2.new(0, 60, 0, 10)
    t.BackgroundTransparency = 1; t.Text = title; t.TextColor3 = Theme.Text
    t.TextSize = 13; t.Font = Enum.Font.GothamBold
    t.TextXAlignment = Enum.TextXAlignment.Left; t.TextTransparency = 1; t.Parent = n
    regTheme(t, "TextColor3", "Text")
    local d = Instance.new("TextLabel")
    d.Size = UDim2.new(1, -74, 0, 18); d.Position = UDim2.new(0, 60, 0, 28)
    d.BackgroundTransparency = 1; d.Text = text; d.TextColor3 = Theme.SubText
    d.TextSize = 11; d.Font = Enum.Font.Gotham
    d.TextXAlignment = Enum.TextXAlignment.Left; d.TextTransparency = 1
    d.TextWrapped = true; d.Parent = n
    regTheme(d, "TextColor3", "SubText")
    local progress = Instance.new("Frame")
    progress.Size = UDim2.new(1, -16, 0, 2); progress.Position = UDim2.new(0, 8, 1, -4)
    progress.BackgroundColor3 = Theme.Accent; progress.BorderSizePixel = 0; progress.Parent = n
    regAccent(progress, "BackgroundColor3")
    Instance.new("UICorner", progress).CornerRadius = UDim.new(1, 0)
    TweenService:Create(n, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(1, 0, 0, 56), BackgroundTransparency = 0,
    }):Play()
    TweenService:Create(ns, TweenInfo.new(0.35), {Transparency = 0}):Play()
    TweenService:Create(t, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
    TweenService:Create(d, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
    TweenService:Create(icon, TweenInfo.new(0.35), {ImageTransparency = 0}):Play()
    TweenService:Create(accent, TweenInfo.new(0.35), {BackgroundTransparency = 0}):Play()
    TweenService:Create(iconWrap, TweenInfo.new(0.35), {BackgroundTransparency = 0.4}):Play()
    local dur = duration or 3
    TweenService:Create(progress, TweenInfo.new(dur, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 0, 2)}):Play()
    task.delay(dur, function()
        if not n or not n.Parent then return end
        local tout = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        TweenService:Create(n, tout, {BackgroundTransparency = 1}):Play()
        TweenService:Create(ns, tout, {Transparency = 1}):Play()
        TweenService:Create(t, tout, {TextTransparency = 1}):Play()
        TweenService:Create(d, tout, {TextTransparency = 1}):Play()
        TweenService:Create(icon, tout, {ImageTransparency = 1}):Play()
        TweenService:Create(accent, tout, {BackgroundTransparency = 1}):Play()
        TweenService:Create(iconWrap, tout, {BackgroundTransparency = 1}):Play()
        TweenService:Create(progress, tout, {BackgroundTransparency = 1}):Play()
        local shrink = TweenService:Create(n, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Size = UDim2.new(1, 0, 0, 0),
        })
        shrink.Completed:Connect(function() if n then n:Destroy() end end)
        task.delay(0.3, function() shrink:Play() end)
    end)
end

-- ============================================================
-- БИНДЫ
-- ============================================================
local Binds = {}
local bindingCapture = nil
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if bindingCapture then
        local k = input.KeyCode.Name
        if k ~= "Unknown" then
            Binds[k] = bindingCapture.cb
            if bindingCapture.label then bindingCapture.label.Text = "bind: " .. k end
            bindingCapture = nil
        end
        return
    end
    local k = input.KeyCode.Name
    if Binds[k] then Binds[k]() end
end)

-- ============================================================
-- ЛЕВАЯ ПАНЕЛЬ
-- ============================================================
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(0, 140, 1, -70); TabBar.Position = UDim2.new(0, 0, 0, 60)
TabBar.BackgroundTransparency = 1; TabBar.Parent = Main
local TabList = Instance.new("UIListLayout")
TabList.Padding = UDim.new(0, 4); TabList.SortOrder = Enum.SortOrder.LayoutOrder; TabList.Parent = TabBar

local function CreateTabButton(name, icon, order)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -12, 0, 38); btn.BackgroundColor3 = Theme.Panel
    btn.BackgroundTransparency = 0.6; btn.BorderSizePixel = 0; btn.Text = ""
    btn.LayoutOrder = order; btn.Parent = TabBar
    regTheme(btn, "BackgroundColor3", "Panel")
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    local iconImg = Instance.new("ImageLabel")
    iconImg.Size = UDim2.new(0, 18, 0, 18); iconImg.Position = UDim2.new(0, 10, 0.5, -9)
    iconImg.BackgroundTransparency = 1; iconImg.Image = icon; iconImg.ImageColor3 = Theme.SubText; iconImg.Parent = btn
    regTheme(iconImg, "ImageColor3", "SubText")
    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.new(0, 80, 1, 0); txt.Position = UDim2.new(0, 34, 0, 0)
    txt.BackgroundTransparency = 1; txt.Text = name:sub(1,1):upper() .. name:sub(2)
    txt.TextColor3 = Theme.SubText; txt.TextSize = 13; txt.Font = Enum.Font.GothamBold
    txt.TextXAlignment = Enum.TextXAlignment.Left; txt.Parent = btn
    regTheme(txt, "TextColor3", "SubText")
    return btn, iconImg, txt
end

local VisualsBtn, VisualsIcon, VisualsTxt = CreateTabButton("visuals", "rbxassetid://127234874352422", 1)
local CombatBtn, CombatIcon, CombatTxt = CreateTabButton("combat", "rbxassetid://121406454377051", 2)
local SettingsBtn, SettingsIcon, SettingsTxt = CreateTabButton("settings", "rbxassetid://106205298246017", 3)

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -150, 1, -70); Content.Position = UDim2.new(0, 145, 0, 60)
Content.BackgroundTransparency = 1; Content.ClipsDescendants = true; Content.Parent = Main

-- ============================================================
-- КОМПОНЕНТЫ
-- ============================================================
local function CreateCard(parent, title)
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, 0); card.BackgroundColor3 = Theme.Card
    card.BorderSizePixel = 0; card.AutomaticSize = Enum.AutomaticSize.Y; card.Parent = parent
    regTheme(card, "BackgroundColor3", "Card")
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)
    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, 10); pad.PaddingBottom = UDim.new(0, 10)
    pad.PaddingLeft = UDim.new(0, 12); pad.PaddingRight = UDim.new(0, 12); pad.Parent = card
    local list = Instance.new("UIListLayout")
    list.Padding = UDim.new(0, 8); list.SortOrder = Enum.SortOrder.LayoutOrder; list.Parent = card
    local header = Instance.new("TextLabel")
    header.Size = UDim2.new(1, 0, 0, 20); header.BackgroundTransparency = 1
    header.Text = title; header.TextColor3 = Theme.Text; header.TextSize = 14
    header.Font = Enum.Font.GothamBold; header.TextXAlignment = Enum.TextXAlignment.Left
    header.LayoutOrder = 1; header.Parent = card
    regTheme(header, "TextColor3", "Text")
    return card
end

local function CreateToggle(parent, name, default, callback, notifyOn)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 32); row.BackgroundTransparency = 1; row.Parent = parent
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -170, 1, 0); label.BackgroundTransparency = 1
    label.Text = name; label.TextColor3 = Theme.Text; label.TextSize = 12
    label.Font = Enum.Font.GothamBold; label.TextXAlignment = Enum.TextXAlignment.Left; label.Parent = row
    regTheme(label, "TextColor3", "Text")
    local bindBtn = Instance.new("TextButton")
    bindBtn.Size = UDim2.new(0, 70, 0, 20); bindBtn.Position = UDim2.new(1, -120, 0.5, -10)
    bindBtn.BackgroundColor3 = Theme.Panel; bindBtn.BorderSizePixel = 0
    bindBtn.Text = "bind: none"; bindBtn.TextColor3 = Theme.SubText
    bindBtn.TextSize = 10; bindBtn.Font = Enum.Font.GothamBold; bindBtn.ZIndex = 5; bindBtn.Parent = row
    regTheme(bindBtn, "BackgroundColor3", "Panel"); regTheme(bindBtn, "TextColor3", "SubText")
    Instance.new("UICorner", bindBtn).CornerRadius = UDim.new(0, 4)
    local toggleBg = Instance.new("TextButton")
    toggleBg.Size = UDim2.new(0, 40, 0, 20); toggleBg.Position = UDim2.new(1, -40, 0.5, -10)
    toggleBg.BackgroundColor3 = default and Theme.Accent or Theme.Border
    toggleBg.BorderSizePixel = 0; toggleBg.Text = ""; toggleBg.ZIndex = 5; toggleBg.Parent = row
    Instance.new("UICorner", toggleBg).CornerRadius = UDim.new(0, 10)
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = default and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    knob.BackgroundColor3 = Theme.Bg; knob.BorderSizePixel = 0; knob.ZIndex = 6; knob.Parent = toggleBg
    regTheme(knob, "BackgroundColor3", "Bg")
    Instance.new("UICorner", knob).CornerRadius = UDim.new(0, 8)
    local state = default
    regToggleBg(toggleBg, function() return state end)
    local function toggle()
        state = not state
        TweenService:Create(toggleBg, TweenInfo.new(0.15), {BackgroundColor3 = state and Theme.Accent or Theme.Border}):Play()
        TweenService:Create(knob, TweenInfo.new(0.15), {Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}):Play()
        if notifyOn then Notify("candy.cc", name .. " -> " .. (state and "enabled" or "disabled"), 2.5, state and "success" or "default") end
        if callback then callback(state) end
    end
    toggleBg.MouseButton1Click:Connect(toggle)
    bindBtn.MouseButton1Click:Connect(function()
        bindBtn.Text = "press..."
        bindingCapture = {cb = toggle, label = bindBtn}
        task.delay(3, function()
            if bindingCapture and bindingCapture.label == bindBtn then bindingCapture = nil; bindBtn.Text = "bind: none" end
        end)
    end)
    return row
end

local function CreateSlider(parent, name, min, max, default, suffix, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40); frame.BackgroundTransparency = 1; frame.Parent = parent
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -80, 0, 16); label.BackgroundTransparency = 1
    label.Text = name; label.TextColor3 = Theme.Text; label.TextSize = 12
    label.Font = Enum.Font.GothamBold; label.TextXAlignment = Enum.TextXAlignment.Left; label.Parent = frame
    regTheme(label, "TextColor3", "Text")
    local valLabel = Instance.new("TextLabel")
    valLabel.Size = UDim2.new(0, 80, 0, 16); valLabel.Position = UDim2.new(1, -80, 0, 0)
    valLabel.BackgroundTransparency = 1
    valLabel.Text = string.format("%.2f", default) .. (suffix or "")
    valLabel.TextColor3 = Theme.SubText; valLabel.TextSize = 12
    valLabel.Font = Enum.Font.GothamBold; valLabel.TextXAlignment = Enum.TextXAlignment.Right; valLabel.Parent = frame
    regTheme(valLabel, "TextColor3", "SubText")
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, 0, 0, 4); bar.Position = UDim2.new(0, 0, 0, 26)
    bar.BackgroundColor3 = Theme.Border; bar.BorderSizePixel = 0; bar.Parent = frame
    regTheme(bar, "BackgroundColor3", "Border")
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 2)
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Theme.Accent; fill.BorderSizePixel = 0; fill.Parent = bar
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 2)
    regAccent(fill, "BackgroundColor3")
    local dragging = false
    local function updateValue(x)
        local rel = math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        local val = min + (max - min) * rel
        fill.Size = UDim2.new(rel, 0, 1, 0)
        valLabel.Text = string.format("%.2f", val) .. (suffix or "")
        if callback then callback(val) end
    end
    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; updateValue(input.Position.X)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateValue(input.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
    end)
    return frame
end

local function CreateColorPicker(parent, name, defaultColor, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 100); frame.BackgroundTransparency = 1; frame.Parent = parent
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -30, 0, 16); label.BackgroundTransparency = 1
    label.Text = name; label.TextColor3 = Theme.Text; label.TextSize = 12
    label.Font = Enum.Font.GothamBold; label.TextXAlignment = Enum.TextXAlignment.Left; label.Parent = frame
    regTheme(label, "TextColor3", "Text")
    local preview = Instance.new("Frame")
    preview.Size = UDim2.new(0, 20, 0, 20); preview.Position = UDim2.new(1, -20, 0, -2)
    preview.BackgroundColor3 = defaultColor; preview.BorderSizePixel = 0; preview.Parent = frame
    Instance.new("UICorner", preview).CornerRadius = UDim.new(0, 4)
    local field = Instance.new("Frame")
    field.Size = UDim2.new(1, 0, 0, 44); field.Position = UDim2.new(0, 0, 0, 22)
    field.BackgroundColor3 = Color3.fromRGB(255, 0, 0); field.BorderSizePixel = 0
    field.ClipsDescendants = true; field.Parent = frame
    Instance.new("UICorner", field).CornerRadius = UDim.new(0, 6)
    local whiteGrad = Instance.new("Frame")
    whiteGrad.Size = UDim2.new(1, 0, 1, 0); whiteGrad.BackgroundColor3 = Color3.new(1,1,1)
    whiteGrad.BorderSizePixel = 0; whiteGrad.Parent = field
    local wg = Instance.new("UIGradient")
    wg.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) }); wg.Parent = whiteGrad
    local blackGrad = Instance.new("Frame")
    blackGrad.Size = UDim2.new(1, 0, 1, 0); blackGrad.BackgroundColor3 = Color3.new(0,0,0)
    blackGrad.BorderSizePixel = 0; blackGrad.Parent = field
    local bg = Instance.new("UIGradient")
    bg.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
    bg.Rotation = 90; bg.Parent = blackGrad
    local cursor = Instance.new("Frame")
    cursor.Size = UDim2.new(0, 8, 0, 8); cursor.BackgroundTransparency = 1; cursor.BorderSizePixel = 0; cursor.Parent = field
    local cStroke = Instance.new("UIStroke"); cStroke.Color = Color3.new(1,1,1); cStroke.Thickness = 2; cStroke.Parent = cursor
    Instance.new("UICorner", cursor).CornerRadius = UDim.new(0, 4)
    local hueBar = Instance.new("Frame")
    hueBar.Size = UDim2.new(1, 0, 0, 10); hueBar.Position = UDim2.new(0, 0, 0, 72)
    hueBar.BorderSizePixel = 0; hueBar.Parent = frame
    Instance.new("UICorner", hueBar).CornerRadius = UDim.new(0, 4)
    local hueGrad = Instance.new("UIGradient")
    hueGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0.0, Color3.fromHSV(0.0,1,1)),
        ColorSequenceKeypoint.new(0.17, Color3.fromHSV(0.17,1,1)),
        ColorSequenceKeypoint.new(0.33, Color3.fromHSV(0.33,1,1)),
        ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5,1,1)),
        ColorSequenceKeypoint.new(0.67, Color3.fromHSV(0.67,1,1)),
        ColorSequenceKeypoint.new(0.83, Color3.fromHSV(0.83,1,1)),
        ColorSequenceKeypoint.new(1.0, Color3.fromHSV(1.0,1,1)),
    }); hueGrad.Parent = hueBar
    local hueCursor = Instance.new("Frame")
    hueCursor.Size = UDim2.new(0, 4, 1, 4); hueCursor.AnchorPoint = Vector2.new(0.5, 0.5)
    hueCursor.Position = UDim2.new(0, 0, 0.5, 0); hueCursor.BackgroundColor3 = Color3.new(1,1,1)
    hueCursor.BorderSizePixel = 0; hueCursor.Parent = hueBar
    Instance.new("UICorner", hueCursor).CornerRadius = UDim.new(0, 2)
    local hue, sat, val = Color3.toHSV(defaultColor)
    local draggingField, draggingHue = false, false
    local function emit()
        local c = Color3.fromHSV(hue, sat, val)
        preview.BackgroundColor3 = c; field.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        if callback then callback(c) end
    end
    local function updateField(x, y)
        local relX = math.clamp((x - field.AbsolutePosition.X) / field.AbsoluteSize.X, 0, 1)
        local relY = math.clamp((y - field.AbsolutePosition.Y) / field.AbsoluteSize.Y, 0, 1)
        sat = relX; val = 1 - relY; cursor.Position = UDim2.new(relX, -4, relY, -4); emit()
    end
    local function updateHue(x)
        hue = math.clamp((x - hueBar.AbsolutePosition.X) / hueBar.AbsoluteSize.X, 0, 1)
        hueCursor.Position = UDim2.new(hue, 0, 0.5, 0); emit()
    end
    field.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingField = true; updateField(input.Position.X, input.Position.Y)
        end
    end)
    hueBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingHue = true; updateHue(input.Position.X)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if draggingField then updateField(input.Position.X, input.Position.Y) end
            if draggingHue then updateHue(input.Position.X) end
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingField = false; draggingHue = false
        end
    end)
    hueCursor.Position = UDim2.new(hue, 0, 0.5, 0); cursor.Position = UDim2.new(sat, -4, 1 - val, -4); emit()
    return frame
end

local function CreateDropdown(parent, name, options, default, callback)
    local wrapper = Instance.new("Frame")
    wrapper.Size = UDim2.new(1, 0, 0, 32); wrapper.BackgroundTransparency = 1
    wrapper.ClipsDescendants = false; wrapper.Parent = parent
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -120, 0, 32); label.BackgroundTransparency = 1
    label.Text = name; label.TextColor3 = Theme.Text; label.TextSize = 12
    label.Font = Enum.Font.GothamBold; label.TextXAlignment = Enum.TextXAlignment.Left; label.Parent = wrapper
    regTheme(label, "TextColor3", "Text")
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 110, 0, 24); button.Position = UDim2.new(1, -110, 0.5, -12)
    button.BackgroundColor3 = Theme.Panel; button.BorderSizePixel = 0
    button.Text = default; button.TextColor3 = Theme.Text; button.TextSize = 11
    button.Font = Enum.Font.GothamBold; button.Parent = wrapper
    regTheme(button, "BackgroundColor3", "Panel"); regTheme(button, "TextColor3", "Text")
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 4)
    local list = Instance.new("Frame")
    list.Size = UDim2.new(0, 110, 0, 0); list.Position = UDim2.new(1, -110, 0, 32)
    list.BackgroundColor3 = Theme.Card; list.BorderSizePixel = 0
    list.ClipsDescendants = true; list.Visible = false; list.ZIndex = 10; list.Parent = wrapper
    regTheme(list, "BackgroundColor3", "Card")
    Instance.new("UICorner", list).CornerRadius = UDim.new(0, 6)
    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 2); listLayout.SortOrder = Enum.SortOrder.LayoutOrder; listLayout.Parent = list
    local listPad = Instance.new("UIPadding")
    listPad.PaddingTop = UDim.new(0, 4); listPad.PaddingBottom = UDim.new(0, 4)
    listPad.PaddingLeft = UDim.new(0, 4); listPad.PaddingRight = UDim.new(0, 4); listPad.Parent = list
    local open = false
    local function closeList()
        if not open then return end
        open = false
        local t = TweenService:Create(list, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 110, 0, 0),
        })
        t.Completed:Connect(function() list.Visible = false; wrapper.Size = UDim2.new(1, 0, 0, 32) end)
        t:Play()
    end
    local function openList()
        if open then return end
        open = true; list.Visible = true
        local targetHeight = #options * 24 + 8 + (#options - 1) * 2
        wrapper.Size = UDim2.new(1, 0, 0, 32 + targetHeight)
        list.Size = UDim2.new(0, 110, 0, 0)
        TweenService:Create(list, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 110, 0, targetHeight),
        }):Play()
    end
    for i, opt in ipairs(options) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1, 0, 0, 24); b.BackgroundColor3 = Theme.Panel; b.BackgroundTransparency = 1
        b.BorderSizePixel = 0; b.Text = opt; b.TextColor3 = Theme.Text; b.TextSize = 11
        b.Font = Enum.Font.GothamBold; b.LayoutOrder = i; b.ZIndex = 11; b.Parent = list
        regTheme(b, "TextColor3", "Text")
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
        b.MouseEnter:Connect(function() TweenService:Create(b, TweenInfo.new(0.1), {BackgroundTransparency = 0.7, BackgroundColor3 = Theme.Accent}):Play() end)
        b.MouseLeave:Connect(function() TweenService:Create(b, TweenInfo.new(0.1), {BackgroundTransparency = 1}):Play() end)
        b.MouseButton1Click:Connect(function()
            button.Text = opt; closeList()
            if callback then callback(opt) end
        end)
    end
    button.MouseButton1Click:Connect(function() if open then closeList() else openList() end end)
    return wrapper
end

-- ============================================================
-- ESP
-- ============================================================
local ESP = {
    Enabled = false,
    BoxESP = false, BoxStyle = "Corner", BoxThickness = 1,
    TracerESP = false, TracerOrigin = "Bottom", TracerThickness = 1,
    NameESP = false, ShowDistance = false,
    SkeletonESP = false, SkeletonThickness = 1.5, SkeletonTransparency = 1,
    ChamsEnabled = false,
    ChamsFillColor = Color3.fromRGB(255, 0, 0), ChamsOutlineColor = Color3.fromRGB(255, 255, 255),
    ChamsTransparency = 0.5, ChamsOutlineTransparency = 0,
    MaxDistance = 1000, RefreshRate = 1/144, TextSize = 14, TextFont = 2,
    Color = Color3.fromRGB(255, 25, 25),
}
local Drawings = { ESP = {}, Skeleton = {} }
local Highlights = {}

local function newLine() local l = Drawing.new("Line"); l.Visible = false; return l end
local function newText() local t = Drawing.new("Text"); t.Visible = false; t.Center = true; t.Outline = true; return t end

local function CreatePlayerESP(plr)
    if plr == LP or Drawings.ESP[plr] then return end
    local esp = {
        Box = { TL = newLine(), TR = newLine(), BL = newLine(), BR = newLine(),
                L = newLine(), R = newLine(), T = newLine(), B = newLine() },
        Tracer = newLine(),
        Name = newText(), Distance = newText(),
    }
    Drawings.ESP[plr] = esp
    local skeleton = {
        Head = newLine(), UpperSpine = newLine(),
        LShoulder = newLine(), LUpperArm = newLine(), LLowerArm = newLine(),
        RShoulder = newLine(), RUpperArm = newLine(), RLowerArm = newLine(),
        LHip = newLine(), LUpperLeg = newLine(), LLowerLeg = newLine(),
        RHip = newLine(), RUpperLeg = newLine(), RLowerLeg = newLine(),
    }
    Drawings.Skeleton[plr] = skeleton
    local hl = Instance.new("Highlight")
    hl.FillColor = ESP.ChamsFillColor; hl.OutlineColor = ESP.ChamsOutlineColor
    hl.FillTransparency = ESP.ChamsTransparency; hl.OutlineTransparency = ESP.ChamsOutlineTransparency
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; hl.Enabled = false
    Highlights[plr] = hl
end

local function RemovePlayerESP(plr)
    local esp = Drawings.ESP[plr]
    if esp then
        for _, l in pairs(esp.Box) do l:Remove() end
        esp.Tracer:Remove()
        esp.Name:Remove(); esp.Distance:Remove()
        Drawings.ESP[plr] = nil
    end
    local sk = Drawings.Skeleton[plr]
    if sk then for _, l in pairs(sk) do l:Remove() end; Drawings.Skeleton[plr] = nil end
    if Highlights[plr] then Highlights[plr]:Destroy(); Highlights[plr] = nil end
end

local function applyEspColor(c)
    ESP.Color = c
    for _, esp in pairs(Drawings.ESP) do
        for _, l in pairs(esp.Box) do l.Color = c end
        esp.Tracer.Color = c
        esp.Name.Color = c; esp.Distance.Color = c
    end
end
local function applyChamsColors()
    for _, hl in pairs(Highlights) do
        hl.FillColor = ESP.ChamsFillColor; hl.OutlineColor = ESP.ChamsOutlineColor
        hl.FillTransparency = ESP.ChamsTransparency; hl.OutlineTransparency = ESP.ChamsOutlineTransparency
    end
end
local function applySkeletonStyle()
    for _, sk in pairs(Drawings.Skeleton) do
        for _, l in pairs(sk) do
            l.Thickness = ESP.SkeletonThickness; l.Transparency = ESP.SkeletonTransparency
        end
    end
end

local function getBox(cf, size)
    local top, topOn = Camera:WorldToViewportPoint((cf * CFrame.new(0, size.Y/2, 0)).Position)
    local bot, botOn = Camera:WorldToViewportPoint((cf * CFrame.new(0, -size.Y/2, 0)).Position)
    if not topOn or not botOn then return false end
    local h = bot.Y - top.Y; local w = h * 0.65
    return Vector2.new(top.X - w/2, top.Y), Vector2.new(w, h)
end

local function hideAll(esp)
    for _, l in pairs(esp.Box) do l.Visible = false end
    esp.Tracer.Visible = false
    esp.Name.Visible = false; esp.Distance.Visible = false
end

local function UpdatePlayerESP(plr)
    local esp = Drawings.ESP[plr]
    if not esp then return end
    local char = plr.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")
    if not (char and root and hum and hum.Health > 0) then
        hideAll(esp)
        if Highlights[plr] then Highlights[plr].Enabled = false; Highlights[plr].Parent = nil end
        local sk = Drawings.Skeleton[plr]; if sk then for _, l in pairs(sk) do l.Visible = false end end
        return
    end
    local rootPos, onScreen = Camera:WorldToViewportPoint(root.Position)
    local dist = (root.Position - Camera.CFrame.Position).Magnitude
    if not onScreen or dist > ESP.MaxDistance then hideAll(esp); return end
    local color = ESP.Color
    local size = char:GetExtentsSize()
    local cf = root.CFrame
    if ESP.BoxESP then
        if ESP.BoxStyle == "Full" then
            local pos, sz = getBox(cf, size)
            if pos then
                esp.Box.L.From = pos; esp.Box.L.To = pos + Vector2.new(0, sz.Y); esp.Box.L.Visible = true
                esp.Box.R.From = pos + Vector2.new(sz.X, 0); esp.Box.R.To = pos + sz; esp.Box.R.Visible = true
                esp.Box.T.From = pos; esp.Box.T.To = pos + Vector2.new(sz.X, 0); esp.Box.T.Visible = true
                esp.Box.B.From = pos + Vector2.new(0, sz.Y); esp.Box.B.To = pos + sz; esp.Box.B.Visible = true
                for _, k in ipairs({"TL","TR","BL","BR"}) do esp.Box[k].Visible = false end
                for _, l in pairs(esp.Box) do if l.Visible then l.Color = color; l.Thickness = ESP.BoxThickness end end
            end
        else
            local pos, sz = getBox(cf, size)
            if pos then
                local cs = sz.X * 0.2
                esp.Box.TL.From = pos; esp.Box.TL.To = pos + Vector2.new(cs, 0); esp.Box.TL.Visible = true
                esp.Box.TR.From = pos + Vector2.new(sz.X, 0); esp.Box.TR.To = pos + Vector2.new(sz.X - cs, 0); esp.Box.TR.Visible = true
                esp.Box.BL.From = pos + Vector2.new(0, sz.Y); esp.Box.BL.To = pos + Vector2.new(cs, sz.Y); esp.Box.BL.Visible = true
                esp.Box.BR.From = pos + Vector2.new(sz.X, sz.Y); esp.Box.BR.To = pos + Vector2.new(sz.X - cs, sz.Y); esp.Box.BR.Visible = true
                esp.Box.L.From = pos; esp.Box.L.To = pos + Vector2.new(0, cs); esp.Box.L.Visible = true
                esp.Box.R.From = pos + Vector2.new(sz.X, 0); esp.Box.R.To = pos + Vector2.new(sz.X, cs); esp.Box.R.Visible = true
                esp.Box.T.From = pos + Vector2.new(0, sz.Y); esp.Box.T.To = pos + Vector2.new(0, sz.Y - cs); esp.Box.T.Visible = true
                esp.Box.B.From = pos + Vector2.new(sz.X, sz.Y); esp.Box.B.To = pos + Vector2.new(sz.X, sz.Y - cs); esp.Box.B.Visible = true
                for _, l in pairs(esp.Box) do if l.Visible then l.Color = color; l.Thickness = ESP.BoxThickness end end
            end
        end
    else
        for _, l in pairs(esp.Box) do l.Visible = false end
    end
    if ESP.TracerESP then
        local origin
        if ESP.TracerOrigin == "Top" then origin = Vector2.new(Camera.ViewportSize.X/2, 0)
        elseif ESP.TracerOrigin == "Mouse" then origin = UserInputService:GetMouseLocation()
        elseif ESP.TracerOrigin == "Center" then origin = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        else origin = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y) end
        esp.Tracer.From = origin; esp.Tracer.To = Vector2.new(rootPos.X, rootPos.Y)
        esp.Tracer.Color = color; esp.Tracer.Thickness = ESP.TracerThickness; esp.Tracer.Visible = true
    else esp.Tracer.Visible = false end
    if ESP.NameESP then
        local pos, sz = getBox(cf, size)
        if pos then
            esp.Name.Text = plr.DisplayName
            esp.Name.Position = Vector2.new(pos.X + sz.X/2, pos.Y - 20)
            esp.Name.Color = color; esp.Name.Size = ESP.TextSize; esp.Name.Font = ESP.TextFont
            esp.Name.Visible = true
        end
    else esp.Name.Visible = false end
    if ESP.ShowDistance then
        local pos, sz = getBox(cf, size)
        if pos then
            esp.Distance.Text = tostring(math.floor(dist)) .. "m"
            esp.Distance.Position = Vector2.new(pos.X + sz.X/2, pos.Y + sz.Y + 4)
            esp.Distance.Color = color; esp.Distance.Size = ESP.TextSize - 2; esp.Distance.Font = ESP.TextFont
            esp.Distance.Visible = true
        end
    else esp.Distance.Visible = false end
    local hl = Highlights[plr]
    if hl then
        if ESP.ChamsEnabled then hl.Parent = char; hl.Enabled = true else hl.Enabled = false end
    end
    local sk = Drawings.Skeleton[plr]
    if sk then
        if ESP.SkeletonESP then
            local function bone(a, b, line)
                if not a or not b then line.Visible = false; return end
                local ap, aon = Camera:WorldToViewportPoint(a.Position)
                local bp, bon = Camera:WorldToViewportPoint(b.Position)
                if not aon or not bon then line.Visible = false; return end
                line.From = Vector2.new(ap.X, ap.Y); line.To = Vector2.new(bp.X, bp.Y)
                line.Color = color; line.Thickness = ESP.SkeletonThickness
                line.Transparency = ESP.SkeletonTransparency; line.Visible = true
            end
            local head = char:FindFirstChild("Head")
            local ut = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
            local lt = char:FindFirstChild("LowerTorso") or char:FindFirstChild("Torso")
            local luA = char:FindFirstChild("LeftUpperArm") or char:FindFirstChild("Left Arm")
            local llA = char:FindFirstChild("LeftLowerArm") or char:FindFirstChild("Left Arm")
            local ruA = char:FindFirstChild("RightUpperArm") or char:FindFirstChild("Right Arm")
            local rlA = char:FindFirstChild("RightLowerArm") or char:FindFirstChild("Right Arm")
            local luL = char:FindFirstChild("LeftUpperLeg") or char:FindFirstChild("Left Leg")
            local llL = char:FindFirstChild("LeftLowerLeg") or char:FindFirstChild("Left Leg")
            local ruL = char:FindFirstChild("RightUpperLeg") or char:FindFirstChild("Right Leg")
            local rlL = char:FindFirstChild("RightLowerLeg") or char:FindFirstChild("Right Leg")
            bone(head, ut, sk.Head); bone(ut, lt, sk.UpperSpine)
            bone(ut, luA, sk.LShoulder); bone(luA, llA, sk.LUpperArm)
            bone(ut, ruA, sk.RShoulder); bone(ruA, rlA, sk.RUpperArm)
            bone(lt, luL, sk.LHip); bone(luL, llL, sk.LUpperLeg)
            bone(lt, ruL, sk.RHip); bone(ruL, rlL, sk.RUpperLeg)
        else
            for _, l in pairs(sk) do l.Visible = false end
        end
    end
end

-- ============================================================
-- СЕРДЕЧКИ
-- ============================================================
local heartEnabled = false
local HEART_POOL_SIZE = 30
local HEART_SIZE = 24
local HEART_LIFETIME = 1.6
local HEART_SPAWN_INTERVAL = 0.04
local heartPool = {}

local function createHeartObject()
    local part = Instance.new("Part")
    part.Size = Vector3.new(0.01, 0.01, 0.01)
    part.Transparency = 1; part.Anchored = true
    part.CanCollide = false; part.CanQuery = false; part.CanTouch = false
    part.Name = "candy_heart"
    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.new(0, HEART_SIZE, 0, HEART_SIZE)
    bb.AlwaysOnTop = true; bb.LightInfluence = 0; bb.Parent = part
    local img = Instance.new("ImageLabel")
    img.Size = UDim2.new(1, 0, 1, 0); img.BackgroundTransparency = 1
    img.Image = heartAsset; img.ImageColor3 = Color3.new(1, 1, 1); img.Parent = bb
    return {Part = part, Img = img, Age = 0, Active = false, Velocity = Vector3.new(0,0,0), StartScale = 1}
end

for i = 1, HEART_POOL_SIZE do heartPool[i] = createHeartObject() end

local function spawnHeart(originPos)
    for _, h in ipairs(heartPool) do
        if not h.Active then
            h.Active = true; h.Age = 0
            local theta = math.random() * math.pi * 2
            local phi = math.acos(2 * math.random() - 1)
            local dir = Vector3.new(
                math.sin(phi) * math.cos(theta),
                math.abs(math.cos(phi)) * 0.7 + 0.4,
                math.sin(phi) * math.sin(theta)
            ).Unit
            h.Part.Position = originPos + dir * 0.3
            h.Velocity = dir * (6 + math.random() * 4)
            h.Part.Parent = workspace
            h.Img.ImageTransparency = 0
            h.StartScale = 0.4 + math.random() * 0.4
            h.Img.Size = UDim2.new(h.StartScale, 0, h.StartScale, 0)
            h.Img.Position = UDim2.new((1 - h.StartScale) / 2, 0, (1 - h.StartScale) / 2, 0)
            return
        end
    end
end

RunService.Heartbeat:Connect(function(dt)
    for _, h in ipairs(heartPool) do
        if h.Active then
            h.Age = h.Age + dt
            h.Velocity = h.Velocity * (1 - dt * 1.5)
            h.Velocity = h.Velocity + Vector3.new(0, 1.2 * dt, 0)
            h.Part.Position = h.Part.Position + h.Velocity * dt
            local alpha = 1 - (h.Age / HEART_LIFETIME)
            if alpha < 0 then alpha = 0 end
            h.Img.ImageTransparency = 1 - alpha
            local scale = h.StartScale * (0.6 + 0.4 * math.min(h.Age * 3, 1))
            h.Img.Size = UDim2.new(scale, 0, scale, 0)
            h.Img.Position = UDim2.new((1 - scale) / 2, 0, (1 - scale) / 2, 0)
            if h.Age >= HEART_LIFETIME then
                h.Active = false; h.Part.Parent = nil
            end
        end
    end
end)

task.spawn(function()
    while task.wait(HEART_SPAWN_INTERVAL) do
        if not heartEnabled then continue end
        local char = LP.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then spawnHeart(root.Position) end
    end
end)

-- ============================================================
-- VISUALS PAGE
-- ============================================================
local VisualsPage = Instance.new("Frame")
VisualsPage.Size = UDim2.new(1, 0, 1, 0); VisualsPage.BackgroundTransparency = 1
VisualsPage.Parent = Content

local function MakeHalf(posX, title)
    local half = Instance.new("Frame")
    half.Size = UDim2.new(0.5, -4, 1, 0); half.Position = UDim2.new(posX, 0, 0, 0)
    half.BackgroundTransparency = 1; half.Parent = VisualsPage
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -8, 0, 22); titleLabel.Position = UDim2.new(0, 4, 0, 0)
    titleLabel.BackgroundTransparency = 1; titleLabel.Text = title; titleLabel.TextColor3 = Theme.Text
    titleLabel.TextSize = 14; titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left; titleLabel.Parent = half
    regTheme(titleLabel, "TextColor3", "Text")
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, 0, 1, -26); scroll.Position = UDim2.new(0, 0, 0, 26)
    scroll.BackgroundTransparency = 1; scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 3; scroll.ScrollBarImageColor3 = Theme.Border
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0); scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.Parent = half
    local list = Instance.new("UIListLayout")
    list.Padding = UDim.new(0, 8); list.Parent = scroll
    local pad = Instance.new("UIPadding")
    pad.PaddingRight = UDim.new(0, 6); pad.PaddingLeft = UDim.new(0, 2); pad.Parent = scroll
    return scroll
end

local LeftScroll = MakeHalf(0, "player")
local RightScroll = MakeHalf(0.5, "world")

local playerCard = CreateCard(LeftScroll, "player")
CreateToggle(playerCard, "esp enabled", false, function(s)
    ESP.Enabled = s
    if s then
        for _, p in ipairs(Players:GetPlayers()) do CreatePlayerESP(p) end
    else
        for plr, esp in pairs(Drawings.ESP) do hideAll(esp) end
        for _, hl in pairs(Highlights) do hl.Enabled = false; hl.Parent = nil end
    end
end, true)
CreateColorPicker(playerCard, "esp color", ESP.Color, applyEspColor)
CreateToggle(playerCard, "box esp", false, function(s) ESP.BoxESP = s end, true)
CreateDropdown(playerCard, "box style", {"Corner","Full"}, "Corner", function(v) ESP.BoxStyle = v end)
CreateSlider(playerCard, "box thickness", 1, 5, 1, "", function(v) ESP.BoxThickness = v end)
CreateToggle(playerCard, "tracer esp", false, function(s) ESP.TracerESP = s end, true)
CreateDropdown(playerCard, "tracer origin", {"Bottom","Top","Mouse","Center"}, "Bottom", function(v) ESP.TracerOrigin = v end)
CreateSlider(playerCard, "tracer thickness", 1, 5, 1, "", function(v) ESP.TracerThickness = v end)
CreateToggle(playerCard, "name esp", false, function(s) ESP.NameESP = s end, true)
CreateToggle(playerCard, "show distance", false, function(s) ESP.ShowDistance = s end, true)
CreateToggle(playerCard, "skeleton esp", false, function(s) ESP.SkeletonESP = s end, true)
CreateSlider(playerCard, "skeleton thickness", 0.5, 5, 1.5, "", function(v) ESP.SkeletonThickness = v; applySkeletonStyle() end)
CreateSlider(playerCard, "skeleton transparency", 0, 1, 1, "", function(v) ESP.SkeletonTransparency = v; applySkeletonStyle() end)
CreateToggle(playerCard, "chams (others)", false, function(s) ESP.ChamsEnabled = s end, true)
CreateColorPicker(playerCard, "chams fill", ESP.ChamsFillColor, function(c) ESP.ChamsFillColor = c; applyChamsColors() end)
CreateColorPicker(playerCard, "chams outline", ESP.ChamsOutlineColor, function(c) ESP.ChamsOutlineColor = c; applyChamsColors() end)
CreateSlider(playerCard, "chams fill transp", 0, 1, 0.5, "", function(v) ESP.ChamsTransparency = v; applyChamsColors() end)
CreateSlider(playerCard, "chams outline transp", 0, 1, 0, "", function(v) ESP.ChamsOutlineTransparency = v; applyChamsColors() end)

local selfChamsEnabled = false
local selfChamsColor = Color3.fromRGB(255, 100, 100)
local selfChamsFormat = "def"
local selfChamsHighlight = nil
local function applySelfChams()
    if selfChamsHighlight then selfChamsHighlight:Destroy(); selfChamsHighlight = nil end
    if not selfChamsEnabled then return end
    local char = LP.Character
    if not char then return end
    local hl = Instance.new("Highlight")
    hl.FillColor = selfChamsColor; hl.OutlineColor = selfChamsColor
    if selfChamsFormat == "def" then
        hl.FillTransparency = 0.3; hl.OutlineTransparency = 1
    else
        hl.FillTransparency = 0.7; hl.OutlineTransparency = 0
    end
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Adornee = char; hl.Parent = char
    selfChamsHighlight = hl
end
CreateToggle(playerCard, "self chams", false, function(s) selfChamsEnabled = s; applySelfChams() end, true)
CreateColorPicker(playerCard, "self chams color", selfChamsColor, function(c)
    selfChamsColor = c
    if selfChamsHighlight then selfChamsHighlight.FillColor = c; selfChamsHighlight.OutlineColor = c end
end)
CreateDropdown(playerCard, "self chams format", {"def","outline"}, "def", function(v) selfChamsFormat = v; applySelfChams() end)
LP.CharacterAdded:Connect(function()
    task.wait(0.3); if selfChamsEnabled then applySelfChams() end
end)

local worldCard = CreateCard(RightScroll, "world")
local trailEnabled = false
local trailColor = Color3.fromRGB(255, 255, 255)
local trailLifetime = 1
local function buildTrailColor(c)
    return ColorSequence.new({ ColorSequenceKeypoint.new(0, c), ColorSequenceKeypoint.new(1, c) })
end
local trailColorSeq = buildTrailColor(trailColor)
local function applyToTrail(t)
    t.Color = trailColorSeq; t.Lifetime = trailLifetime; t.Enabled = trailEnabled
    t.MinLength = 0; t.WidthScale = NumberSequence.new(1)
end
local function scanTrails()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Trail") then applyToTrail(obj) end
    end
end
workspace.DescendantAdded:Connect(function(obj)
    if trailEnabled and obj:IsA("Trail") then task.wait(0.05); applyToTrail(obj) end
end)
CreateToggle(worldCard, "trail", false, function(s) trailEnabled = s; scanTrails() end, true)
CreateColorPicker(worldCard, "trail color", trailColor, function(c) trailColor = c; trailColorSeq = buildTrailColor(c); scanTrails() end)
CreateSlider(worldCard, "trail lifetime", 0.1, 5, 1, "s", function(v) trailLifetime = v; scanTrails() end)
CreateToggle(worldCard, "hearts trail", false, function(s) heartEnabled = s end, true)

local fogEnabled = false
local fogColor = Color3.fromRGB(30, 30, 30)
local fogStart = 0
local fogEnd = 1000
local function applyFog()
    if fogEnabled then
        Lighting.FogColor = fogColor; Lighting.FogStart = fogStart; Lighting.FogEnd = fogEnd
    else
        Lighting.FogEnd = 100000; Lighting.FogStart = 0
    end
end
CreateToggle(worldCard, "fog", false, function(s) fogEnabled = s; applyFog() end, true)
CreateColorPicker(worldCard, "fog color", fogColor, function(c) fogColor = c; applyFog() end)
CreateSlider(worldCard, "fog start", 0, 500, 0, "", function(v) fogStart = v; applyFog() end)
CreateSlider(worldCard, "fog end", 100, 5000, 1000, "", function(v) fogEnd = v; applyFog() end)

-- ============================================================
-- COMBAT PAGE
-- ============================================================
local CombatPage = Instance.new("Frame")
CombatPage.Size = UDim2.new(1, 0, 1, 0); CombatPage.BackgroundTransparency = 1
CombatPage.Parent = Content; CombatPage.Visible = false

local function MakeCombatHalf(posX, title)
    local half = Instance.new("Frame")
    half.Size = UDim2.new(0.5, -4, 1, 0); half.Position = UDim2.new(posX, 0, 0, 0)
    half.BackgroundTransparency = 1; half.Parent = CombatPage
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -8, 0, 22); titleLabel.Position = UDim2.new(0, 4, 0, 0)
    titleLabel.BackgroundTransparency = 1; titleLabel.Text = title; titleLabel.TextColor3 = Theme.Text
    titleLabel.TextSize = 14; titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left; titleLabel.Parent = half
    regTheme(titleLabel, "TextColor3", "Text")
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, 0, 1, -26); scroll.Position = UDim2.new(0, 0, 0, 26)
    scroll.BackgroundTransparency = 1; scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 3; scroll.ScrollBarImageColor3 = Theme.Border
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0); scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.Parent = half
    local list = Instance.new("UIListLayout")
    list.Padding = UDim.new(0, 8); list.Parent = scroll
    local pad = Instance.new("UIPadding")
    pad.PaddingRight = UDim.new(0, 6); pad.PaddingLeft = UDim.new(0, 2); pad.Parent = scroll
    return scroll
end

local LegitScroll = MakeCombatHalf(0, "legit")
local RageScroll = MakeCombatHalf(0.5, "rage")

-- ============================================================
-- LEGIT: WALLHOP (логика из V2.6 Mode 1) + FLICK
-- ============================================================
local wallhopEnabled = false
local flickEnabled = false
local flickInterval = 0.3
local lastFlick = 0

-- Настройки wallhop
local WH = {
    Cooldown = 0.15,
    JumpVelocity = 56,
    JumpVariance = 4,
    WallBuffer = 0.12,
    PlayerDetection = true,
}

local whLastJump = 0
local whLastWallTime = 0

-- Кэш параметров raycast
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
local function updateRaycastFilter()
    raycastParams.FilterDescendantsInstances = {LP.Character or {}}
end

-- Логика hasWall из V2.6 (с буфером и player detection)
local function hasWall(root)
    if not root then return false end
    updateRaycastFilter()
    local pos = root.Position + Vector3.new(0, -1.8, 0)
    local dirs = {
        root.CFrame.RightVector * 4,
        root.CFrame.RightVector * -4,
        root.CFrame.LookVector * 4,
        root.CFrame.LookVector * -4,
    }
    for _, dir in ipairs(dirs) do
        local hit = Workspace:Raycast(pos, dir, raycastParams)
        if hit then
            if WH.PlayerDetection then
                local hitPart = hit.Instance
                local isPlayerPart = false
                for _, otherPlayer in ipairs(Players:GetPlayers()) do
                    if otherPlayer ~= LP and otherPlayer.Character
                    and hitPart:IsDescendantOf(otherPlayer.Character)
                    and not hitPart.CanCollide then
                        isPlayerPart = true
                        break
                    end
                end
                if not isPlayerPart then
                    whLastWallTime = tick()
                    return true
                end
            else
                whLastWallTime = tick()
                return true
            end
        end
    end
    -- wall buffer
    if tick() - whLastWallTime < WH.WallBuffer then
        return true
    end
    return false
end

-- Слушаем JumpRequest (срабатывает по нажатию пробела) — Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if not wallhopEnabled then return end
    local char = LP.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return end
    if tick() - whLastJump < WH.Cooldown then return end
    if not hasWall(root) then return end
    whLastJump = tick()
    hum:ChangeState(Enum.HumanoidStateType.Jumping)
    local vel = root.AssemblyLinearVelocity
    local jitter = math.random(-WH.JumpVariance, WH.JumpVariance)
    root.AssemblyLinearVelocity = Vector3.new(vel.X, WH.JumpVelocity + jitter, vel.Z)
end)

-- FLICK
RunService.Heartbeat:Connect(function()
    if flickEnabled then
        local now = tick()
        if now - lastFlick >= flickInterval then
            lastFlick = now
            local char = LP.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then
                local original = root.CFrame
                root.CFrame = original * CFrame.Angles(0, math.rad(180), 0)
                task.wait(0.05)
                if root.Parent then root.CFrame = original end
            end
        end
    end
end)

local legitCard = CreateCard(LegitScroll, "legit")
CreateToggle(legitCard, "auto wallhop", false, function(s) wallhopEnabled = s end, true)
CreateSlider(legitCard, "wallhop cooldown", 0.05, 1, 0.15, "s", function(v) WH.Cooldown = v end)
CreateSlider(legitCard, "jump velocity", 30, 120, 56, "", function(v) WH.JumpVelocity = v end)
CreateSlider(legitCard, "jump variance", 0, 30, 4, "", function(v) WH.JumpVariance = v end)
CreateSlider(legitCard, "wall buffer", 0, 1, 0.12, "s", function(v) WH.WallBuffer = v end)
CreateToggle(legitCard, "player detection", true, function(s) WH.PlayerDetection = s end, true)
CreateToggle(legitCard, "flick", false, function(s) flickEnabled = s end, true)
CreateSlider(legitCard, "flick interval", 0.1, 1, 0.3, "s", function(v) flickInterval = v end)

-- ============================================================
-- RAGE
-- ============================================================
local speedBoostEnabled = false
local speedValue = 50
local jumpBoostEnabled = false
local jumpValue = 100

local function applySpeed()
    local char = LP.Character
    local hum = char and char:FindFirstChild("Humanoid")
    if hum then hum.WalkSpeed = speedBoostEnabled and speedValue or 16 end
end
local function applyJump()
    local char = LP.Character
    local hum = char and char:FindFirstChild("Humanoid")
    if hum then
        if jumpBoostEnabled then
            hum.UseJumpPower = true; hum.JumpPower = jumpValue
        else
            hum.JumpPower = 50
        end
    end
end
LP.CharacterAdded:Connect(function() task.wait(0.3); applySpeed(); applyJump() end)

local rageCard = CreateCard(RageScroll, "rage")
CreateToggle(rageCard, "speed boost", false, function(s) speedBoostEnabled = s; applySpeed() end, true)
CreateSlider(rageCard, "speed value", 16, 200, 50, "", function(v) speedValue = v; if speedBoostEnabled then applySpeed() end end)
CreateToggle(rageCard, "jump boost", false, function(s) jumpBoostEnabled = s; applyJump() end, true)
CreateSlider(rageCard, "jump value", 50, 500, 100, "", function(v) jumpValue = v; if jumpBoostEnabled then applyJump() end end)

-- ============================================================
-- SETTINGS
-- ============================================================
local SettingsPage = Instance.new("Frame")
SettingsPage.Size = UDim2.new(1, 0, 1, 0); SettingsPage.BackgroundTransparency = 1
SettingsPage.Parent = Content; SettingsPage.Visible = false
local settingsScroll = Instance.new("ScrollingFrame")
settingsScroll.Size = UDim2.new(1, 0, 1, 0); settingsScroll.BackgroundTransparency = 1
settingsScroll.BorderSizePixel = 0; settingsScroll.ScrollBarThickness = 3
settingsScroll.ScrollBarImageColor3 = Theme.Border
settingsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
settingsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
settingsScroll.Parent = SettingsPage
local settingsList = Instance.new("UIListLayout")
settingsList.Padding = UDim.new(0, 8); settingsList.Parent = settingsScroll

local appearanceCard = CreateCard(settingsScroll, "appearance")
CreateDropdown(appearanceCard, "theme", {"dark","light"}, "dark", function(v)
    applyTheme(v); Notify("candy.cc", "theme: " .. v, 2)
end)
CreateColorPicker(appearanceCard, "accent color", Theme.Accent, function(c)
    applyAccent(c)
    local activeMap = {
        visuals = {VisualsIcon, VisualsTxt},
        combat = {CombatIcon, CombatTxt},
        settings = {SettingsIcon, SettingsTxt},
    }
    for name, data in pairs(activeMap) do
        if pages and pages[name] and pages[name].Visible then
            data[1].ImageColor3 = c; data[2].TextColor3 = c
        end
    end
    MainStroke.Color = c
end)
CreateSlider(appearanceCard, "corner radius", 0, 40, 14, "px", function(v)
    MainCorner.CornerRadius = UDim.new(0, math.floor(v))
end)

local espSettingsCard = CreateCard(settingsScroll, "esp settings")
CreateSlider(espSettingsCard, "max distance", 100, 5000, 1000, "", function(v) ESP.MaxDistance = v end)
CreateSlider(espSettingsCard, "refresh rate", 1, 144, 144, "fps", function(v) ESP.RefreshRate = 1 / v end)
CreateSlider(espSettingsCard, "text size", 10, 24, 14, "", function(v) ESP.TextSize = v end)

-- ============================================================
-- ПЕРЕКЛЮЧЕНИЕ ВКЛАДОК
-- ============================================================
local pages = {visuals = VisualsPage, combat = CombatPage, settings = SettingsPage}
local buttons = {
    visuals = {VisualsBtn, VisualsIcon, VisualsTxt},
    combat = {CombatBtn, CombatIcon, CombatTxt},
    settings = {SettingsBtn, SettingsIcon, SettingsTxt},
}
local function SwitchTab(selected)
    for name, page in pairs(pages) do page.Visible = (name == selected) end
    for name, data in pairs(buttons) do
        local btn, icon, txt = data[1], data[2], data[3]
        if name == selected then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.2}):Play()
            icon.ImageColor3 = Theme.Accent; txt.TextColor3 = Theme.Accent
        else
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.6}):Play()
            icon.ImageColor3 = Theme.SubText; txt.TextColor3 = Theme.SubText
        end
    end
end
VisualsBtn.MouseButton1Click:Connect(function() SwitchTab("visuals") end)
CombatBtn.MouseButton1Click:Connect(function() SwitchTab("combat") end)
SettingsBtn.MouseButton1Click:Connect(function() SwitchTab("settings") end)
SwitchTab("visuals")

local lastUpdate = 0
RunService.RenderStepped:Connect(function()
    if not ESP.Enabled then return end
    local now = tick()
    if now - lastUpdate < ESP.RefreshRate then return end
    lastUpdate = now
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP then
            if not Drawings.ESP[plr] then CreatePlayerESP(plr) end
            UpdatePlayerESP(plr)
        end
    end
end)

Players.PlayerAdded:Connect(CreatePlayerESP)
Players.PlayerRemoving:Connect(RemovePlayerESP)
for _, p in ipairs(Players:GetPlayers()) do CreatePlayerESP(p) end

Notify("candy.cc", "loaded successfully", 3, "success")
