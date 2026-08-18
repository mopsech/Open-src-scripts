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
-- ════════════════════════════════════════════════════════════════
-- 🔥 CRACKED BY MOPS 🔥
-- 💬 Discord: @mopsech
-- ✈️ Telegram: @idkmops
-- 
-- 📢 СКРИПТ СЛИТ В ПУБЛИЧНЫЙ ДОСТУП!
-- 🔗 ССЫЛКА НА КАНАЛ: https://discord.gg/3KjWyZ6uBu
-- 
-- ⭐ СПАСИБО ЗА ИСПОЛЬЗОВАНИЕ!


local t1 = {}
local t2 = {}
warn("[UNDETECTED] Loading launcher...")
t2.value1 = game:GetService("Players")
t2.value2 = game:GetService("UserInputService")
game:GetService("RunService")
t2.value3 = game:GetService("TweenService")
t2.value4 = game:GetService("HttpService")
t2.value5 = game:GetService("TeleportService")
t2.value6 = game:GetService("VirtualUser")
t2.value7 = game:GetService("CoreGui")
t2.value8 = nil
t2.value9 = "UNDETECTED_HUB/settings.json"
t2.value10 = "#AF1C1C"
t2.value11 = "Standard"
t2.value12 = {
	"Standard",
	"Dark",
	"Volcano",
	"Nebula"
}
local t3 = {
	AccentColor = "#9A2222",
	BackgroundColor = "#0F0F12",
	TextColor = "#F5F5F7"
}
local t4 = {
	AccentColor = "#1B1B1F",
	BackgroundColor = "#050505",
	TextColor = "#F1F1F1"
}
local t5 = {
	AccentColor = "#FF6B1A",
	BackgroundColor = "#1A0C07",
	TextColor = "#FFE8D6"
}
t2.value13 = {
	Standard = t3,
	Dark = t4,
	Volcano = t5,
	Nebula = {
		AccentColor = "#6E5BFF",
		BackgroundColor = "#0D1020",
		TextColor = "#ECE9FF"
	}
}
local value11 = t2.value11
local AccentColor = t2.value13[t2.value11].AccentColor
local BackgroundColor = t2.value13[t2.value11].BackgroundColor
local TextColor = t2.value13[t2.value11].TextColor
t2.value14 = {
	ToggleKey = "LeftAlt",
	AntiAFK = false,
	KeyLogger = false,
	TriggerLogger = false,
	ThemePreset = value11,
	AccentColor = AccentColor,
	BackgroundColor = BackgroundColor,
	TextColor = TextColor,
	PanelPositions = {},
	AutoExecute = {}
}
t2.value15 = {}
for k, v in pairs(t2.value14) do
    t2.value15[k] = v
end
function t2.value16(p1)
    local v27 = p1:gsub("#", "")

    if #v27 == 6 then
        local sub = v27.sub
        local v29 = tonumber(sub(v27, 1, 2), 16) or 255
        local sub2 = v27.sub
        local v31 = tonumber(sub2(v27, 3, 4), 16) or 255
        local sub3 = v27.sub
        local v33 = tonumber(sub3(v27, 5, 6), 16) or 255

        return Color3.fromRGB(v29, v31, v33)
    end

    return Color3.fromRGB(154, 34, 34)
end
function t2.value17(p2, p3)
    if type(p2) ~= "string" or p2 == "" then
        return p3
    end

    if not p2:match("^#") then
        p2 = "#" .. p2
    end

    if p2:match("^#%x%x%x%x%x%x$") then
        return p2:upper()
    end

    return p3
end
function t2.value18(p4)
    return t2.value13[p4] or t2.value13[t2.value11]
end
function t2.value19(p5, p6, p7)
    local v40 = t2.value17(p5, t2.value14.AccentColor)
    local v41 = t2.value17(p6, t2.value14.BackgroundColor)
    local v42 = t2.value17(p7, t2.value14.TextColor)

    for _, v in ipairs(t2.value12) do
        local v45 = t2.value13[v]

        if v45 then
            local v46 = v40 == v45.AccentColor

            if v46 then
                v46 = v41 == v45.BackgroundColor and v42 == v45.TextColor
            end

            v45 = v46
        end

        if v45 then
            return v
        end
    end
end;
(function()
    if readfile then
        pcall(function()
            local v379 = readfile(t2.value9)

            if v379 then
                local data = t2.value4:JSONDecode(v379)

                if type(data) == "table" then
                    for k, v in pairs(data) do
                        t2.value15[k] = v
                    end
                end
            end
        end)
    end
end)()
if not t2.value15.AutoExecute then
    t1.value1 = t2.value15
    t1.value1.AutoExecute = {}
end;
(function()
    local v47 = false
    local v48 = t2.value18(t2.value11)

    if type(t2.value15.PanelPositions) ~= "table" then
        t2.value15.PanelPositions = {}
        v47 = true
    end

    local v49 = t2.value17(t2.value15.AccentColor, v48.AccentColor)

    if v49 == t2.value10 then
        v49 = v48.AccentColor
    end

    local v50 = t2.value17(t2.value15.BackgroundColor, v48.BackgroundColor)
    local v51 = t2.value17(t2.value15.TextColor, v48.TextColor)

    if v49 ~= t2.value15.AccentColor then
        t2.value15.AccentColor = v49
        v47 = true
    end

    if v50 ~= t2.value15.BackgroundColor then
        t2.value15.BackgroundColor = v50
        v47 = true
    end

    if v51 ~= t2.value15.TextColor then
        t2.value15.TextColor = v51
        v47 = true
    end

    local v52 = t2.value19(t2.value15.AccentColor, t2.value15.BackgroundColor, t2.value15.TextColor)
    local ThemePreset = t2.value15.ThemePreset

    if type(ThemePreset) ~= "string" or ThemePreset == "" then
        ThemePreset = v52 or t2.value11
    elseif ThemePreset ~= "Custom" and not t2.value13[ThemePreset] then
        ThemePreset = v52 or t2.value11
    elseif ThemePreset ~= "Custom" and v52 ~= ThemePreset then
        ThemePreset = v52 or "Custom"
    elseif ThemePreset == "Custom" and v52 then
        ThemePreset = v52
    end

    if ThemePreset ~= t2.value15.ThemePreset then
        t2.value15.ThemePreset = ThemePreset
        v47 = true
    end

    if v47 and (makefolder and writefile) then
        pcall(function()
            if isfolder and not isfolder(t2.value8) then
                makefolder(t2.value8)
            elseif not isfolder then
                makefolder(t2.value8)
            end

            writefile(t2.value9, t2.value4:JSONEncode(t2.value15))
        end)
    end
end)()
function t2.value20(p8)
    return string.format("#%02X%02X%02X", p8.R * 255, p8.G * 255, p8.B * 255)
end
t2.value21 = t2.value16(t2.value15.AccentColor)
t2.value22 = t2.value16(t2.value15.BackgroundColor)
t2.value23 = t2.value16(t2.value15.TextColor)
t2.value24 = Color3.fromRGB(28, 28, 33)
t2.value25 = Color3.fromRGB(45, 45, 52)
t2.value26 = Color3.fromRGB(200, 200, 210)
t2.value27 = Color3.fromRGB(150, 150, 158)

function t2.value28(p9, p10, p11)
    return Color3.new(p9.R + (p10.R - p9.R) * p11, p9.G + (p10.G - p9.G) * p11, p9.B + (p10.B - p9.B) * p11)
end
function t2.value29(p12, p13)
    local function v60(p14)
        return (math.clamp(math.floor(p14 * 255 + p13 + 0.5), 0, 255))
    end

    return Color3.fromRGB(v60(p12.R), v60(p12.G), v60(p12.B))
end
function t2.value30()
    t2.value21 = t2.value16(t2.value15.AccentColor)
    t2.value22 = t2.value16(t2.value15.BackgroundColor)
    t2.value23 = t2.value16(t2.value15.TextColor)
    t2.value24 = t2.value29(t2.value22, 14)
    t2.value25 = t2.value29(t2.value22, 24)
    t2.value26 = t2.value28(t2.value23, t2.value22, 0.3)
    t2.value27 = t2.value28(t2.value23, t2.value22, 0.5)
end
t2.value30()
t2.value31 = nil
function t2.value31(p15)
    if type(p15) ~= "table" then
        return nil
    end

    local v62 = type(p15.XScale) ~= "number"

    if not v62 then
        v62 = type(p15.XOffset) ~= "number"

        if not v62 then
            v62 = type(p15.YScale) ~= "number"

            if not v62 then
                v62 = type(p15.YOffset) ~= "number"
            end
        end
    end

    if v62 then
        return nil
    end

    return UDim2.new(p15.XScale, p15.XOffset, p15.YScale, p15.YOffset)
end
function t2.value32(p16)
    if type(t2.value15.PanelPositions) ~= "table" then
        t2.value15.PanelPositions = {}
    end

    return t2.value31(t2.value15.PanelPositions[p16])
end
function t2.value33(p17, p18)
    if type(t2.value15.PanelPositions) ~= "table" then
        t2.value15.PanelPositions = {}
    end

    local PanelPositions = t2.value15.PanelPositions
    local XScale = p18.X.Scale
    local XOffset = p18.X.Offset
    local YScale = p18.Y.Scale
    local YOffset = p18.Y.Offset

    PanelPositions[p17] = {
		XScale = XScale,
		XOffset = XOffset,
		YScale = YScale,
		YOffset = YOffset
	}

    if makefolder and writefile then
        pcall(function()
            if isfolder and not isfolder(t2.value8) then
                makefolder(t2.value8)
            elseif not isfolder then
                makefolder(t2.value8)
            end

            writefile(t2.value9, t2.value4:JSONEncode(t2.value15))
        end)
    end
end
t2.value34 = {}
task.spawn(function()
    while true do
        task.wait(0.2)

        if t2.value15.ViewObjects then
            local Character = t2.value1.LocalPlayer.Character
            local v78 = Character and Character:FindFirstChild("HumanoidRootPart")

            if v78 then
                local ok, result = pcall(function()
                    return workspace:GetPartBoundsInRadius(v78.Position, 30)
                end)

                if ok and result then
                    local t6 = {}
                    for v84, v85 in ipairs(result) do

                        local v86 = v85:IsA("BasePart")

                        if v86 then
                            v86 = Character ~= v85.Parent

                            if v86 then
                                v86 = Character ~= v85.Parent.Parent
                            end
                        end

                        if v86 then
                            t6[v85] = true

                            if not t2.value34[v85] then
                                local BillboardGui = Instance.new("BillboardGui")

                                BillboardGui.Name = "ObjESP"
                                BillboardGui.Size = UDim2.new(0, 100, 0, 20)
                                BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
                                BillboardGui.AlwaysOnTop = true
                                BillboardGui.MaxDistance = 30

                                local TextLabel = Instance.new("TextLabel")

                                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                                TextLabel.BackgroundTransparency = 1
                                TextLabel.Text = v85.Name
                                TextLabel.TextColor3 = Color3.new(1, 1, 1)
                                TextLabel.TextStrokeTransparency = 0
                                TextLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                                TextLabel.TextSize = 14
                                TextLabel.Font = Enum.Font.GothamMedium
                                TextLabel.Parent = BillboardGui
                                BillboardGui.Parent = v85
                                t2.value34[v85] = BillboardGui
                            end
                        end
                    end
                    for k, v in pairs(t2.value34) do
                        local v91 = k

                        if not t6[v91] or not v91.Parent then
                            v:Destroy()
                            t2.value34[v91] = nil
                        end
                    end
                end
            end
        elseif next(t2.value34) then
            for _, v in pairs(t2.value34) do
                v:Destroy()
            end

            table.clear(t2.value34)
        end
    end
end)
t2.value1.LocalPlayer.Idled:Connect(function()
    if t2.value15.AntiAFK then
        t2.value6:CaptureController()
        t2.value6:ClickButton2(Vector2.new(0, 0))
    end
end)
t2.value35 = nil
if gethui then
    t2.value35 = gethui()
else
    t1.value3 = syn

    local value3 = t1.value3

    if t1.value3 then
        value3 = syn.protect_gui
    end

    if value3 then
        t1.value2 = Instance.new("ScreenGui")
        syn.protect_gui(t1.value2)
        t1.value4 = game:GetService("CoreGui")
        t1.value2.Parent = t1.value4
        t2.value35 = t1.value2
    else
        t2.value35 = game:GetService("CoreGui")
    end
end
t1.value4 = Instance.new("ScreenGui")
t1.value2 = "Name"
t1.value4[t1.value2] = "UNDETECTED_Notifications"
t1.value2 = "ResetOnSpawn"
t1.value4[t1.value2] = false
t1.value2 = "DisplayOrder"
t1.value4[t1.value2] = 9999
t1.value2 = "Parent"
t1.value4[t1.value2] = t2.value35
t2.value36 = Instance.new("Frame")
t2.value36.Size = UDim2.new(0, 300, 1, -20)
t2.value36.Position = UDim2.new(1, -320, 0, 20)
t2.value36.BackgroundTransparency = 1
t2.value36.Parent = t1.value4
local UIListLayout = Instance.new("UIListLayout")

UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
UIListLayout.Parent = t2.value36
local function v14(p19)
    local v95 = p19.Title or "Notification"
    local v96 = p19.Text or ""
    local v97 = p19.Duration or 5
    local Frame = Instance.new("Frame")

    Frame.Size = UDim2.new(0, 280, 0, 0)
    Frame.AutomaticSize = Enum.AutomaticSize.Y
    Frame.BackgroundColor3 = t2.value24
    Frame.BorderSizePixel = 0
    Frame.ClipsDescendants = false
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

    local UIStroke = Instance.new("UIStroke")

    UIStroke.Color = t2.value21
    UIStroke.Thickness = 4
    UIStroke.Transparency = 0
    UIStroke.Parent = Frame

    local UIPadding = Instance.new("UIPadding")

    UIPadding.PaddingTop = UDim.new(0, 10)
    UIPadding.PaddingBottom = UDim.new(0, 12)
    UIPadding.PaddingLeft = UDim.new(0, 12)
    UIPadding.PaddingRight = UDim.new(0, 12)
    UIPadding.Parent = Frame

    local UIListLayout2 = Instance.new("UIListLayout")

    UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout2.Padding = UDim.new(0, 4)
    UIListLayout2.Parent = Frame

    local TextLabel = Instance.new("TextLabel")

    TextLabel.LayoutOrder = 1
    TextLabel.Size = UDim2.new(1, 0, 0, 0)
    TextLabel.AutomaticSize = Enum.AutomaticSize.Y
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = v95
    TextLabel.TextColor3 = t2.value23
    TextLabel.TextSize = 14
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.TextWrapped = true
    TextLabel.Parent = Frame

    local TextLabel2 = Instance.new("TextLabel")

    TextLabel2.LayoutOrder = 2
    TextLabel2.Size = UDim2.new(1, 0, 0, 0)
    TextLabel2.AutomaticSize = Enum.AutomaticSize.Y
    TextLabel2.BackgroundTransparency = 1
    TextLabel2.Text = v96
    TextLabel2.TextColor3 = t2.value26
    TextLabel2.TextSize = 12
    TextLabel2.Font = Enum.Font.GothamMedium
    TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel2.TextWrapped = true
    TextLabel2.Parent = Frame
    Frame.Parent = t2.value36

    local uDim2 = UDim2.new(1, 320, 0, 0)
    local uDim2_2 = UDim2.new(0, 0, 0, 0)

    Frame.Position = uDim2
    t2.value3:Create(Frame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = uDim2_2
	}):Play()
    t2.value3:Create(UIStroke, TweenInfo.new(v97, Enum.EasingStyle.Linear), {
		Transparency = 1
	}):Play()
    task.spawn(function()
        task.wait(v97)

        local v384 = t2.value3:Create(Frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Position = uDim2
		})

        v384:Play()
        v384.Completed:Wait()
        Frame:Destroy()
    end)
end
t2.value37 = Instance.new("ScreenGui")
t2.value37.Name = "ScriptHub"
t2.value37.ResetOnSpawn = false
t2.value37.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
t2.value37.IgnoreGuiInset = true
t2.value37.Parent = t2.value35
t2.value38 = {
	{
		label = "UD",
		title = "UNDETECTED Universal ~ crack ",
		menuName = "UNDETECTED",
		version = "v4",
		url = "https://diser.me/undetected.lua",
		gameId = "universal"
	},
	{
		label = "V2",
		title = "EUGENE V2 ~ rscripts.net/@1337",
		menuName = "EUGENE V2",
		version = "v2",
		url = "https://diser.me/raw/v2.lua",
		gameId = "universal"
	},
	{
		label = "V3",
		title = "EUGENE V3 ~ rscripts.net/@1337",
		menuName = "EUGENE V3",
		version = "v3",
		url = "https://diser.me/raw/v3.lua",
		gameId = "universal"
	},
	{
		label = "MM2",
		title = "1337 MM2 ~ rscripts.net/@1337",
		menuName = "1337 MM2",
		version = "v2",
		url = "https://diser.me/raw/mm2.lua",
		gameId = "142823291"
	},
	{
		label = "BAN",
		title = "Ban or get Banned ~ rscripts.net/@1337",
		menuName = "UD Ban or get Banned",
		version = "v1",
		url = "https://diser.me/raw/ban.lua",
		gameId = "96017656548489"
	},
	{
		label = "AOD",
		title = "Answer or Die ~ rscripts.net/@1337",
		menuName = "UD Answer or Die",
		version = "v1",
		url = "https://diser.me/raw/aod.lua",
		gameId = "11966456877"
	},
	{
		label = "MISC",
		title = "UNDETECTED",
		isSettings = true,
		gameId = "universal"
	}
};
(function()
    local UndetectedLoading = t2.value7:FindFirstChild("UndetectedLoading")

    if UndetectedLoading then
        UndetectedLoading:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")

    ScreenGui.Name = "UndetectedLoading"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.DisplayOrder = 1001
    ScreenGui.Parent = t2.value35

    local TextLabel = Instance.new("TextLabel")

    TextLabel.Size = UDim2.new(0, 360, 0, 20)
    TextLabel.Position = UDim2.new(0.5, -180, 0.5, -28)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = "Loading scripts..."
    TextLabel.TextColor3 = t2.value23
    TextLabel.Font = Enum.Font.GothamMedium
    TextLabel.TextSize = 14
    TextLabel.TextXAlignment = Enum.TextXAlignment.Center
    TextLabel.Parent = ScreenGui

    local Frame = Instance.new("Frame")

    Frame.Size = UDim2.new(0, 360, 0, 8)
    Frame.Position = UDim2.new(0.5, -180, 0.5, 0)
    Frame.BackgroundColor3 = t2.value24
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(1, 0)

    local Frame2 = Instance.new("Frame")

    Frame2.Size = UDim2.new(0, 0, 1, 0)
    Frame2.BackgroundColor3 = t2.value21
    Frame2.BorderSizePixel = 0
    Frame2.Parent = Frame
    Instance.new("UICorner", Frame2).CornerRadius = UDim.new(1, 0)
    task.spawn(function()
        pcall(function()
            game:GetService("ContentProvider"):PreloadAsync({
				"rbxassetid://10734966248",
				"rbxassetid://10747384394"
			})
        end)
    end)

    for i = 1, 10 do
        local v140 = i / 10

        t2.value3:Create(Frame2, TweenInfo.new(0.15), {
			Size = UDim2.new(v140, 0, 1, 0)
		}):Play()
        task.wait(0.15)
    end

    task.wait(0.2)
    ScreenGui:Destroy()
    task.spawn(function()
        local str = tostring(game.PlaceId)
        local str2 = tostring(game.GameId)

        for _, v in ipairs(t2.value38) do
            local v417 = v
            local v418 = not v417.isSettings

            if v418 then
                v418 = t2.value15.AutoExecute[v417.menuName]
            end

            if v418 then
                local v419 = string.gsub(tostring(v417.gameId or "universal"), "%s+", "")
                local v420 = v419 == "universal"

                if not v420 then
                    v420 = v419 == str or v419 == str2
                end

                if v420 then
                    pcall(function()
                        loadstring(game:HttpGet(v417.url))()
                    end)
                end
            end
        end
    end)
end)()
t2.value39 = Instance.new("CanvasGroup")
t2.value39.Size = UDim2.new(1, 0, 1, 0)
t2.value39.BackgroundTransparency = 1
t2.value39.GroupTransparency = 0
t2.value39.Parent = t2.value37
local Frame = Instance.new("Frame")

Frame.Size = UDim2.new(0, 0, 0, 0)
Frame.Position = UDim2.new(0.5, 0, 0, 60)
Frame.BackgroundTransparency = 1
Frame.ClipsDescendants = false
Frame.Name = "Container"
Frame.Parent = t2.value39
local Frame3 = Instance.new("Frame")

Frame3.AnchorPoint = Vector2.new(0.5, 0)
Frame3.Size = UDim2.new(0, 0, 0, 40)
Frame3.AutomaticSize = Enum.AutomaticSize.X
Frame3.Position = UDim2.new(0.5, 0, 0, 0)
Frame3.BackgroundTransparency = 1
Frame3.Name = "TabBar"
Frame3.Parent = Frame
local UIListLayout3 = Instance.new("UIListLayout")

UIListLayout3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout3.Padding = UDim.new(0, 6)
UIListLayout3.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout3.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout3.Parent = Frame3
t2.value40 = Instance.new("Frame")
t2.value40.AnchorPoint = Vector2.new(0.5, 0)
t2.value40.Size = UDim2.new(0, 370, 0, 0)
t2.value40.Position = UDim2.new(0.5, 0, 0, 46)
t2.value40.BackgroundTransparency = 1
t2.value40.ClipsDescendants = false
t2.value40.Name = "PanelHolder"
t2.value40.Parent = Frame
function t2.value41(p20, p21, p22)
    local u144 = false
    local inputPosition
    local p21Position
    local u147 = false
    p20.InputBegan:Connect(function(input)
        local v422 = input.UserInputType == Enum.UserInputType.MouseButton1

        if not v422 then
            v422 = input.UserInputType == Enum.UserInputType.Touch
        end

        if v422 then
            u144 = true
            inputPosition = input.Position
            p21Position = p21.Position
            u147 = false
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    u144 = false

                    if u147 and p22 then
                        task.delay(0.1, function()
                            local v577 = p21

                            if v577 then
                                v577 = p21.Parent
                            end

                            if v577 then
                                p22(p21.Position)
                            end
                        end)
                    end
                end
            end)
        end
    end)
    t2.value2.InputChanged:Connect(function(input)
        local v424 = input.UserInputType == Enum.UserInputType.MouseMovement

        if not v424 then
            v424 = input.UserInputType == Enum.UserInputType.Touch
        end

        if v424 and u144 then
            local v425 = input.Position - inputPosition
            local uDim2 = UDim2.new(p21Position.X.Scale, p21Position.X.Offset + v425.X, p21Position.Y.Scale, p21Position.Y.Offset + v425.Y)

            t2.value3:Create(p21, TweenInfo.new(0.1), {
				Position = uDim2
			}):Play()
        end
    end)
end
t2.value42 = {}
t2.value43 = nil
t2.value44 = {}
t2.value45 = nil
t2.value46 = nil
t2.value47 = TweenInfo.new(0.24, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

function t2.value48(p23)
    return UDim2.new(p23.X.Scale, p23.X.Offset, p23.Y.Scale, 2)
end
t2.value49 = nil
function t2.value49(p24, _)
    return p24
end
function t2.value50(p26, p27, p28)
    p26.BackgroundTransparency = 0.3
    p26.Position = t2.value49(p28, p27)
    p26.Size = t2.value48(p27)
    t2.value3:Create(p26, t2.value47, {
		BackgroundTransparency = 0.15,
		Position = p28,
		Size = p27
	}):Play()
end
function t2.value51(p29)
    if not p29 or not p29.Parent then
        return
    end

    local p29Size = p29.Size
    local value3 = t2.value3
    local value47 = t2.value47
    local v170 = t2.value49(p29.Position, p29Size)
    local v171 = t2.value48(p29Size)
    local v172 = value3:Create(p29, value47, {
		BackgroundTransparency = 0.3,
		Position = v170,
		Size = v171
	})

    v172:Play()
    v172.Completed:Wait()
end
function t2.value52(p30, p31)
    if p30.isSettings then
        return "Settings"
    end

    return p30.menuName or "Tab_" .. tostring(p31)
end
function t2.value53()
    local v156 = not t2.value43 and 0 or 1

    for _ in pairs(t2.value42) do
        v156 += 1
    end

    return v156
end
local function v18(p32, p33)
    local v190 = t2.value42[p32]

    if not v190 then
        return
    end

    local tab = v190.tab

    if tab then
        tab = v190.tab.isSettings and t2.value45
    end

    if tab then
        t2.value45:Disconnect()
        t2.value45 = nil
    end

    t2.value42[p32] = nil

    local panel = v190.panel

    if v190.storageKey and panel then
        t2.value33(v190.storageKey, panel.Position)
    end

    if panel and not p33 then
        t2.value51(panel)
    end

    if panel and panel.Parent then
        panel:Destroy()
    end

    t2.value46()
end
function t2.value54(p34, p35)
    local v178 = t2.value44[p34]

    if not v178 then
        return
    end

    local v179 = t2.value42[p34] ~= nil
    local v180 = v178:GetAttribute("Hovered") == true
    local uDim2 = UDim2.new(0, 52, 0, 36)
    local value24 = t2.value24
    local value26 = t2.value26
    local n1 = 0.15

    if v179 then
        uDim2 = UDim2.new(0, 56, 0, 38)
        value24 = t2.value21
        n1 = 0.05
        value26 = t2.value23
    elseif v180 then
        uDim2 = UDim2.new(0, 54, 0, 37)
        value24 = t2.value25
        value26 = t2.value23
        n1 = 0.1
    end

    if p35 then
        v178.Size = uDim2
        v178.BackgroundColor3 = value24
        v178.TextColor3 = value26
        v178.BackgroundTransparency = n1

        return
    end

    t2.value3:Create(v178, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = uDim2,
		BackgroundColor3 = value24,
		TextColor3 = value26,
		BackgroundTransparency = n1
	}):Play()
end
function t2.value46(p36)
    for i = 1, #t2.value38 do
        t2.value54(i, p36)
    end
end
function t2.value55(p37, p38, p39, p40, p41, p42, p43)
    local TextLabel = Instance.new("TextLabel")

    TextLabel.Size = p39
    TextLabel.Position = p40
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = p38

    if not p41 then
        p41 = t2.value23
    end

    TextLabel.TextColor3 = p41
    TextLabel.TextSize = p42 or 13

    if p43 then
        p43 = Enum.Font.GothamMedium
    end

    if not p43 then
        p43 = Enum.Font.GothamMedium
    end

    TextLabel.Font = p43
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
    TextLabel.Parent = p37

    return TextLabel
