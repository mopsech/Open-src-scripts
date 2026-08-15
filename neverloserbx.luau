-- AI PAST HUB
-- Только структура на Neverlose GUI
-- Без ключей, без Obsidian, без функций

do
    local Constant = 'LPH_'..'NO_VIRTUALIZE';
    getfenv()[Constant] = getfenv()[Constant] or function(f) return f end;
end;

local NeverLose = {};

NeverLose.BuiltInRegular = Font.new('rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json',Enum.FontWeight.Regular,Enum.FontStyle.Normal);
NeverLose.BuiltInBold = Font.new('rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json',Enum.FontWeight.Bold,Enum.FontStyle.Normal);
NeverLose.GlobalSignals = {};

local cloneref = cloneref or function(f) return f end;
local TweenService = cloneref(game:GetService('TweenService'));
local UserInputService = cloneref(game:GetService('UserInputService'));
local Players = cloneref(game:GetService('Players'));
local LocalPlayer = Players.LocalPlayer;
local CoreGui = (gethui and gethui()) or (get_hidden_gui and get_hidden_gui()) or cloneref(game:FindFirstChild('CoreGui')) or cloneref(LocalPlayer.PlayerGui);
local ProtectGui = protect_gui or protectgui or (syn and syn.protect_gui) or function(s) return s; end;

local GlobalWindow = Instance.new('ScreenGui');
ProtectGui(GlobalWindow);
GlobalWindow.Name = "AI_PAST_HUB";
GlobalWindow.IgnoreGuiInset = true;
GlobalWindow.ZIndexBehavior = Enum.ZIndexBehavior.Global;
GlobalWindow.ResetOnSpawn = false;
GlobalWindow.Parent = CoreGui;
NeverLose.ScreenGui = GlobalWindow;

NeverLose.PlayAnimate = function(Self, Info, Property)
    local Tween = TweenService:Create(Self, Info or TweenInfo.new(0.25), Property);
    Tween:Play();
    return Tween;
end;

-- ============================================================
-- ГЛАВНОЕ ОКНО
-- ============================================================

local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local CloseBtn = Instance.new("ImageButton")
local TabContainer = Instance.new("Frame")
local ContentContainer = Instance.new("Frame")

MainFrame.Name = "MainFrame"
MainFrame.Parent = NeverLose.ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(14, 16, 22)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Size = UDim2.new(0, 520, 0, 400)

UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 8)

UIStroke.Thickness = 1
UIStroke.Transparency = 0.7
UIStroke.Color = Color3.fromRGB(45, 48, 58)
UIStroke.Parent = MainFrame

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 8)
Title.Size = UDim2.new(0, 200, 0, 28)
Title.Font = Enum.Font.GothamBold
Title.Text = "AI PAST HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left

CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = MainFrame
CloseBtn.AnchorPoint = Vector2.new(1, 0)
CloseBtn.Position = UDim2.new(1, -10, 0, 8)
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Image = "rbxassetid://10685272437"
CloseBtn.ImageColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.ImageTransparency = 0.4

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

TabContainer.Name = "TabContainer"
TabContainer.Parent = MainFrame
TabContainer.Position = UDim2.new(0, 0, 0, 42)
TabContainer.Size = UDim2.new(1, 0, 0, 38)
TabContainer.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
TabContainer.BorderSizePixel = 0

ContentContainer.Name = "ContentContainer"
ContentContainer.Parent = MainFrame
ContentContainer.Position = UDim2.new(0, 0, 0, 80)
ContentContainer.Size = UDim2.new(1, 0, 1, -80)
ContentContainer.BackgroundTransparency = 1

-- ============================================================
-- СИСТЕМА ВКЛАДОК
-- ============================================================

local Tabs = {}
local CurrentTab = nil