end
function t2.value56(p44, p45, p46, p47)
    local Frame4 = Instance.new("Frame")

    Frame4.Size = UDim2.new(0, 240, 0, 290)
    Frame4.Position = UDim2.new(0.5, -120, 0.5, -145)
    Frame4.BackgroundColor3 = t2.value22
    Frame4.BorderSizePixel = 0
    Frame4.Parent = t2.value37
    Instance.new("UICorner", Frame4).CornerRadius = UDim.new(0, 7)

    local TextLabel = Instance.new("TextLabel")

    TextLabel.Size = UDim2.new(1, -20, 0, 30)
    TextLabel.Position = UDim2.new(0, 10, 0, 5)
    TextLabel.BackgroundTransparency = 1

    if not p47 then
        p47 = "COLOR PICKER"
    end

    TextLabel.Text = p47
    TextLabel.TextColor3 = t2.value23
    TextLabel.Font = Enum.Font.GothamMedium
    TextLabel.TextSize = 13
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Parent = Frame4

    local Frame5 = Instance.new("Frame")

    Frame5.Size = UDim2.new(1, -20, 0, 140)
    Frame5.Position = UDim2.new(0, 10, 0, 35)
    Frame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame5.Parent = Frame4
    Instance.new("UICorner", Frame5).CornerRadius = UDim.new(0, 5)

    local Frame6 = Instance.new("Frame")

    Frame6.Size = UDim2.new(1, 0, 1, 0)
    Frame6.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Frame6.Parent = Frame5
    Instance.new("UICorner", Frame6).CornerRadius = UDim.new(0, 5)

    local UIGradient = Instance.new("UIGradient")

    UIGradient.Color = ColorSequence.new(Color3.new(1, 1, 1))
    UIGradient.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(1, 0)
	})
    UIGradient.Parent = Frame6

    local Frame7 = Instance.new("Frame")

    Frame7.Size = UDim2.new(1, 0, 1, 0)
    Frame7.BackgroundColor3 = Color3.new(0, 0, 0)
    Frame7.BackgroundTransparency = 0
    Frame7.Parent = Frame5
    Instance.new("UICorner", Frame7).CornerRadius = UDim.new(0, 5)

    local UIGradient2 = Instance.new("UIGradient")

    UIGradient2.Color = ColorSequence.new(Color3.new(1, 1, 1))
    UIGradient2.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(1, 0)
	})
    UIGradient2.Rotation = 90
    UIGradient2.Parent = Frame7

    local Frame8 = Instance.new("Frame")

    Frame8.Size = UDim2.new(0, 12, 0, 12)
    Frame8.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame8.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame8.Parent = Frame7
    Instance.new("UICorner", Frame8).CornerRadius = UDim.new(1, 0)

    local Frame9 = Instance.new("Frame")

    Frame9.Size = UDim2.new(1, -4, 1, -4)
    Frame9.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame9.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame9.BackgroundColor3 = p44
    Frame9.Parent = Frame8
    Instance.new("UICorner", Frame9).CornerRadius = UDim.new(1, 0)

    local Frame10 = Instance.new("Frame")

    Frame10.Size = UDim2.new(1, -40, 0, 12)
    Frame10.Position = UDim2.new(0, 10, 0, 185)
    Frame10.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame10.Parent = Frame4
    Instance.new("UICorner", Frame10).CornerRadius = UDim.new(1, 0)

    local UIGradient3 = Instance.new("UIGradient")

    UIGradient3.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
		ColorSequenceKeypoint.new(0.167, Color3.new(1, 0, 1)),
		ColorSequenceKeypoint.new(0.333, Color3.new(0, 0, 1)),
		ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 1)),
		ColorSequenceKeypoint.new(0.667, Color3.new(0, 1, 0)),
		ColorSequenceKeypoint.new(0.833, Color3.new(1, 1, 0)),
		ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
	})
    UIGradient3.Parent = Frame10

    local Frame11 = Instance.new("Frame")

    Frame11.Size = UDim2.new(0, 16, 0, 16)
    Frame11.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame11.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame11.Parent = Frame10
    Instance.new("UICorner", Frame11).CornerRadius = UDim.new(1, 0)

    local TextBox = Instance.new("TextBox")

    TextBox.Size = UDim2.new(0, 160, 0, 24)
    TextBox.Position = UDim2.new(0, 10, 0, 215)
    TextBox.BackgroundColor3 = t2.value24
    TextBox.TextColor3 = t2.value23
    TextBox.Font = Enum.Font.GothamMedium
    TextBox.TextSize = 13
    TextBox.Text = t2.value20(p44)
    TextBox.Parent = Frame4
    Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 4)

    local Frame12 = Instance.new("Frame")

    Frame12.Size = UDim2.new(0, 24, 0, 24)
    Frame12.Position = UDim2.new(0, 175, 0, 215)
    Frame12.BackgroundColor3 = p44
    Frame12.Parent = Frame4
    Instance.new("UICorner", Frame12).CornerRadius = UDim.new(0, 4)

    local TextButton = Instance.new("TextButton")

    TextButton.Size = UDim2.new(1, -20, 0, 30)
    TextButton.Position = UDim2.new(0, 10, 0, 250)
    TextButton.BackgroundColor3 = t2.value24
    TextButton.TextColor3 = t2.value23
    TextButton.Text = "Confirm"
    TextButton.Font = Enum.Font.GothamMedium
    TextButton.TextSize = 14
    TextButton.Parent = Frame4
    Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 4)

    local v125, v126, v127 = Color3.toHSV(p44)
    local u128 = v125
    local u129 = v126
    local u130 = v127

    local function v131()
        local color3 = Color3.fromHSV(u128, u129, u130)

        Frame6.BackgroundColor3 = Color3.fromHSV(u128, 1, 1)
        Frame12.BackgroundColor3 = color3
        Frame9.BackgroundColor3 = color3
        TextBox.Text = t2.value20(color3)
        TextButton.BackgroundColor3 = color3
        Frame11.Position = UDim2.new(1 - u128, 0, 0.5, 0)
        Frame8.Position = UDim2.new(u129, 0, 1 - u130, 0)

        if p46 then
            p46(color3, t2.value20(color3))
        end
    end

    v131()

    local u132 = false
    local u133 = false

    Frame5.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            u132 = true

            local PositionX = input.Position.X
            local PositionY = input.Position.Y
            local AbsolutePosition = Frame5.AbsolutePosition
            local AbsoluteSize = Frame5.AbsoluteSize

            u129 = math.clamp((PositionX - AbsolutePosition.X) / AbsoluteSize.X, 0, 1)
            u130 = 1 - math.clamp((PositionY - AbsolutePosition.Y) / AbsoluteSize.Y, 0, 1)
            v131()
        end
    end)
    Frame10.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            u133 = true

            local PositionX = input.Position.X
            local AbsolutePosition = Frame10.AbsolutePosition
            local AbsoluteSize = Frame10.AbsoluteSize

            u128 = 1 - math.clamp((PositionX - AbsolutePosition.X) / AbsoluteSize.X, 0, 1)
            v131()
        end
    end)
    t2.value2.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            u132 = false
            u133 = false
        end
    end)
    t2.value2.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if u132 then
                local PositionX = input.Position.X
                local PositionY = input.Position.Y
                local AbsolutePosition = Frame5.AbsolutePosition
                local AbsoluteSize = Frame5.AbsoluteSize

                u129 = math.clamp((PositionX - AbsolutePosition.X) / AbsoluteSize.X, 0, 1)
                u130 = 1 - math.clamp((PositionY - AbsolutePosition.Y) / AbsoluteSize.Y, 0, 1)
                v131()

                return
            end

            if u133 then
                local PositionX = input.Position.X
                local AbsolutePosition = Frame10.AbsolutePosition
                local AbsoluteSize = Frame10.AbsoluteSize

                u128 = 1 - math.clamp((PositionX - AbsolutePosition.X) / AbsoluteSize.X, 0, 1)
                v131()
            end
        end
    end)
    TextBox.FocusLost:Connect(function()
        local TextBoxText = TextBox.Text

        if not TextBoxText:match("^#") then
            TextBoxText = "#" .. TextBoxText
        end

        local v405, v406, v407 = TextBoxText:match("#(%x%x)(%x%x)(%x%x)")

        if v405 and (v406 and v407) then
            local color3 = Color3.fromRGB(tonumber(v405, 16), tonumber(v406, 16), (tonumber(v407, 16)))
            local v409, v410, v411 = Color3.toHSV(color3)

            u128 = v409
            u129 = v410
            u130 = v411
            v131()

            return
        end

        TextBox.Text = t2.value20(Color3.fromHSV(u128, u129, u130))
    end)
    TextButton.MouseButton1Click:Connect(function()
        local color3 = Color3.fromHSV(u128, u129, u130)

        Frame4:Destroy()
        p45(color3, t2.value20(color3))
    end)