local function CreateTabButton(Name, Icon)
    local Button = Instance.new("ImageButton")
    Button.Name = Name
    Button.Parent = TabContainer
    Button.Size = UDim2.new(0, 80, 1, 0)
    Button.BackgroundTransparency = 1
    Button.ImageTransparency = 1
    
    local Label = Instance.new("TextLabel")
    Label.Parent = Button
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Font = Enum.Font.GothamSemibold
    Label.Text = Name
    Label.TextColor3 = Color3.fromRGB(180, 180, 190)
    Label.TextSize = 13
    
    local Underline = Instance.new("Frame")
    Underline.Parent = Button
    Underline.Position = UDim2.new(0, 0, 1, -2)
    Underline.Size = UDim2.new(1, 0, 0, 2)
    Underline.BackgroundColor3 = Color3.fromRGB(78, 127, 252)
    Underline.BackgroundTransparency = 1
    
    Button.MouseButton1Click:Connect(function()
        for _, tab in pairs(Tabs) do
            tab.Container.Visible = false
            tab.Button.Underline.BackgroundTransparency = 1
            tab.Button.Label.TextColor3 = Color3.fromRGB(180, 180, 190)
        end
        Tabs[Name].Container.Visible = true
        Tabs[Name].Button.Underline.BackgroundTransparency = 0
        Tabs[Name].Button.Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        CurrentTab = Name
    end)
    
    return Button
end

local function CreateTab(Name, Icon)
    local Container = Instance.new("ScrollingFrame")
    Container.Parent = ContentContainer
    Container.Size = UDim2.new(1, 0, 1, 0)
    Container.BackgroundTransparency = 1
    Container.BorderSizePixel = 0
    Container.CanvasSize = UDim2.new(0, 0, 0, 0)
    Container.ScrollBarThickness = 4
    Container.ScrollBarImageColor3 = Color3.fromRGB(78, 127, 252)
    Container.Visible = false
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = Container
    UIListLayout.Padding = UDim.new(0, 6)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local Button = CreateTabButton(Name, Icon)
    Tabs[Name] = {
        Container = Container,
        Button = Button,
        UIListLayout = UIListLayout
    }
    
    if not CurrentTab then
        Container.Visible = true
        Button.Underline.BackgroundTransparency = 0
        Button.Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        CurrentTab = Name
    end
    
    return Container
end

-- ============================================================
-- СОЗДАНИЕ КАТЕГОРИЙ
-- ============================================================