end
function t2.value57(p48, p49)
    if t2.value42[p49] then
        v18(p49, false)

        return
    end

    t2.value30()

    local v197 = if not p48.isSettings then UDim2.new(0, 370, 0, 102) else UDim2.new(0, 420, 0, 380)
    local v198 = t2.value52(p48, p49)
    local v199 = t2.value32(v198)

    if not v199 then
        local v200 = t2.value53()
        local _UDim2 = UDim2
        local v202 = v200 * 28

        v199 = _UDim2.new(0, v202, 0, v202)
    end

    local Frame13 = Instance.new("Frame")

    Frame13.Size = v197
    Frame13.Position = v199
    Frame13.BackgroundColor3 = t2.value22
    Frame13.BackgroundTransparency = 0.15
    Frame13.BorderSizePixel = 0
    Frame13.ClipsDescendants = true
    Frame13.Parent = t2.value40
    Instance.new("UICorner", Frame13).CornerRadius = UDim.new(0, 7)

    local Frame14 = Instance.new("Frame")

    Frame14.Size = UDim2.new(1, 0, 0, 34)
    Frame14.BackgroundColor3 = t2.value21
    Frame14.BackgroundTransparency = 0.15
    Frame14.BorderSizePixel = 0
    Frame14.Parent = Frame13
    Instance.new("UICorner", Frame14).CornerRadius = UDim.new(0, 7)

    local Frame15 = Instance.new("Frame")

    Frame15.Size = UDim2.new(1, 0, 0, 10)
    Frame15.Position = UDim2.new(0, 0, 1, -10)
    Frame15.BackgroundColor3 = t2.value21
    Frame15.BackgroundTransparency = 0.15
    Frame15.BorderSizePixel = 0
    Frame15.Parent = Frame14
    t2.value55(Frame14, p48.title, UDim2.new(1, -40, 1, 0), UDim2.new(0, 10, 0, 0), t2.value23, 13, true)
    t2.value41(Frame14, Frame13, function(p50)
        t2.value33(v198, p50)
    end)

    if not p48.isSettings then
        local ImageButton = Instance.new("ImageButton")

        ImageButton.Size = UDim2.new(0, 18, 0, 18)
        ImageButton.Position = UDim2.new(1, -62, 0, 8)
        ImageButton.BackgroundTransparency = 1
        ImageButton.Image = "rbxassetid://10734966248"

        local v207 = t2.value15.AutoExecute[p48.menuName]

        if v207 then
            v207 = Color3.fromRGB(255, 215, 0)
        end

        if not v207 then
            v207 = Color3.fromRGB(150, 150, 150)
        end

        ImageButton.ImageColor3 = v207
        ImageButton.Parent = Frame14
        ImageButton.MouseButton1Click:Connect(function()
            t2.value15.AutoExecute[p48.menuName] = not t2.value15.AutoExecute[p48.menuName]

            if makefolder and writefile then
                pcall(function()
                    if isfolder and not isfolder(t2.value8) then
                        makefolder(t2.value8)
                    elseif not isfolder then
                        makefolder(t2.value8)
                    end

                    writefile(t2.value9, t2.value4:JSONEncode(t2.value15))
                end)
            end

            local v428 = ImageButton
            local v429 = t2.value15.AutoExecute[p48.menuName]

            if v429 then
                v429 = Color3.fromRGB(255, 215, 0)
            end

            if not v429 then
                v429 = Color3.fromRGB(150, 150, 150)
            end

            v428.ImageColor3 = v429
        end)
    end

    local ImageButton = Instance.new("ImageButton")

    ImageButton.Size = UDim2.new(0, 18, 0, 18)
    ImageButton.Position = UDim2.new(1, -28, 0, 8)
    ImageButton.BackgroundTransparency = 1
    ImageButton.Image = "rbxassetid://10747384394"
    ImageButton.ImageColor3 = t2.value23
    ImageButton.Parent = Frame14
    ImageButton.MouseButton1Click:Connect(function()
        v18(p49, false)
    end)
    ImageButton.MouseEnter:Connect(function()
        t2.value3:Create(ImageButton, TweenInfo.new(0.2), {
			ImageColor3 = t2.value26
		}):Play()
    end)
    ImageButton.MouseLeave:Connect(function()
        t2.value3:Create(ImageButton, TweenInfo.new(0.2), {
			ImageColor3 = t2.value23
		}):Play()
    end)

    if p48.isSettings then
        local ScrollingFrame = Instance.new("ScrollingFrame")

        ScrollingFrame.Size = UDim2.new(1, 0, 1, -34)
        ScrollingFrame.Position = UDim2.new(0, 0, 0, 34)
        ScrollingFrame.BackgroundTransparency = 1
        ScrollingFrame.BorderSizePixel = 0
        ScrollingFrame.ScrollBarThickness = 0
        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 430)
        ScrollingFrame.Parent = Frame13
        ScrollingFrame.ScrollBarImageColor3 = t2.value21

        local t7 = {}
        local t8 = {}

        local function v212(p51, p52)
            local insert = table.insert
            local v433 = t8

            if not p52 then
                p52 = "muted"
            end

            insert(v433, {
				label = p51,
				tone = p52
			})

            return p51
        end
        local function v213(p53, p54, p55)
            return v212(t2.value55(p53, p55, UDim2.new(0.6, 0, 0, 30), UDim2.new(0, 12, 0, p54), t2.value26, 14, true), "muted")
        end
        local function v214(p56, p57, p58, p59)
            v213(p56, p57, p58)

            local TextButton = Instance.new("TextButton")

            TextButton.Size = UDim2.new(0, 42, 0, 22)
            TextButton.Position = UDim2.new(1, -62, 0, p57 + 4)
            TextButton.BackgroundColor3 = t2.value15[p59] and t2.value21 or t2.value24
            TextButton.Text = ""
            TextButton.AutoButtonColor = false
            TextButton.Parent = p56
            Instance.new("UICorner", TextButton).CornerRadius = UDim.new(1, 0)
            table.insert(t7, {
				button = TextButton,
				settingKey = p59
			})

            local Frame16 = Instance.new("Frame")

            Frame16.Size = UDim2.new(0, 16, 0, 16)

            local v443 = t2.value15[p59]

            if v443 then
                v443 = UDim2.new(1, -19, 0, 3)
            end

            if not v443 then
                v443 = UDim2.new(0, 3, 0, 3)
            end

            Frame16.Position = v443
            Frame16.BackgroundColor3 = t2.value23
            Frame16.BorderSizePixel = 0
            Frame16.Parent = TextButton
            Instance.new("UICorner", Frame16).CornerRadius = UDim.new(1, 0)
            t7[#t7].handle = Frame16
            TextButton.MouseButton1Click:Connect(function()
                local v533 = t2.value15[p59]

                t2.value15[p59] = not v533

                if makefolder and writefile then
                    pcall(function()
                        if isfolder and not isfolder(t2.value8) then
                            makefolder(t2.value8)
                        elseif not isfolder then
                            makefolder(t2.value8)
                        end

                        writefile(t2.value9, t2.value4:JSONEncode(t2.value15))
                    end)
                end

                if p59 == "KeyLogger" then
                    if t2.value15[p59] then
                        if _G.StartKeyLog then
                            _G.StartKeyLog()
                        end
                    elseif _G.ForceSaveKeyLog then
                        _G.ForceSaveKeyLog()
                    end
                end

                if p59 == "TriggerLogger" then
                    if t2.value15[p59] then
                        if _G.OpenTriggerLogger then
                            _G.OpenTriggerLogger()
                        end
                    elseif _G.CloseTriggerLogger then
                        _G.CloseTriggerLogger()
                    end
                end

                if t2.value15[p59] then
                    t2.value3:Create(Frame16, TweenInfo.new(0.2), {
						Position = UDim2.new(1, -19, 0, 3)
					}):Play()
                    t2.value3:Create(TextButton, TweenInfo.new(0.2), {
						BackgroundColor3 = t2.value21
					}):Play()

                    return
                end

                t2.value3:Create(Frame16, TweenInfo.new(0.2), {
					Position = UDim2.new(0, 3, 0, 3)
				}):Play()
                t2.value3:Create(TextButton, TweenInfo.new(0.2), {
					BackgroundColor3 = t2.value24
				}):Play()
            end)
        end

        v213(ScrollingFrame, 200, "Theme Preset:")

        local TextButton = Instance.new("TextButton")

        TextButton.Size = UDim2.new(0, 24, 0, 24)
        TextButton.Position = UDim2.new(1, -176, 0, 203)
        TextButton.BackgroundColor3 = t2.value24
        TextButton.BackgroundTransparency = 0.15
        TextButton.BorderSizePixel = 0
        TextButton.Text = "<"
        TextButton.TextColor3 = t2.value23
        TextButton.TextSize = 14
        TextButton.Font = Enum.Font.GothamBold
        TextButton.Parent = ScrollingFrame
        Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 5)

        local TextLabel = Instance.new("TextLabel")

        TextLabel.Size = UDim2.new(0, 118, 0, 24)
        TextLabel.Position = UDim2.new(1, -148, 0, 203)
        TextLabel.BackgroundColor3 = t2.value24
        TextLabel.BackgroundTransparency = 0.15
        TextLabel.BorderSizePixel = 0
        TextLabel.Text = t2.value15.ThemePreset or t2.value11
        TextLabel.TextColor3 = t2.value23
        TextLabel.TextSize = 13
        TextLabel.Font = Enum.Font.GothamMedium
        TextLabel.Parent = ScrollingFrame
        Instance.new("UICorner", TextLabel).CornerRadius = UDim.new(0, 5)

        local TextButton2 = Instance.new("TextButton")

        TextButton2.Size = UDim2.new(0, 24, 0, 24)
        TextButton2.Position = UDim2.new(1, -30, 0, 203)
        TextButton2.BackgroundColor3 = t2.value24
        TextButton2.BackgroundTransparency = 0.15
        TextButton2.BorderSizePixel = 0
        TextButton2.Text = ">"
        TextButton2.TextColor3 = t2.value23
        TextButton2.TextSize = 14
        TextButton2.Font = Enum.Font.GothamBold
        TextButton2.Parent = ScrollingFrame
        Instance.new("UICorner", TextButton2).CornerRadius = UDim.new(0, 5)
        v213(ScrollingFrame, 46, "Menu Hotkey:")

        local TextButton3 = Instance.new("TextButton")

        TextButton3.Size = UDim2.new(0, 100, 0, 24)
        TextButton3.Position = UDim2.new(1, -120, 0, 49)
        TextButton3.BackgroundColor3 = t2.value24
        TextButton3.BackgroundTransparency = 0.15
        TextButton3.BorderSizePixel = 0
        TextButton3.Text = t2.value15.ToggleKey
        TextButton3.TextColor3 = t2.value23
        TextButton3.TextSize = 13
        TextButton3.Font = Enum.Font.GothamMedium
        TextButton3.Parent = ScrollingFrame
        Instance.new("UICorner", TextButton3).CornerRadius = UDim.new(0, 5)
        TextButton3.MouseButton1Click:Connect(function()
            TextButton3.Text = "..."
            TextButton3.BackgroundColor3 = t2.value21

            if t2.value45 then
                t2.value45:Disconnect()
            end

            t2.value45 = t2.value2.InputBegan:Connect(function(input, _)
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    t2.value15.ToggleKey = input.KeyCode.Name
                    TextButton3.Text = t2.value15.ToggleKey
                    TextButton3.BackgroundColor3 = t2.value24

                    if makefolder and writefile then
                        pcall(function()
                            if isfolder and not isfolder(t2.value8) then
                                makefolder(t2.value8)
                            elseif not isfolder then
                                makefolder(t2.value8)
                            end

                            writefile(t2.value9, t2.value4:JSONEncode(t2.value15))
                        end)
                    end

                    t2.value45:Disconnect()
                    t2.value45 = nil
                end
            end)
        end)
        v214(ScrollingFrame, 76, "Anti-AFK", "AntiAFK")
        v214(ScrollingFrame, 106, "View Object Names", "ViewObjects")
        v214(ScrollingFrame, 136, "Key Log & Time", "KeyLogger")
        v214(ScrollingFrame, 166, "Trigger Logger [BETA]", "TriggerLogger")

        local function v219()
            local ThemePreset = t2.value15.ThemePreset

            if ThemePreset then
                ThemePreset = t2.value13[t2.value15.ThemePreset]
            end

            if ThemePreset then
                return t2.value15.ThemePreset
            end

            return t2.value11
        end
        local function v220(p61)
            local ImageButton2 = Instance.new("ImageButton")

            ImageButton2.Size = UDim2.new(0, 24, 0, 24)
            ImageButton2.Position = UDim2.new(1, -112, 0, p61)
            ImageButton2.BackgroundColor3 = t2.value24
            ImageButton2.BackgroundTransparency = 0.15
            ImageButton2.BorderSizePixel = 0
            ImageButton2.Image = "rbxassetid://10734933056"
            ImageButton2.ImageColor3 = t2.value23
            ImageButton2.Parent = ScrollingFrame
            Instance.new("UICorner", ImageButton2).CornerRadius = UDim.new(0, 4)
            ImageButton2.MouseEnter:Connect(function()
                t2.value3:Create(ImageButton2, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundColor3 = t2.value25
				}):Play()
            end)
            ImageButton2.MouseLeave:Connect(function()
                t2.value3:Create(ImageButton2, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundColor3 = t2.value24
				}):Play()
            end)

            return ImageButton2
        end

        v213(ScrollingFrame, 234, "Accent Color:")

        local TextButton4 = Instance.new("TextButton")

        TextButton4.Size = UDim2.new(0, 56, 0, 24)
        TextButton4.Position = UDim2.new(1, -80, 0, 237)
        TextButton4.BackgroundColor3 = t2.value21
        TextButton4.Text = ""
        TextButton4.Parent = ScrollingFrame
        Instance.new("UICorner", TextButton4).CornerRadius = UDim.new(0, 4)

        local v222 = v220(237)

        v213(ScrollingFrame, 264, "Background Color:")

        local TextButton5 = Instance.new("TextButton")

        TextButton5.Size = UDim2.new(0, 56, 0, 24)
        TextButton5.Position = UDim2.new(1, -80, 0, 267)
        TextButton5.BackgroundColor3 = t2.value22
        TextButton5.Text = ""
        TextButton5.Parent = ScrollingFrame
        Instance.new("UICorner", TextButton5).CornerRadius = UDim.new(0, 4)

        local v224 = v220(267)

        v213(ScrollingFrame, 294, "Text Color:")

        local TextButton6 = Instance.new("TextButton")

        TextButton6.Size = UDim2.new(0, 56, 0, 24)
        TextButton6.Position = UDim2.new(1, -80, 0, 297)
        TextButton6.BackgroundColor3 = t2.value23
        TextButton6.Text = ""
        TextButton6.Parent = ScrollingFrame
        Instance.new("UICorner", TextButton6).CornerRadius = UDim.new(0, 4)

        local v226 = v220(297)

        local function v227(p62, p63, p64, p65, p66, p67, p68, p69)
            local value15 = t2.value15
            local value17 = t2.value17
            if not p63 then
                p63 = t2.value20(p62)
            end
            value15.AccentColor = value17(p63, t2.value14.AccentColor)
            local value15_2 = t2.value15
            local value17_2 = t2.value17
            if not p65 then
                p65 = t2.value20(p64)
            end
            value15_2.BackgroundColor = value17_2(p65, t2.value14.BackgroundColor)
            t2.value15.TextColor = t2.value17(p67 or t2.value20(p66), t2.value14.TextColor)
            local value15_3 = t2.value15
            if not p69 then
                p69 = t2.value19(t2.value15.AccentColor, t2.value15.BackgroundColor, t2.value15.TextColor) or "Custom"
            end
            value15_3.ThemePreset = p69
            t2.value30()
            Frame13.BackgroundColor3 = t2.value22
            Frame14.BackgroundColor3 = t2.value21
            Frame15.BackgroundColor3 = t2.value21
            ScrollingFrame.ScrollBarImageColor3 = t2.value21
            TextLabel.Text = t2.value15.ThemePreset
            TextLabel.BackgroundColor3 = t2.value24
            TextLabel.TextColor3 = t2.value23
            TextButton.BackgroundColor3 = t2.value24
            TextButton.TextColor3 = t2.value23
            TextButton2.BackgroundColor3 = t2.value24
            TextButton2.TextColor3 = t2.value23
            TextButton3.BackgroundColor3 = TextButton3.Text == "..." and t2.value21 or t2.value24
            TextButton3.TextColor3 = t2.value23
            TextButton4.BackgroundColor3 = t2.value21
            TextButton5.BackgroundColor3 = t2.value22
            TextButton6.BackgroundColor3 = t2.value23
            v222.BackgroundColor3 = t2.value24
            v222.ImageColor3 = t2.value23
            v224.BackgroundColor3 = t2.value24
            v224.ImageColor3 = t2.value23
            v226.BackgroundColor3 = t2.value24
            v226.ImageColor3 = t2.value23
            for v462, v463 in ipairs(t8) do

                v463.label.TextColor3 = v463.tone == "primary" and t2.value23 or t2.value26
            end
            for _, v in ipairs(t7) do
                v.button.BackgroundColor3 = t2.value15[v.settingKey] and t2.value21 or t2.value24

                if v.handle then
                    v.handle.BackgroundColor3 = t2.value23
                end
            end
            t2.value46()
            if p68 and (makefolder and writefile) then
                pcall(function()
                    if isfolder and not isfolder(t2.value8) then
                        makefolder(t2.value8)
                    elseif not isfolder then
                        makefolder(t2.value8)
                    end

                    writefile(t2.value9, t2.value4:JSONEncode(t2.value15))
                end)
            end
        end
        local function v228(p70)
            local v467 = ((table.find(t2.value12, t2.value15.ThemePreset) or 1) - 1 + p70) % #t2.value12 + 1
            local v468 = t2.value12[v467]
            local v469 = t2.value18(v468)

            v227(t2.value16(v469.AccentColor), v469.AccentColor, t2.value16(v469.BackgroundColor), v469.BackgroundColor, t2.value16(v469.TextColor), v469.TextColor, true, v468)
        end

        TextButton.MouseButton1Click:Connect(function()
            v228(-1)
        end)
        TextButton2.MouseButton1Click:Connect(function()
            v228(1)
        end)
        TextButton4.MouseButton1Click:Connect(function()
            t2.value56(t2.value21, function(p71, p72)
                v227(p71, p72, t2.value22, t2.value15.BackgroundColor, t2.value23, t2.value15.TextColor, true)
            end, function(p73, p74)
                v227(p73, p74, t2.value22, t2.value15.BackgroundColor, t2.value23, t2.value15.TextColor, false)
            end, "ACCENT COLOR")
        end)
        TextButton5.MouseButton1Click:Connect(function()
            t2.value56(t2.value22, function(p75, p76)
                v227(t2.value21, t2.value15.AccentColor, p75, p76, t2.value23, t2.value15.TextColor, true)
            end, function(p77, p78)
                v227(t2.value21, t2.value15.AccentColor, p77, p78, t2.value23, t2.value15.TextColor, false)
            end, "BACKGROUND COLOR")
        end)
        TextButton6.MouseButton1Click:Connect(function()
            t2.value56(t2.value23, function(p79, p80)
                v227(t2.value21, t2.value15.AccentColor, t2.value22, t2.value15.BackgroundColor, p79, p80, true)
            end, function(p81, p82)
                v227(t2.value21, t2.value15.AccentColor, t2.value22, t2.value15.BackgroundColor, p81, p82, false)
            end, "TEXT COLOR")
        end)
        v222.MouseButton1Click:Connect(function()
            local v470 = t2.value18(v219())

            v227(t2.value16(v470.AccentColor), v470.AccentColor, t2.value22, t2.value15.BackgroundColor, t2.value23, t2.value15.TextColor, true)
        end)
        v224.MouseButton1Click:Connect(function()
            local v471 = t2.value18(v219())

            v227(t2.value21, t2.value15.AccentColor, t2.value16(v471.BackgroundColor), v471.BackgroundColor, t2.value23, t2.value15.TextColor, true)
        end)
        v226.MouseButton1Click:Connect(function()
            local v472 = t2.value18(v219())

            v227(t2.value21, t2.value15.AccentColor, t2.value22, t2.value15.BackgroundColor, t2.value16(v472.TextColor), v472.TextColor, true)
        end)

        local TextButton7 = Instance.new("TextButton")

        TextButton7.Size = UDim2.new(0.45, 0, 0, 30)
        TextButton7.Position = UDim2.new(0.02, 0, 0, 338)
        TextButton7.BackgroundColor3 = t2.value24
        TextButton7.BackgroundTransparency = 0.15
        TextButton7.BorderSizePixel = 0
        TextButton7.Text = "ReJoin Server"
        TextButton7.TextColor3 = t2.value23
        TextButton7.TextSize = 13
        TextButton7.Font = Enum.Font.GothamMedium
        TextButton7.Parent = ScrollingFrame
        Instance.new("UICorner", TextButton7).CornerRadius = UDim.new(0, 5)
        TextButton7.MouseButton1Click:Connect(function()
            TextButton7.Text = "Rejoining..."
            pcall(function()
                t2.value5:TeleportToPlaceInstance(game.PlaceId, game.JobId, t2.value1.LocalPlayer)
            end)
        end)

        local TextButton8 = Instance.new("TextButton")

        TextButton8.Size = UDim2.new(0.45, 0, 0, 30)
        TextButton8.Position = UDim2.new(0.5, 0, 0, 338)
        TextButton8.BackgroundColor3 = t2.value24
        TextButton8.BackgroundTransparency = 0.15
        TextButton8.BorderSizePixel = 0
        TextButton8.Text = "Dump ReplicatedStorage"
        TextButton8.TextColor3 = t2.value23
        TextButton8.TextSize = 11
        TextButton8.Font = Enum.Font.GothamMedium
        TextButton8.Parent = ScrollingFrame
        Instance.new("UICorner", TextButton8).CornerRadius = UDim.new(0, 5)
        TextButton8.MouseEnter:Connect(function()
            t2.value3:Create(TextButton8, TweenInfo.new(0.2), {
				BackgroundColor3 = t2.value25
			}):Play()
        end)
        TextButton8.MouseLeave:Connect(function()
            t2.value3:Create(TextButton8, TweenInfo.new(0.2), {
				BackgroundColor3 = t2.value24
			}):Play()
        end)
        v227(t2.value21, t2.value15.AccentColor, t2.value22, t2.value15.BackgroundColor, t2.value23, t2.value15.TextColor, false, t2.value15.ThemePreset)

        local n2 = 0
        local n3 = 0

        local function u233(p83, p84)
            n2 += 1

            if n2 % 100 == 0 then
                task.wait(1)
                print("DUMP DONE: " .. tostring(n2) .. "/" .. tostring(n3))
            end

            local v475 = p83.Name:gsub("[\\/:*?\"<>|]", "_")
            local v476 = p84 .. "/" .. v475
            local _makefolder = makefolder

            if _makefolder then
                _makefolder = #p83:GetChildren() > 0

                if not _makefolder then
                    _makefolder = p83 == game:GetService("ReplicatedStorage")
                end
            end

            if _makefolder then
                pcall(function()
                    makefolder(v476)
                end)
            end

            local v478 = p83:IsA("LocalScript")

            if not v478 then
                v478 = p83:IsA("ModuleScript")

                if not v478 then
                    v478 = p83:IsA("Script")
                end
            end

            if v478 and writefile then
                pcall(function()
                    local s1 = "-- Source not available (Decompiler missing or failed)"

                    if decompile then
                        local v549 = decompile(p83)

                        if v549 and v549 ~= "" then
                            s1 = v549
                        end
                    end

                    writefile(p84 .. "/" .. v475 .. ".lua", s1)
                end)
            end

            local _writefile = writefile

            if _writefile then
                _writefile = p83:IsA("StringValue")

                if not _writefile then
                    _writefile = p83:IsA("IntValue")

                    if not _writefile then
                        _writefile = p83:IsA("NumberValue")

                        if not _writefile then
                            _writefile = p83:IsA("BoolValue")
                        end
                    end
                end
            end

            if _writefile then
                pcall(function()
                    writefile(p84 .. "/" .. v475 .. "_" .. p83.ClassName .. ".txt", (tostring(p83.Value)))
                end)
            end

            for _, child in ipairs(p83:GetChildren()) do
                local v482 = child

                pcall(function()
                    u233(v482, v476)
                end)
            end
        end

        TextButton8.MouseButton1Click:Connect(function()
            task.spawn(function()
                local s2 = "Game"

                pcall(function()
                    s2 = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
                    s2 = s2:gsub("[\\/:*?\"<>|]", "")
                end)

                local v551 = t2.value8 .. "/DUMP"
                local v552 = v551 .. "/REPLICATED/" .. s2 .. " - " .. tostring(game.PlaceId)

                if makefolder then
                    pcall(function()
                        makefolder(t2.value8)
                    end)
                    pcall(function()
                        makefolder(v551)
                    end)
                    pcall(function()
                        makefolder(v551 .. "/REPLICATED")
                    end)
                    pcall(function()
                        makefolder(v552)
                    end)
                end

                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local ok, result = pcall(function()
                    return ReplicatedStorage:GetDescendants()
                end)

                if ok and result then
                    n3 = #result + 1
                else
                    n3 = "?"
                end

                pcall(function()
                    u233(ReplicatedStorage, v552)
                end)
                print("DUMP DONE: " .. tostring(n3) .. "/" .. tostring(n3))
                pcall(function()
                    local v578 = v14
                    local v579 = "Dumped Explorer (RS) successfully to " .. v552

                    v578({
						Title = "UNDETECTED",
						Text = v579,
						Duration = 10
					})
                end)

                if not writefile then
                    pcall(function()
                        v14({
							Title = "UNDETECTED",
							Text = "Executor does not support file saving!",
							Duration = 10
						})
                    end)

                    return
                end
            end)
        end)
    else
        local Frame17 = Instance.new("Frame")

        Frame17.Size = UDim2.new(1, 0, 0, 26)
        Frame17.Position = UDim2.new(0, 0, 0, 34)
        Frame17.BackgroundColor3 = t2.value24
        Frame17.BackgroundTransparency = 0.15
        Frame17.BorderSizePixel = 0
        Frame17.Parent = Frame13
        t2.value55(Frame17, "Menu Name", UDim2.new(0.42, 0, 1, 0), UDim2.new(0, 12, 0, 0), t2.value27, 12)
        t2.value55(Frame17, "Version", UDim2.new(0.26, 0, 1, 0), UDim2.new(0.42, 0, 0, 0), t2.value27, 12)
        t2.value55(Frame17, "Actions", UDim2.new(0.32, 0, 1, 0), UDim2.new(0.68, 0, 0, 0), t2.value27, 12)

        local Frame18 = Instance.new("Frame")

        Frame18.Size = UDim2.new(1, 0, 0, 42)
        Frame18.Position = UDim2.new(0, 0, 0, 60)
        Frame18.BackgroundColor3 = t2.value24
        Frame18.BackgroundTransparency = 0.15
        Frame18.BorderSizePixel = 0
        Frame18.Parent = Frame13
        Instance.new("UICorner", Frame18).CornerRadius = UDim.new(0, 7)

        local Frame19 = Instance.new("Frame")

        Frame19.Size = UDim2.new(1, 0, 0, 10)
        Frame19.Position = UDim2.new(0, 0, 0, 0)
        Frame19.BackgroundColor3 = t2.value24
        Frame19.BackgroundTransparency = 0.15
        Frame19.BorderSizePixel = 0
        Frame19.Parent = Frame18
        t2.value55(Frame18, p48.menuName, UDim2.new(0.42, 0, 1, 0), UDim2.new(0, 12, 0, 0), t2.value23, 13)
        t2.value55(Frame18, p48.version, UDim2.new(0.26, 0, 1, 0), UDim2.new(0.42, 0, 0, 0), t2.value23, 13)

        local TextButton = Instance.new("TextButton")

        TextButton.Size = UDim2.new(0.3, -8, 0, 28)
        TextButton.Position = UDim2.new(0.68, 0, 0.5, -14)
        TextButton.BackgroundColor3 = t2.value21
        TextButton.BorderSizePixel = 0
        TextButton.Text = "Launch"
        TextButton.TextColor3 = t2.value23
        TextButton.TextSize = 13
        TextButton.Font = Enum.Font.GothamMedium
        TextButton.Parent = Frame18
        Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 5)
        TextButton.MouseEnter:Connect(function()
            if TextButton.Text == "Launch" then
                t2.value3:Create(TextButton, TweenInfo.new(0.2), {
					BackgroundColor3 = t2.value29(t2.value21, 30)
				}):Play()
            end
        end)
        TextButton.MouseLeave:Connect(function()
            if TextButton.Text == "Launch" then
                t2.value3:Create(TextButton, TweenInfo.new(0.2), {
					BackgroundColor3 = t2.value21
				}):Play()
            end
        end)
        TextButton.MouseButton1Click:Connect(function()
            local v483 = string.gsub(tostring(p48.gameId or "universal"), "%s+", "")

            if v483 ~= "universal" then
                local str = tostring(game.PlaceId)
                local str3 = tostring(game.GameId)
                local v486 = false

                if str ~= v483 then
                    v486 = str3 ~= v483
                end

                if v486 then
                    local ScreenGui = Instance.new("ScreenGui")

                    ScreenGui.Name = "WrongGameGui"
                    ScreenGui.ResetOnSpawn = false
                    ScreenGui.IgnoreGuiInset = true
                    ScreenGui.DisplayOrder = 10000
                    ScreenGui.Parent = t2.value35

                    local TextLabel = Instance.new("TextLabel")

                    TextLabel.Size = UDim2.new(1, 0, 1, 0)
                    TextLabel.BackgroundTransparency = 1
                    TextLabel.Text = "Wrong Game"
                    TextLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
                    TextLabel.TextStrokeTransparency = 0
                    TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    TextLabel.TextSize = 60
                    TextLabel.Font = Enum.Font.GothamBold
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Center
                    TextLabel.TextYAlignment = Enum.TextYAlignment.Center
                    TextLabel.Parent = ScreenGui
                    task.delay(3, function()
                        ScreenGui:Destroy()
                    end)

                    return
                end
            end

            TextButton.Text = "Launching..."
            t2.value3:Create(TextButton, TweenInfo.new(0.2), {
				BackgroundColor3 = t2.value29(t2.value21, -30)
			}):Play()
            task.spawn(function()
                loadstring(game:HttpGet(p48.url))()
            end)
            task.delay(3, function()
                local v556 = TextButton

                if v556 then
                    v556 = TextButton.Parent
                end

                if v556 then
                    TextButton.Text = "Launch"
                    t2.value3:Create(TextButton, TweenInfo.new(0.2), {
						BackgroundColor3 = t2.value21
					}):Play()
                end
            end)
        end)
    end

    t2.value42[p49] = {
		panel = Frame13,
		tab = p48,
		storageKey = v198
	}

    if not t2.value32(v198) then
        t2.value33(v198, v199)
    end

    t2.value50(Frame13, v197, v199)
    t2.value46()