local function CreateCategory(Parent, Name)
    local Frame = Instance.new("Frame")
    Frame.Parent = Parent
    Frame.Size = UDim2.new(1, -12, 0, 32)
    Frame.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
    Frame.BackgroundTransparency = 1
    Frame.BorderSizePixel = 0
    
    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.Position = UDim2.new(0, 8, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Font = Enum.Font.GothamBold
    Label.Text = Name
    Label.TextColor3 = Color3.fromRGB(78, 127, 252)
    Label.TextSize = 16
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    local Line = Instance.new("Frame")
    Line.Parent = Frame
    Line.Position = UDim2.new(0, 0, 1, -1)
    Line.Size = UDim2.new(1, 0, 0, 1)
    Line.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
    Line.BackgroundTransparency = 0.5
    
    return Frame
end

local function CreateSubCategory(Parent, Name)
    local Frame = Instance.new("Frame")
    Frame.Parent = Parent
    Frame.Size = UDim2.new(1, 0, 0, 28)
    Frame.BackgroundTransparency = 1
    Frame.BorderSizePixel = 0
    
    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.Size = UDim2.new(1, -16, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Font = Enum.Font.GothamSemibold
    Label.Text = Name
    Label.TextColor3 = Color3.fromRGB(200, 200, 210)
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    return Frame
end

local function CreateToggle(Parent, Name, Default)
    local Frame = Instance.new("Frame")
    Frame.Parent = Parent
    Frame.Size = UDim2.new(1, -12, 0, 26)
    Frame.BackgroundTransparency = 1
    Frame.BorderSizePixel = 0
    
    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.Size = UDim2.new(1, -50, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Font = Enum.Font.Gotham
    Label.Text = Name
    Label.TextColor3 = Color3.fromRGB(160, 160, 170)
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    local ToggleBtn = Instance.new("ImageButton")
    ToggleBtn.Parent = Frame
    ToggleBtn.AnchorPoint = Vector2.new(1, 0.5)
    ToggleBtn.Position = UDim2.new(1, -8, 0.5, 0)
    ToggleBtn.Size = UDim2.new(0, 32, 0, 18)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 42, 50)
    ToggleBtn.BackgroundTransparency = 0
    ToggleBtn.BorderSizePixel = 0
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleBtn
    
    local Knob = Instance.new("Frame")
    Knob.Parent = ToggleBtn
    Knob.Position = UDim2.new(0, 2, 0.5, -6)
    Knob.Size = UDim2.new(0, 12, 0, 12)
    Knob.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
    Knob.BorderSizePixel = 0
    
    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob
    
    local State = false
    
    local function UpdateToggle()
        if State then
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(78, 127, 252)
            Knob.Position = UDim2.new(1, -14, 0.5, -6)
            Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 42, 50)
            Knob.Position = UDim2.new(0, 2, 0.5, -6)
            Knob.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
        end
    end
    
    UpdateToggle()
    
    ToggleBtn.MouseButton1Click:Connect(function()
        State = not State
        UpdateToggle()
    end)
    
    return Frame
end

local function CreateButton(Parent, Name)
    local Frame = Instance.new("Frame")
    Frame.Parent = Parent
    Frame.Size = UDim2.new(0.48, -8, 0, 28)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
    Frame.BorderSizePixel = 0
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 4)
    ButtonCorner.Parent = Frame
    
    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Font = Enum.Font.GothamSemibold
    Label.Text = Name
    Label.TextColor3 = Color3.fromRGB(200, 200, 210)
    Label.TextSize = 12
    
    local Button = Instance.new("ImageButton")
    Button.Parent = Frame
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.BackgroundTransparency = 1
    
    Button.MouseEnter:Connect(function()
        Frame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
    end)
    Button.MouseLeave:Connect(function()
        Frame.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
    end)
    
    return Frame
end