end
for i, v in ipairs(t2.value38) do
    local v21 = v

    t1.value5 = Instance.new("TextButton")

    local value5 = t1.value5

    t1.value5 = value5
    t1.value8 = "Size"
    t1.value7 = UDim2.new(0, 52, 0, 36)
    t1.value5[t1.value8] = t1.value7
    t1.value5 = value5
    t1.value8 = "BackgroundColor3"
    t1.value5[t1.value8] = t2.value24
    t1.value5 = value5
    t1.value8 = "BackgroundTransparency"
    t1.value5[t1.value8] = 0.15
    t1.value5 = value5
    t1.value8 = "BorderSizePixel"
    t1.value5[t1.value8] = 0
    t1.value5 = value5
    t1.value8 = "AutoButtonColor"
    t1.value5[t1.value8] = false
    t1.value5 = value5
    t1.value8 = "Text"
    t1.value6 = v21.label
    t1.value5[t1.value8] = t1.value6
    t1.value5 = value5
    t1.value8 = "TextColor3"
    t1.value5[t1.value8] = t2.value26
    t1.value5 = value5
    t1.value8 = "TextSize"
    t1.value5[t1.value8] = 14
    t1.value5 = value5
    t1.value8 = "Font"
    t1.value6 = Enum.Font.GothamMedium
    t1.value5[t1.value8] = t1.value6
    t1.value5 = value5
    t1.value8 = "Parent"
    t1.value5[t1.value8] = Frame3
    t1.value8 = Instance.new("UICorner", value5)
    t1.value5 = "CornerRadius"
    t1.value7 = UDim.new(0, 7)
    t1.value8[t1.value5] = t1.value7
    t2.value44[i] = value5
    value5:SetAttribute("Hovered", false)
    value5.MouseEnter:Connect(function()
        value5:SetAttribute("Hovered", true)
        t2.value54(i, false)
    end)
    value5.MouseLeave:Connect(function()
        value5:SetAttribute("Hovered", false)
        t2.value54(i, false)
    end)
    t1.value5 = value5.MouseButton1Click

    function t1.value6()
        t2.value57(v21, i)
    end

    t1.value5:Connect(t1.value6)
end
function t1.value8(p85)
    local t9 = { "[" }

    for i, v in ipairs(p85) do
        local t10 = {
			"  {",
			"    \"action\": \"" .. tostring(v.action) .. "\",",
			"    \"key\": \"" .. tostring(v.key) .. "\","
		}

        if v.action == "press" then
            table.insert(t10, "    \"timeSinceLastKey\": " .. tostring(v.timeSinceLastKey))
        else
            table.insert(t10, "    \"holdDuration\": " .. tostring(v.holdDuration))
        end

        table.insert(t10, "  }" .. (i ~= #p85 and "," or ""))
        table.insert(t9, table.concat(t10, "\n"))
    end

    table.insert(t9, "]")

    return table.concat(t9, "\n")
end
t2.value46(true);
(function()
    t2.value30()

    local uDim2 = UDim2.new(0, 370, 0, 240)
    local v244 = t2.value32("Dashboard")

    if not v244 then
        local v245 = t2.value53()
        local _UDim2 = UDim2
        local v247 = v245 * 28

        v244 = _UDim2.new(0, v247, 0, v247)
    end

    local Frame20 = Instance.new("Frame")

    Frame20.Size = uDim2
    Frame20.Position = v244
    Frame20.BackgroundColor3 = t2.value22
    Frame20.BackgroundTransparency = 0.15
    Frame20.BorderSizePixel = 0
    Frame20.ClipsDescendants = true
    Frame20.Parent = t2.value40
    Instance.new("UICorner", Frame20).CornerRadius = UDim.new(0, 7)

    local Frame21 = Instance.new("Frame")

    Frame21.Size = UDim2.new(1, 0, 0, 34)
    Frame21.BackgroundColor3 = t2.value21
    Frame21.BackgroundTransparency = 0.15
    Frame21.BorderSizePixel = 0
    Frame21.Parent = Frame20
    Instance.new("UICorner", Frame21).CornerRadius = UDim.new(0, 7)

    local TextLabel = Instance.new("TextLabel")

    TextLabel.Size = UDim2.new(1, -20, 1, 0)
    TextLabel.Position = UDim2.new(0, 10, 0, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = "Welcome to UNDETECTED"
    TextLabel.TextColor3 = t2.value23
    TextLabel.TextSize = 13
    TextLabel.Font = Enum.Font.GothamMedium
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Parent = Frame21
    t2.value41(Frame21, Frame20, function(p86)
        t2.value33(nil, p86)
    end)

    local Frame22 = Instance.new("Frame")

    Frame22.Size = UDim2.new(1, 0, 1, -34)
    Frame22.Position = UDim2.new(0, 0, 0, 34)
    Frame22.BackgroundTransparency = 1
    Frame22.BorderSizePixel = 0
    Frame22.Parent = Frame20

    local ImageLabel = Instance.new("ImageLabel")

    ImageLabel.Size = UDim2.new(0, 100, 0, 100)
    ImageLabel.Position = UDim2.new(0, 20, 0.5, -50)
    ImageLabel.BackgroundColor3 = t2.value24
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Image = "rbxthumb://type=AvatarHeadShot&id=" .. t2.value1.LocalPlayer.UserId .. "&w=150&h=150"
    ImageLabel.Parent = Frame22
    Instance.new("UICorner", ImageLabel).CornerRadius = UDim.new(1, 0)

    local UIStroke = Instance.new("UIStroke")

    UIStroke.Color = t2.value21
    UIStroke.Thickness = 2
    UIStroke.Parent = ImageLabel

    local Frame23 = Instance.new("Frame")

    Frame23.Size = UDim2.new(1, -150, 1, -20)
    Frame23.Position = UDim2.new(0, 140, 0, 10)
    Frame23.BackgroundTransparency = 1
    Frame23.Parent = Frame22

    local UIListLayout4 = Instance.new("UIListLayout")

    UIListLayout4.Padding = UDim.new(0, 7)
    UIListLayout4.HorizontalAlignment = Enum.HorizontalAlignment.Left
    UIListLayout4.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout4.Parent = Frame23

    local function v256(p87, p88)
        local v492 = t2.value20(t2.value27)
        local TextLabel3 = Instance.new("TextLabel")

        TextLabel3.Size = UDim2.new(1, 0, 0, 14)
        TextLabel3.BackgroundTransparency = 1
        TextLabel3.RichText = true
        TextLabel3.Text = "<font color=\"" .. v492 .. "\">" .. p87 .. ":</font> " .. tostring(p88)
        TextLabel3.TextColor3 = t2.value23
        TextLabel3.TextSize = 13
        TextLabel3.Font = Enum.Font.GothamMedium
        TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel3.Parent = Frame23

        return TextLabel3
    end

    v256("Username", t2.value1.LocalPlayer.Name)

    local v257 = v256("Game Name", "Loading...")

    task.spawn(function()
        pcall(function()
            local ProductInfo = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

            v257.Text = "<font color=\"" .. t2.value20(t2.value27) .. "\">Game Name:</font> " .. ProductInfo.Name
        end)
    end)
    v256("Place ID", (tostring(game.PlaceId)))
    v256("Universe ID", (tostring(game.GameId)))
    v256("Players", tostring(#t2.value1:GetPlayers()) .. " / " .. tostring(t2.value1.MaxPlayers))

    local Teams = game:GetService("Teams")

    if Teams then
        local GetChildren = Teams.GetChildren

        Teams = tostring(#GetChildren(Teams))
    end

    v256("Teams", Teams or "0")

    local v260 = v256("Ping", "0 ms")
    local v261 = v256("FPS", "60")

    t2.value43 = Frame20

    if not t2.value32(nil) then
        t2.value33(nil, v244)
    end

    t2.value50(Frame20, uDim2, v244)
    task.spawn(function()
        while true do
            local v494 = t2.value43 == Frame20

            if v494 then
                v494 = Frame20.Parent
            end

            if not v494 then
                break
            end

            pcall(function()
                local v558 = math.floor((game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()))

                v260.Text = "<font color=\"" .. t2.value20(t2.value27) .. "\">Ping:</font> " .. v558 .. " ms"
            end)
            pcall(function()
                local v559 = math.floor((workspace:GetRealPhysicsFPS()))

                if v559 == 0 then
                    v559 = 60
                end

                v261.Text = "<font color=\"" .. t2.value20(t2.value27) .. "\">FPS:</font> " .. tostring(v559)
            end)
            task.wait(1)
        end
    end)
end)()
t2.value58 = true
t2.value59 = {}
t2.value60 = {}
t2.value61 = 0
t2.value62 = false
t2.value63 = t1.value8
function t1.value6()
    pcall(function()
        local v495 = t2.value63(t2.value60)

        if setclipboard then
            setclipboard(v495)
            v14({
				Title = "UNDETECTED",
				Text = "Keylog copied to clipboard!",
				Duration = 5
			})

            return
        end

        v14({
			Title = "UNDETECTED",
			Text = "Executor does not support clipboard!",
			Duration = 5
		})
    end)
end
t2.value64 = t1.value6
t1.value6 = _G
t1.value7 = "StartKeyLog"
t1.value6[t1.value7] = function()
    t2.value60 = {}
    t2.value62 = true
    t2.value61 = tick()
end
t1.value6 = _G
t1.value7 = "ForceSaveKeyLog"
t1.value6[t1.value7] = function()
    t2.value62 = false
    t2.value64()
    t2.value60 = {}
end
t1.value6 = t2.value2.InputBegan
t1.value6:Connect(function(p89, p90)
    if p89.UserInputType == Enum.UserInputType.Keyboard then
        if p89.KeyCode.Name == t2.value15.ToggleKey then
            t2.value58 = not t2.value58

            local v264 = not t2.value58 and 1 or 0

            t2.value39.Interactable = t2.value58
            t2.value3:Create(t2.value39, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				GroupTransparency = v264
			}):Play()
        elseif p89.KeyCode.Name == "F3" then
            t2.value37:Destroy()
        end

        if t2.value15.KeyLogger and not p90 then
            if not t2.value62 then
                t2.value62 = true
                t2.value60 = {}
                t2.value61 = tick()
            end

            local timestamp = tick()
            local v266 = timestamp - t2.value61

            t2.value59[p89.KeyCode] = timestamp

            local insert = table.insert
            local value60 = t2.value60
            local KeyCodeName = p89.KeyCode.Name

            insert(value60, {
				action = "press",
				key = KeyCodeName,
				timeSinceLastKey = v266
			})
        end
    end
end)
t1.value6 = t2.value2.InputEnded
t1.value6:Connect(function(p91, _)
    if p91.UserInputType == Enum.UserInputType.Keyboard then
        if t2.value15.KeyLogger then
            local timestamp = tick()
            local v273 = t2.value59[p91.KeyCode]
            local n4 = 0

            if v273 then
                n4 = timestamp - v273
                t2.value59[p91.KeyCode] = nil
            end

            local insert = table.insert
            local value60 = t2.value60
            local KeyCodeName = p91.KeyCode.Name

            insert(value60, {
				action = "release",
				key = KeyCodeName,
				holdDuration = n4
			})

            return
        end

        if not t2.value15.KeyLogger and t2.value62 then
            _G.ForceSaveKeyLog()
        end
    end
end)
t2.value65 = nil
t2.value66 = false
t2.value67 = nil
t2.value68 = nil
t2.value69 = {}
t2.value70 = 0
t2.value71 = nil
t2.value71 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
function t2.value72(p93)
    return tostring(p93):gsub("[^" .. t2.value71 .. "=]", ""):gsub(".", function(p94)
        if p94 == "=" then
            return ""
        end

        local s3 = ""
        local v501 = t2.value71:find(p94) - 1

        for i = 6, 1, -1 do
            s3 = not (s3 .. (v501 % 2 ^ i - v501 % 2 ^ (i - 1) > 0)) and "0" or "1"
        end

        return s3
    end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(p95)
        if #p95 ~= 8 then
            return ""
        end

        local n5 = 0

        for i = 1, 8 do
            local v506 = i

            n5 += p95:sub(v506, v506) == "1" and 2 ^ (8 - v506) or 0
        end

        return string.char(n5)
    end)
end
function t2.value73(p96)
    local v289 = type(p96) == "string"

    if v289 then
        v289 = #p96 >= 16

        if v289 then
            v289 = #p96 % 4 == 0 and p96:match("^[A-Za-z0-9%+%/]+={0,2}$") ~= nil
        end
    end

    return v289
end
t2.value74 = nil
function t2.value74(p97, p98)
    local v293 = p98 or 0

    if v293 > 4 then
        return "\"[MaxDepth]\""
    end

    local v294 = typeof(p97)

    if v294 == "nil" then
        return "null"
    end

    if v294 == "boolean" then
        return tostring(p97)
    end

    if v294 == "number" then
        return tostring(p97)
    end

    if v294 == "string" then
        local v295 = p97:gsub("\\", "\\\\"):gsub("\"", "\\\""):gsub("\n", "\\n"):gsub("\r", "\\r")

        if t2.value73(p97) then
            local ok, result = pcall(t2.value72, p97)

            if ok then
                ok = result and #result > 0
            end

            if ok then
                return "\"" .. v295 .. " [b64: " .. result:gsub("[%c]", "."):gsub("\"", "\\\"") .. "\"]"
            end
        end

        return "\"" .. v295 .. "\""
    end

    if v294 == "table" then
        local t11 = {}

        for k, v in pairs(p97) do
            local v301 = k
            local v302 = type(v301) == "string" and "\"" .. v301 .. "\""

            if not v302 then
                v302 = "[" .. (type(v301) == "number" and v301 or tostring(v301) .. "]")
            end

            table.insert(t11, v302 .. ":" .. t2.value74(v, v293 + 1))
        end

        return "{" .. table.concat(t11, ",") .. "}"
    end

    if v294 == "Instance" then
        return "\"[Instance: " .. p97:GetFullName() .. "]\""
    end

    if v294 == "Vector3" then
        return string.format("\"Vector3(%g, %g, %g)\"", p97.X, p97.Y, p97.Z)
    end

    if v294 == "CFrame" then
        local p97Position = p97.Position

        return string.format("\"CFrame(%g, %g, %g)\"", p97Position.X, p97Position.Y, p97Position.Z)
    end

    if v294 == "Color3" then
        return string.format("\"Color3(%d, %d, %d)\"", p97.R * 255, p97.G * 255, p97.B * 255)
    end

    if v294 == "UDim2" then
        return string.format("\"UDim2(%g,%d,%g,%d)\"", p97.X.Scale, p97.X.Offset, p97.Y.Scale, p97.Y.Offset)
    end

    if v294 == "EnumItem" then
        return "\"Enum." .. tostring(p97) .. "\""
    end

    local ok, result = pcall(tostring, p97)

    return "\"" .. v294 .. ": " .. (ok and result or "?\"")
end
function t2.value75(p99)
    local t12 = {}

    for i, v in ipairs(p99) do
        t12[i] = t2.value74(v)
    end

    return "[" .. table.concat(t12, ", ") .. "]"
end
function t2.value76(p100, p101, p102, p103)
    if not t2.value68 then
        return
    end

    t2.value30()
    t2.value70 = t2.value70 + 1

    local v282 = os.date("%H:%M:%S", p103)
    local v283 = string.format("[%s] [%s]  %s\n→ %s", v282, p100, p101, p102)
    local Frame24 = Instance.new("Frame")

    Frame24.Size = UDim2.new(1, -10, 0, 0)
    Frame24.AutomaticSize = Enum.AutomaticSize.Y
    Frame24.BackgroundColor3 = t2.value24
    Frame24.BackgroundTransparency = 0.15
    Frame24.BorderSizePixel = 0
    Frame24.Parent = t2.value68
    Instance.new("UICorner", Frame24).CornerRadius = UDim.new(0, 5)

    local TextButton = Instance.new("TextButton")

    TextButton.Size = UDim2.new(0, 70, 0, 18)
    TextButton.Position = UDim2.new(1, -76, 0, 5)
    TextButton.AnchorPoint = Vector2.new(0, 0)
    TextButton.BackgroundColor3 = t2.value25
    TextButton.BorderSizePixel = 0
    TextButton.Text = "Copy Path"
    TextButton.TextColor3 = t2.value26
    TextButton.Font = Enum.Font.GothamMedium
    TextButton.TextSize = 10
    TextButton.ZIndex = 5
    TextButton.Parent = Frame24
    Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 4)
    TextButton.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(p101)
            TextButton.Text = "Copied!"
            TextButton.BackgroundColor3 = t2.value21
            task.delay(1.5, function()
                local v560 = TextButton

                if v560 then
                    v560 = TextButton.Parent
                end

                if v560 then
                    TextButton.Text = "Copy Path"
                    TextButton.BackgroundColor3 = t2.value25
                end
            end)
        end
    end)

    local TextBox = Instance.new("TextBox")

    TextBox.Name = "LogText"
    TextBox.Size = UDim2.new(1, -82, 0, 0)
    TextBox.AutomaticSize = Enum.AutomaticSize.Y
    TextBox.BackgroundTransparency = 1
    TextBox.TextColor3 = t2.value23
    TextBox.Font = Enum.Font.GothamMedium
    TextBox.TextSize = 11
    TextBox.TextXAlignment = Enum.TextXAlignment.Left
    TextBox.TextWrapped = true
    TextBox.ClearTextOnFocus = false
    TextBox.TextEditable = false
    TextBox.Text = v283
    TextBox.BorderSizePixel = 0
    TextBox.Parent = Frame24

    local UIPadding = Instance.new("UIPadding")

    UIPadding.PaddingLeft = UDim.new(0, 8)
    UIPadding.PaddingRight = UDim.new(0, 4)
    UIPadding.PaddingTop = UDim.new(0, 5)
    UIPadding.PaddingBottom = UDim.new(0, 5)
    UIPadding.Parent = TextBox
    task.defer(function()
        if t2.value68 and t2.value67 then
            local v496 = t2.value67.AbsoluteContentSize.Y + 10

            t2.value68.CanvasSize = UDim2.new(0, 0, 0, v496)

            local CanvasPositionY = t2.value68.CanvasPosition.Y
            local AbsoluteSizeY = t2.value68.AbsoluteSize.Y

            if CanvasPositionY + AbsoluteSizeY >= v496 - 60 then
                t2.value68.CanvasPosition = Vector2.new(0, (math.max(0, v496 - AbsoluteSizeY)))
            end
        end
    end)
end
function _G.OpenTriggerLogger()
    if t2.value65 then
        return
    end
    t2.value30()
    t2.value65 = Instance.new("Frame")
    t2.value65.Name = "TriggerLoggerWin"
    t2.value65.Size = UDim2.new(0, 460, 0, 320)
    t2.value65.Position = UDim2.new(0.5, -230, 0.5, -160)
    t2.value65.BackgroundColor3 = t2.value22
    t2.value65.BackgroundTransparency = 0
    t2.value65.BorderSizePixel = 0
    t2.value65.Parent = t2.value37
    t2.value65.ZIndex = 20
    Instance.new("UICorner", t2.value65).CornerRadius = UDim.new(0, 8)
    local Frame25 = Instance.new("Frame")
    Frame25.Size = UDim2.new(1, 0, 0, 34)
    Frame25.BackgroundColor3 = t2.value21
    Frame25.BackgroundTransparency = 0.15
    Frame25.BorderSizePixel = 0
    Frame25.ZIndex = 21
    Frame25.Parent = t2.value65
    Instance.new("UICorner", Frame25).CornerRadius = UDim.new(0, 8)
    local Frame26 = Instance.new("Frame")
    Frame26.Size = UDim2.new(1, 0, 0, 8)
    Frame26.Position = UDim2.new(0, 0, 1, -8)
    Frame26.BackgroundColor3 = t2.value21
    Frame26.BackgroundTransparency = 0.15
    Frame26.BorderSizePixel = 0
    Frame26.ZIndex = 21
    Frame26.Parent = Frame25
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(0, 180, 1, 0)
    TextLabel.Position = UDim2.new(0, 12, 0, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = "TRIGGER LOGGER [Beta]"
    TextLabel.TextColor3 = t2.value23
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextSize = 13
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.ZIndex = 22
    TextLabel.Parent = Frame25
    local TextLabel4 = Instance.new("TextLabel")
    TextLabel4.Name = "Counter"
    TextLabel4.Size = UDim2.new(0, 70, 1, 0)
    TextLabel4.Position = UDim2.new(0, 190, 0, 0)
    TextLabel4.BackgroundTransparency = 1
    TextLabel4.Text = "0 events"
    TextLabel4.TextColor3 = t2.value23
    TextLabel4.Font = Enum.Font.GothamMedium
    TextLabel4.TextSize = 11
    TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel4.BackgroundTransparency = 1
    TextLabel4.ZIndex = 22
    TextLabel4.Parent = Frame25
    local TextButton = Instance.new("TextButton")
    TextButton.Size = UDim2.new(0, 52, 0, 22)
    TextButton.Position = UDim2.new(1, -170, 0.5, -11)
    TextButton.BackgroundColor3 = Color3.fromRGB(40, 160, 40)
    TextButton.Text = "Start"
    TextButton.TextColor3 = Color3.new(1, 1, 1)
    TextButton.Font = Enum.Font.GothamMedium
    TextButton.TextSize = 12
    TextButton.ZIndex = 22
    TextButton.BorderSizePixel = 0
    TextButton.Parent = Frame25
    Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 5)
    local TextButton9 = Instance.new("TextButton")
    TextButton9.Size = UDim2.new(0, 52, 0, 22)
    TextButton9.Position = UDim2.new(1, -112, 0.5, -11)
    TextButton9.BackgroundColor3 = Color3.fromRGB(200, 55, 55)
    TextButton9.Text = "Stop"
    TextButton9.TextColor3 = Color3.new(1, 1, 1)
    TextButton9.Font = Enum.Font.GothamMedium
    TextButton9.TextSize = 12
    TextButton9.ZIndex = 22
    TextButton9.BorderSizePixel = 0
    TextButton9.Parent = Frame25
    Instance.new("UICorner", TextButton9).CornerRadius = UDim.new(0, 5)
    local TextButton10 = Instance.new("TextButton")
    TextButton10.Size = UDim2.new(0, 48, 0, 22)
    TextButton10.Position = UDim2.new(1, -54, 0.5, -11)
    TextButton10.BackgroundColor3 = t2.value24
    TextButton10.Text = "Clear"
    TextButton10.TextColor3 = t2.value23
    TextButton10.Font = Enum.Font.GothamMedium
    TextButton10.TextSize = 12
    TextButton10.ZIndex = 22
    TextButton10.BorderSizePixel = 0
    TextButton10.Parent = Frame25
    Instance.new("UICorner", TextButton10).CornerRadius = UDim.new(0, 5)
    TextButton.MouseButton1Click:Connect(function()
        t2.value66 = true
        TextButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        TextButton9.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
    end)
    TextButton9.MouseButton1Click:Connect(function()
        t2.value66 = false
        TextButton.BackgroundColor3 = Color3.fromRGB(40, 160, 40)
        TextButton9.BackgroundColor3 = Color3.fromRGB(200, 55, 55)
    end)
    TextButton10.MouseButton1Click:Connect(function()
        t2.value69 = {}
        t2.value70 = 0
        TextLabel4.Text = "0 events"

        if t2.value68 then
            for _, child in ipairs(t2.value68:GetChildren()) do
                local v509 = not child:IsA("UIListLayout")

                if v509 then
                    v509 = not child:IsA("UIPadding")
                end

                if v509 then
                    child:Destroy()
                end
            end

            t2.value68.CanvasSize = UDim2.new(0, 0, 0, 0)
        end
    end)
    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(1, -124, 0, 24)
    TextBox.Position = UDim2.new(0, 8, 0, 42)
    TextBox.BackgroundColor3 = t2.value24
    TextBox.BackgroundTransparency = 0.15
    TextBox.Text = ""
    TextBox.PlaceholderText = "Search logs..."
    TextBox.TextColor3 = t2.value23
    TextBox.PlaceholderColor3 = t2.value27
    TextBox.Font = Enum.Font.GothamMedium
    TextBox.TextSize = 11
    TextBox.ZIndex = 21
    TextBox.BorderSizePixel = 0
    TextBox.Parent = t2.value65
    Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 5)
    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingLeft = UDim.new(0, 8)
    UIPadding.Parent = TextBox
    local TextButton11 = Instance.new("TextButton")
    TextButton11.Size = UDim2.new(0, 100, 0, 24)
    TextButton11.Position = UDim2.new(1, -108, 0, 42)
    TextButton11.BackgroundColor3 = t2.value25
    TextButton11.Text = "Filter: All"
    TextButton11.TextColor3 = t2.value23
    TextButton11.Font = Enum.Font.GothamMedium
    TextButton11.TextSize = 11
    TextButton11.ZIndex = 21
    TextButton11.BorderSizePixel = 0
    TextButton11.Parent = t2.value65
    Instance.new("UICorner", TextButton11).CornerRadius = UDim.new(0, 5)
    local Frame27 = Instance.new("Frame")
    Frame27.Size = UDim2.new(0, 120, 0, 100)
    Frame27.Position = UDim2.new(1, -128, 0, 70)
    Frame27.BackgroundColor3 = t2.value24
    Frame27.BorderSizePixel = 0
    Frame27.Visible = false
    Frame27.ZIndex = 50
    Frame27.Parent = t2.value65
    Instance.new("UICorner", Frame27).CornerRadius = UDim.new(0, 5)
    local UIListLayout5 = Instance.new("UIListLayout")
    UIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout5.Parent = Frame27
    local function v322()
        local v510 = TextBox.Text:lower()
        local v511 = ("All"):lower()

        if t2.value68 then
            for _, child in ipairs(t2.value68:GetChildren()) do
                if child:IsA("Frame") and child:FindFirstChild("LogText") then
                    local v514 = child.LogText.Text:lower()

                    child.Visible = v510 == "" or (v514:find(v510, 1, true) ~= nil or v514:find(v511, 1, true) ~= nil)
                end
            end

            task.defer(function()
                if t2.value67 then
                    t2.value68.CanvasSize = UDim2.new(0, 0, 0, t2.value67.AbsoluteContentSize.Y + 10)
                end
            end)
        end
    end
    for _, v in ipairs({
		"All",
		"Workspace",
		"ReplicatedStorage",
		"Players"
	}) do
        local v325 = v
        local TextButton12 = Instance.new("TextButton")

        TextButton12.Size = UDim2.new(1, 0, 0, 25)
        TextButton12.BackgroundColor3 = t2.value25
        TextButton12.BackgroundTransparency = 1
        TextButton12.Text = v325
        TextButton12.TextColor3 = t2.value23
        TextButton12.Font = Enum.Font.GothamMedium
        TextButton12.TextSize = 11
        TextButton12.ZIndex = 51
        TextButton12.BorderSizePixel = 0
        TextButton12.Parent = Frame27
        TextButton12.MouseEnter:Connect(function()
            TextButton12.BackgroundTransparency = 0.5
        end)
        TextButton12.MouseLeave:Connect(function()
            TextButton12.BackgroundTransparency = 1
        end)
        TextButton12.MouseButton1Click:Connect(function()
            if v325 == "ReplicatedStorage" then
                TextButton11.Text = "Filter: RepStorage"
            else
                TextButton11.Text = "Filter: " .. v325
            end

            Frame27.Visible = false
            v322()
        end)
    end
    TextButton11.MouseButton1Click:Connect(function()
        Frame27.Visible = not Frame27.Visible
    end)
    TextBox:GetPropertyChangedSignal("Text"):Connect(v322)
    t2.value68 = Instance.new("ScrollingFrame")
    t2.value68.Size = UDim2.new(1, -16, 1, -112)
    t2.value68.Position = UDim2.new(0, 8, 0, 72)
    t2.value68.BackgroundTransparency = 1
    t2.value68.BorderSizePixel = 0
    t2.value68.ScrollBarThickness = 3
    t2.value68.ScrollBarImageColor3 = t2.value21
    t2.value68.CanvasSize = UDim2.new(0, 0, 0, 0)
    t2.value68.ZIndex = 20
    t2.value68.Parent = t2.value65
    t2.value67 = Instance.new("UIListLayout")
    t2.value67.SortOrder = Enum.SortOrder.LayoutOrder
    t2.value67.Padding = UDim.new(0, 4)
    t2.value67.Parent = t2.value68
    local UIPadding2 = Instance.new("UIPadding")
    UIPadding2.PaddingTop = UDim.new(0, 4)
    UIPadding2.PaddingBottom = UDim.new(0, 4)
    UIPadding2.Parent = t2.value68
    local TextButton13 = Instance.new("TextButton")
    TextButton13.Size = UDim2.new(1, -16, 0, 28)
    TextButton13.Position = UDim2.new(0, 8, 1, -34)
    TextButton13.BackgroundColor3 = t2.value24
    TextButton13.BackgroundTransparency = 0.15
    TextButton13.Text = "Save as JSON"
    TextButton13.TextColor3 = t2.value23
    TextButton13.Font = Enum.Font.GothamMedium
    TextButton13.TextSize = 13
    TextButton13.ZIndex = 21
    TextButton13.BorderSizePixel = 0
    TextButton13.Parent = t2.value65
    Instance.new("UICorner", TextButton13).CornerRadius = UDim.new(0, 5)
    local TextButton14 = Instance.new("TextButton")
    TextButton14.Size = UDim2.new(0, 24, 0, 24)
    TextButton14.Position = UDim2.new(1, -34, 1, -64)
    TextButton14.BackgroundColor3 = t2.value21
    TextButton14.BackgroundTransparency = 0.2
    TextButton14.Text = "↓"
    TextButton14.TextColor3 = Color3.new(1, 1, 1)
    TextButton14.Font = Enum.Font.GothamBold
    TextButton14.TextSize = 14
    TextButton14.ZIndex = 25
    TextButton14.BorderSizePixel = 0
    TextButton14.Parent = t2.value65
    Instance.new("UICorner", TextButton14).CornerRadius = UDim.new(1, 0)
    TextButton14.MouseButton1Click:Connect(function()
        if t2.value68 and t2.value67 then
            local v515 = t2.value67.AbsoluteContentSize.Y + 10
            local AbsoluteSizeY = t2.value68.AbsoluteSize.Y

            t2.value68.CanvasPosition = Vector2.new(0, (math.max(0, v515 - AbsoluteSizeY)))
        end
    end)
    TextButton13.MouseEnter:Connect(function()
        t2.value3:Create(TextButton13, TweenInfo.new(0.2), {
			BackgroundColor3 = t2.value25
		}):Play()
    end)
    TextButton13.MouseLeave:Connect(function()
        t2.value3:Create(TextButton13, TweenInfo.new(0.2), {
			BackgroundColor3 = t2.value24
		}):Play()
    end)
    TextButton13.MouseButton1Click:Connect(function()
        if not writefile then
            return
        end

        pcall(function()
            if isfolder then
                if not isfolder("logger") then
                    makefolder("logger")
                end
            else
                pcall(makefolder, "logger")
            end

            local v561 = os.date("%Y-%m-%d_%H-%M-%S")
            local v562 = "logger/" .. tostring(game.Name):gsub("[\\/:*?\"<>|%c]", "_") .. "_triggers_" .. v561 .. ".json"
            local t13 = {}

            for _, v in ipairs(t2.value69) do
                table.insert(t13, "  {\"Time\":" .. v.Time .. ",\"Type\":\"" .. v.Type .. "\",\"Name\":\"" .. v.Name .. "\",\"Path\":\"" .. v.Path .. "\",\"Args\":" .. v.ArgsStr .. "}")
            end

            writefile(v562, "[\n" .. table.concat(t13, ",\n") .. "\n]")
            TextButton13.Text = "Saved!"
            task.delay(2, function()
                TextButton13.Text = "Save as JSON"
            end)
        end)
    end)
    for _, v in ipairs(t2.value69) do
        t2.value76(v.Type, v.Path, v.ArgsStr, v.Time)
    end
    TextLabel4.Text = tostring(#t2.value69) .. " events"
    t2.value68:GetPropertyChangedSignal("CanvasSize"):Connect(function()
        TextLabel4.Text = tostring(t2.value70) .. " events"
    end)
    local u332
    local inputPosition
    local value65Position
    Frame25.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            u332 = true
            inputPosition = input.Position
            value65Position = t2.value65.Position
        end
    end)
    Frame25.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            u332 = false
        end
    end)
    t2.value2.InputChanged:Connect(function(input)
        local v520 = u332

        if v520 then
            v520 = input.UserInputType == Enum.UserInputType.MouseMovement
        end

        if v520 then
            local v521 = input.Position - inputPosition

            t2.value65.Position = UDim2.new(value65Position.X.Scale, value65Position.X.Offset + v521.X, value65Position.Y.Scale, value65Position.Y.Offset + v521.Y)
        end
    end)
end
function _G.CloseTriggerLogger()
    t2.value66 = false

    if t2.value65 then
        t2.value65:Destroy()
    end
end
t2.value77 = nil
if hookmetamethod then
    t2.value77 = hookmetamethod(game, "__namecall", function(p104, ...)
        local v336 = getnamecallmethod()

        if t2.value66 then
            if v336 == "FireServer" or v336 == "InvokeServer" then
                local success, result = pcall(t2.value75, { ... })
                if not success then
                    result = "\"[error]\""
                end
                local str = tostring(p104.Name)
                local str4 = tostring(p104:GetFullName())
                local timestamp = os.time()
                local t15 = {
					Type = v336,
					Name = str,
					Path = str4,
					ArgsStr = result,
					Time = timestamp
				}
                table.insert(t2.value69, t15)
                task.spawn(t2.value76, v336, t15.Path, result, t15.Time)
            elseif v336 == "Fire" or v336 == "Invoke" then
                local ok, result = pcall(function()
                    return p104.ClassName
                end)

                if ok then
                    ok = result == "BindableEvent" or result == "BindableFunction"
                end

                if ok then
                    local success, result = pcall(t2.value75, { ... })
                    if not success then
                        result = "\"[error]\""
                    end
                    local v347 = "Bindable:" .. v336
                    local str = tostring(p104.Name)
                    local str5 = tostring(p104:GetFullName())
                    local timestamp = os.time()
                    local t17 = {
						Type = v347,
						Name = str,
						Path = str5,
						ArgsStr = result,
						Time = timestamp
					}
                    table.insert(t2.value69, t17)
                    task.spawn(t2.value76, "Bindable:" .. v336, t17.Path, result, t17.Time)
                end
            end
        end

        return t2.value77(p104, ...)
    end)
end
t2.value78 = t2.value1.LocalPlayer
local function v23(p105, p106, p107)
    if not t2.value66 then
        return
    end
    local s4 = ""
    pcall(function()
        s4 = p106:GetFullName()
    end)
    if s4 == "" then
        s4 = tostring(p106)
    end
    local s5 = ""
    pcall(function()
        s5 = p106.Name
    end)
    if p107 then
        p107 = "\"" .. tostring(p107) .. "\""
    end
    if not p107 then
        p107 = "\"" .. tostring(s5) .. "\""
    end
    local v357 = s5
    local v358 = s4
    local v359 = "[" .. p107 .. "]"
    local timestamp = os.time()
    local t18 = {
		Type = p105,
		Name = v357,
		Path = v358,
		ArgsStr = v359,
		Time = timestamp
	}
    table.insert(t2.value69, t18)
    task.spawn(t2.value76, p105, s4, "[" .. p107 .. "]", t18.Time)
end
t2.value79 = {}
local t19 = {
	Motor6D = true,
	Weld = true,
	WeldConstraint = true,
	BallSocketConstraint = true,
	HingeConstraint = true,
	AnimationController = true,
	Animator = true,
	Animation = true,
	AnimationTrack = true,
	Bone = true,
	BodyPosition = true,
	BodyVelocity = true,
	BodyGyro = true,
	BodyAngularVelocity = true,
	VectorForce = true,
	AlignPosition = true,
	AlignOrientation = true,
	LinearVelocity = true,
	AngularVelocity = true,
	Highlight = true,
	SelectionBox = true,
	BillboardGui = true,
	SurfaceAppearance = true,
	SpecialMesh = true,
	Decal = true,
	Texture = true,
	ParticleEmitter = true,
	Trail = true,
	Attachment = true,
	Sound = true,
	NumberValue = true,
	StringValue = true,
	BoolValue = true,
	IntValue = true,
	CFrameValue = true,
	Vector3Value = true,
	ObjectValue = true
}
t2.value80 = nil
t2.value81 = t19
local function v25(p108)
    local str = tostring(p108)

    if t2.value79[str] then
        return
    end

    t2.value79[str] = true
    pcall(function()
        if p108:IsA("Humanoid") then
            p108:GetPropertyChangedSignal("Health"):Connect(function()
                v23("HEALTH", p108, string.format("%.1f / %.1f", p108.Health, p108.MaxHealth))
            end)
            p108:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                v23("WALKSPEED", p108, p108.WalkSpeed)
            end)
            p108:GetPropertyChangedSignal("JumpPower"):Connect(function()
                v23("JUMPPOWER", p108, p108.JumpPower)
            end)
        end

        p108.AttributeChanged:Connect(function(attribute)
            local str6
            pcall(function()
                str6 = tostring(p108:GetAttribute(attribute))
            end)
            v23("ATTR_CHANGE", p108, attribute .. "=")
        end)
    end)