local function CreateDropdown(Parent, Name, Options)
    local Frame = Instance.new("Frame")
    Frame.Parent = Parent
    Frame.Size = UDim2.new(1, -12, 0, 28)
    Frame.BackgroundTransparency = 1
    Frame.BorderSizePixel = 0
    
    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.Size = UDim2.new(0.4, -8, 1, 0)
    Label.Position = UDim2.new(0, 8, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Font = Enum.Font.Gotham
    Label.Text = Name
    Label.TextColor3 = Color3.fromRGB(160, 160, 170)
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    local DropBtn = Instance.new("Frame")
    DropBtn.Parent = Frame
    DropBtn.AnchorPoint = Vector2.new(1, 0.5)
    DropBtn.Position = UDim2.new(1, -4, 0.5, 0)
    DropBtn.Size = UDim2.new(0.5, -8, 1, 0)
    DropBtn.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
    DropBtn.BorderSizePixel = 0
    
    local DropCorner = Instance.new("UICorner")
    DropCorner.CornerRadius = UDim.new(0, 4)
    DropCorner.Parent = DropBtn
    
    local DropLabel = Instance.new("TextLabel")
    DropLabel.Parent = DropBtn
    DropLabel.Size = UDim2.new(1, -20, 1, 0)
    DropLabel.Position = UDim2.new(0, 8, 0, 0)
    DropLabel.BackgroundTransparency = 1
    DropLabel.Font = Enum.Font.Gotham
    DropLabel.Text = Options[1] or "Select"
    DropLabel.TextColor3 = Color3.fromRGB(200, 200, 210)
    DropLabel.TextSize = 12
    DropLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    return Frame
end

local function CreateSlider(Parent, Name, Min, Max, Default)
    local Frame = Instance.new("Frame")
    Frame.Parent = Parent
    Frame.Size = UDim2.new(1, -12, 0, 28)
    Frame.BackgroundTransparency = 1
    Frame.BorderSizePixel = 0
    
    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.Size = UDim2.new(0.35, -8, 1, 0)
    Label.Position = UDim2.new(0, 8, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Font = Enum.Font.Gotham
    Label.Text = Name
    Label.TextColor3 = Color3.fromRGB(160, 160, 170)
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Parent = Frame
    ValueLabel.AnchorPoint = Vector2.new(1, 0.5)
    ValueLabel.Position = UDim2.new(1, -4, 0.5, 0)
    ValueLabel.Size = UDim2.new(0, 30, 1, 0)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Font = Enum.Font.Gotham
    ValueLabel.Text = tostring(Default)
    ValueLabel.TextColor3 = Color3.fromRGB(200, 200, 210)
    ValueLabel.TextSize = 12
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    return Frame
end

-- ============================================================
-- СОЗДАНИЕ ВКЛАДОК И КАТЕГОРИЙ
-- ============================================================

-- ===== VISUALS =====
local VisualsTab = CreateTab("Visuals", "")

local VisualsCat = CreateCategory(VisualsTab, "Visuals")
local VisualsSub = CreateSubCategory(VisualsTab, "Hat & Trail")
CreateToggle(VisualsTab, "Chinese Hat", false)
CreateToggle(VisualsTab, "Rainbow Hat", false)
CreateSlider(VisualsTab, "Hat Transparency", 0, 1, 0.3)

CreateSubCategory(VisualsTab, "Trail")
CreateToggle(VisualsTab, "Trail", false)
CreateToggle(VisualsTab, "Rainbow Trail", false)
CreateSlider(VisualsTab, "Trail Lifetime", 0.1, 3, 0.5)

CreateSubCategory(VisualsTab, "Aura & ForceField")
CreateToggle(VisualsTab, "ForceField", false)
CreateToggle(VisualsTab, "Rainbow ForceField", false)
CreateToggle(VisualsTab, "Local Aura", false)

CreateSubCategory(VisualsTab, "World")
CreateToggle(VisualsTab, "Custom Skybox", false)
CreateToggle(VisualsTab, "Full Bright", false)
CreateToggle(VisualsTab, "Time Changer", false)
CreateSlider(VisualsTab, "Time", 0, 24, 12)

CreateSubCategory(VisualsTab, "ESP")
CreateToggle(VisualsTab, "ESP Outline", false)
CreateToggle(VisualsTab, "ESP Names", false)
CreateToggle(VisualsTab, "ESP Avatar", false)
CreateSlider(VisualsTab, "Avatar Size", 40, 120, 72)

CreateSubCategory(VisualsTab, "Screen Effects")
CreateToggle(VisualsTab, "Screen Effect", false)
CreateToggle(VisualsTab, "Anime Image", false)

-- ===== COMBAT =====
local CombatTab = CreateTab("Combat", "")

CreateCategory(CombatTab, "Combat")

CreateSubCategory(CombatTab, "Aim")
CreateToggle(CombatTab, "Silent Aim", false)
CreateToggle(CombatTab, "Silent Aim V2", false)
CreateSlider(CombatTab, "Silent Aim Range", 5, 200, 50)

CreateSubCategory(CombatTab, "Grab")
CreateToggle(CombatTab, "Further Reach", false)
CreateToggle(CombatTab, "Fire Grab", false)
CreateToggle(CombatTab, "Poison Grab", false)
CreateToggle(CombatTab, "Death Grab", false)
CreateToggle(CombatTab, "Burn Grab", false)
CreateToggle(CombatTab, "Noclip Grab", false)
CreateToggle(CombatTab, "Massless Grab", false)

CreateSubCategory(CombatTab, "Auras")
CreateToggle(CombatTab, "Poison Aura", false)
CreateToggle(CombatTab, "Death Aura", false)
CreateToggle(CombatTab, "Burn Aura", false)
CreateToggle(CombatTab, "Fling Aura", false)
CreateToggle(CombatTab, "Anchor Aura", false)
CreateToggle(CombatTab, "Telekinesis Aura", false)
CreateSlider(CombatTab, "Aura Radius", 5, 50, 20)

CreateSubCategory(CombatTab, "Defense")
CreateToggle(CombatTab, "Anti-Grab", false)
CreateToggle(CombatTab, "Anti-Burn", false)
CreateToggle(CombatTab, "Anti-Explosion", false)
CreateToggle(CombatTab, "Anti-Void", false)
CreateToggle(CombatTab, "Anti-Kick", false)
CreateToggle(CombatTab, "Anti-Lag", false)
CreateToggle(CombatTab, "Anti-Blobman", false)
CreateToggle(CombatTab, "Anti-Barrier", false)

-- ===== MISC =====
local MiscTab = CreateTab("Misc", "")

CreateCategory(MiscTab, "Misc")

CreateSubCategory(MiscTab, "Player")
CreateToggle(MiscTab, "Second Person Camera", false)
CreateButton(MiscTab, "Ragdoll All")

CreateSubCategory(MiscTab, "Movement")
CreateToggle(MiscTab, "Walkspeed", false)
CreateSlider(MiscTab, "Speed", 1, 10, 5)
CreateToggle(MiscTab, "Infinite Jump", false)
CreateSlider(MiscTab, "Jump Power", 16, 500, 50)
CreateToggle(MiscTab, "Noclip", false)

CreateSubCategory(MiscTab, "Teleport")
CreateDropdown(MiscTab, "Place to Teleport", {"Spawn", "Green House", "Blue House", "Farm", "Mine"})
CreateButton(MiscTab, "Teleport")
CreateToggle(MiscTab, "Loop Teleport", false)

CreateSubCategory(MiscTab, "Utility")
CreateToggle(MiscTab, "Lag Server", false)
CreateButton(MiscTab, "Spawn Banana")
CreateButton(MiscTab, "Enable Graphics")
CreateButton(MiscTab, "Disable Graphics")
CreateButton(MiscTab, "Clear Effects")

CreateSubCategory(MiscTab, "Loop")
CreateToggle(MiscTab, "Loop Kill", false)
CreateToggle(MiscTab, "Loop Kick", false)
CreateToggle(MiscTab, "Loop Ragdoll", false)
CreateToggle(MiscTab, "Loop Fire", false)

CreateSubCategory(MiscTab, "Bring All")
CreateToggle(MiscTab, "Bring All", false)
CreateToggle(MiscTab, "Whitelist Friends", false)

-- ============================================================
-- ОБНОВЛЕНИЕ CANVAS SIZE
-- ============================================================

for _, tab in pairs(Tabs) do
    local function UpdateCanvas()
        local totalHeight = 0
        for _, child in ipairs(tab.Container:GetChildren()) do
            if child:IsA("Frame") then
                totalHeight = totalHeight + child.Size.Y.Offset + 4
            end
        end
        tab.Container.CanvasSize = UDim2.new(0, 0, 0, totalHeight + 20)
    end
    
    tab.Container.ChildAdded:Connect(UpdateCanvas)
    tab.Container.ChildRemoved:Connect(UpdateCanvas)
    task.delay(0.1, UpdateCanvas)
end

-- ============================================================
-- ДОБАВЛЕНИЕ КНОПКИ ВЫЗОВА
-- ============================================================

local OpenBtn = Instance.new("ImageButton")
OpenBtn.Parent = NeverLose.ScreenGui
OpenBtn.AnchorPoint = Vector2.new(0, 0.5)
OpenBtn.Position = UDim2.new(0, 0, 0.5, 0)
OpenBtn.Size = UDim2.new(0, 24, 0, 60)
OpenBtn.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
OpenBtn.BorderSizePixel = 0
OpenBtn.Image = "rbxassetid://10685272437"
OpenBtn.ImageColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.ImageTransparency = 0.3

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 4)
OpenCorner.Parent = OpenBtn

OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- ============================================================
-- ИНИЦИАЛИЗАЦИЯ
-- ============================================================

MainFrame.Visible = true

print("AI PAST HUB loaded!")