end
function t2.value80(p109, p110)
    pcall(function()
        p109.ChildAdded:Connect(function(child)
            v23(p110 .. "_ADD", child)
            pcall(v25, child)
            pcall(function()
                child.ChildAdded:Connect(function(child2)
                    v23(p110 .. "_CHILD_ADD", child2)
                end)
                child.ChildRemoved:Connect(function(child3)
                    v23(p110 .. "_CHILD_REMOVE", child3)
                end)
            end)
        end)
        p109.ChildRemoved:Connect(function(child)
            v23(p110 .. "_REMOVE", child)
        end)

        for _, child in ipairs(p109:GetChildren()) do
            pcall(v25, child)
        end
    end)
end
function t2.value82(p111)
    t2.value80(p111, "CHAR")
    p111.DescendantAdded:Connect(function(descendant)
        local ok, result = pcall(function()
            return descendant.ClassName
        end)

        if ok then
            ok = t2.value81[result]
        end

        if ok then
            return
        end

        v23("CHAR_DESC_ADD", descendant)
        pcall(v25, descendant)
    end)
    p111.DescendantRemoving:Connect(function(descendant)
        local u528 = descendant
        local ok, result = pcall(function()
            return u528.ClassName
        end)
        if ok then
            ok = t2.value81[result]
        end
        if ok then
            return
        end
        v23("CHAR_DESC_REMOVE", u528)
    end)

    for _, descendant in ipairs(p111:GetDescendants()) do
        pcall(v25, descendant)
    end
end
pcall(function()
    local Backpack = t2.value78:WaitForChild("Backpack", 5)

    if Backpack then
        t2.value80(Backpack, "INV")
    end
end)
t2.value80(t2.value78, "PLAYER")

if t2.value78.Character then
    pcall(t2.value82, t2.value78.Character)
end
t2.value78.CharacterAdded:Connect(function(character)
    task.wait()
    pcall(t2.value82, character)
end)
t2.value83 = nil
t2.value83 = {}
t2.value84 = nil
function t2.value84(p112)
    local str = tostring(p112)

    if t2.value83[str] then
        return
    end

    t2.value83[str] = true

    local s6 = ""

    pcall(function()
        s6 = p112:GetFullName()
    end)

    if s6:find("TriggerLoggerWin", 1, true) then
        return
    end

    pcall(function()
        local _ = p112.ClassName

        if p112:IsA("GuiButton") then
            p112.MouseButton1Click:Connect(function()
                if not t2.value66 then
                    return
                end

                local v570 = v23
                local v571 = p112
                local v572 = p112.Text ~= ""

                if v572 then
                    v572 = p112.Text
                end

                if not v572 then
                    v572 = p112.Name
                end

                v570("GUI_CLICK", v571, v572)
            end)
            p112.MouseButton2Click:Connect(function()
                if not t2.value66 then
                    return
                end

                local v573 = v23
                local v574 = p112
                local v575 = p112.Text ~= ""

                if v575 then
                    v575 = p112.Text
                end

                if not v575 then
                    v575 = p112.Name
                end

                v573("GUI_RCLICK", v574, v575)
            end)
        end

        if p112:IsA("TextBox") then
            p112.FocusLost:Connect(function(enterPressed)
                if not t2.value66 then
                    return
                end

                if enterPressed then
                    v23("GUI_INPUT", p112, p112.Text)
                end
            end)
        end
    end)
end
function t2.value85(p113)
    for _, descendant in ipairs(p113:GetDescendants()) do
        pcall(t2.value84, descendant)
    end

    p113.DescendantAdded:Connect(function(descendant)
        pcall(t2.value84, descendant)
    end)
end
pcall(function()
    local PlayerGui = t2.value78:WaitForChild("PlayerGui", 5)

    if PlayerGui then
        t2.value85(PlayerGui)
    end
end)
warn("[UNDETECTED] Launcher loaded. Version: v1.2")
warn("[UNDETECTED] UNDETECTED Launcher supported by diser.me")
setclipboard("https://discord.gg/3KjWyZ6uBu")
