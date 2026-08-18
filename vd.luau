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
local t2 = {
	value1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))(),
	value2 = game:GetService("Players"),
	value3 = game:GetService("RunService")
}

game:GetService("TweenService")
t2.value4 = game:GetService("Workspace")
game:GetService("Teams")
t2.value5 = game:GetService("ReplicatedStorage")
t2.value6 = game:GetService("Lighting")
t2.value7 = t2.value2.LocalPlayer
t2.value8 = 100
t2.value9 = "Skillcheck-gen"
t2.value10 = false
t2.value11 = false
t2.value12 = false
t2.value13 = false
t2.value14 = false
t2.value15 = false
t2.value16 = 0.5
local value6Ambient = t2.value6.Ambient
local OutdoorAmbient = t2.value6.OutdoorAmbient
t2.value17 = value6Ambient
t2.value18 = OutdoorAmbient
t2.value19 = {}
t2.value20 = {}
t2.value21 = nil
t2.value22 = nil
t2.value23 = nil
t2.value24 = nil
t2.value25 = nil
t2.value26 = {}
t2.value27 = nil
t2.value28 = false
t2.value29 = 200
t2.value30 = "Head"
t2.value31 = true
t2.value32 = false
local function v5()
    local CurrentCamera = t2.value4.CurrentCamera
    local vector2 = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y / 2)
    local v83
    local value29 = t2.value29
    for _, player in ipairs(t2.value2:GetPlayers()) do
        if player ~= t2.value7 and player.Character then
            local value31 = t2.value31

            if value31 then
                value31 = player.Team == t2.value7.Team
            end

            if not value31 then
                local t2value30 = player.Character:FindFirstChild(t2.value30)

                if t2value30 then
                    local v89, v90 = CurrentCamera:WorldToViewportPoint(t2value30.Position)

                    if v90 then
                        local Magnitude = (vector2 - Vector2.new(v89.X, v89.Y)).Magnitude

                        if Magnitude < value29 then
                            value29 = Magnitude
                            v83 = player
                        end
                    end
                end
            end
        end
    end

    return v83
end
t2.value33 = nil
t2.value7:GetMouse()
t2.value34 = game:GetService("VirtualInputManager")

function t2.value35(p1, p2)
    if type(p2) == "string" then
        p2 = { p2 }
    end

    local GetChildren = p1.GetChildren

    for _, v in ipairs(GetChildren(p1)) do
        local v110 = string.lower(v.Name)

        for _, v2 in ipairs(p2) do
            if string.find(v110, string.lower(v2)) then
                return v
            end
        end
    end

    return nil
end
function t2.value36()
    local Remotes = t2.value5:FindFirstChild("Remotes")

    if Remotes then
        Remotes = t2.value5.Remotes:FindFirstChild("Generator")

        if Remotes then
            Remotes = t2.value5.Remotes.Generator:FindFirstChild("RepairEvent")
        end
    end

    return Remotes
end
function t2.value37(p3)
    if not p3 or not p3.Team then
        return false
    end

    return string.find(string.lower(p3.Team.Name), "killer") ~= nil
end
function t2.value38()
    local t3 = {}

    for _, descendant in ipairs(t2.value4:GetDescendants()) do
        local v124 = descendant.Name == "Generator"

        if v124 then
            v124 = descendant:IsA("Model")
        end

        if v124 then
            table.insert(t3, descendant)
        end
    end

    return t3
end
function t2.value39(p4)
    for i = 1, 4 do
        local v127 = p4:FindFirstChild("GeneratorPoint" .. i)
        local v128 = v127

        if v127 then
            v128 = v127:IsA("BasePart")
        end

        if v128 then
            return v127
        end
    end

    local PrimaryPart = p4.PrimaryPart

    if not PrimaryPart then
        PrimaryPart = p4:FindFirstChildWhichIsA("BasePart")
    end

    return PrimaryPart
end
function t2.value40(p5, p6, p7, p8)
    local t4 = {}
    local BoxHandleAdornment = Instance.new("BoxHandleAdornment")

    if p8 then
        p8 = Vector3.new(4, 6, 4)
    end

    if not p8 then
        p8 = Vector3.new(4, 4, 4)
    end

    BoxHandleAdornment.Size = p8
    BoxHandleAdornment.AlwaysOnTop = true
    BoxHandleAdornment.ZIndex = 5
    BoxHandleAdornment.Transparency = 0.5
    BoxHandleAdornment.Color3 = p7
    BoxHandleAdornment.Adornee = p5
    BoxHandleAdornment.Parent = p5
    t4.box = BoxHandleAdornment

    local BillboardGui = Instance.new("BillboardGui")

    BillboardGui.Size = UDim2.new(0, 150, 0, 40)
    BillboardGui.StudsOffset = Vector3.new(0, 4.5, 0)
    BillboardGui.AlwaysOnTop = true
    BillboardGui.Adornee = p5
    BillboardGui.Parent = p5

    local TextLabel = Instance.new("TextLabel", BillboardGui)

    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = p7
    TextLabel.TextSize = 12
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = p6
    TextLabel.TextStrokeTransparency = 0.5
    t4.gui = BillboardGui
    t4.label = TextLabel

    return t4
end
local value1 = t2.value1
local uDim = UDim.new(1, 0)
local CreateWindow = value1.CreateWindow
local colorSequence = ColorSequence.new(Color3.fromHex("#30FF6A"), Color3.fromHex("#e7ff2f"))

t2.value41 = CreateWindow(value1, {
	Title = "ANCH Hax crack",
	Author = "CRACKED BY https://discord.gg/3KjWyZ6uBu",
	Icon = "anchor",
	Folder = "ANCHHax",
	OpenButton = {
		Enabled = true,
		Draggable = false,
		OnlyIcon = false,
		CornerRadius = uDim,
		StrokeThickness = 3,
		Title = "ANCH Hax crack",
		Color = colorSequence
	}
})
local value41 = t2.value41
local color3 = Color3.fromHex("#18c426")

value41:Tag({
	Title = "V1488.0",
	Color = color3,
	Border = true
})
t2.value41:DisableTopbarButtons({ "Fullscreen" })

local value41_2 = t2.value41
local Tab = value41_2.Tab
local color3_2 = Color3.fromRGB(255, 170, 50)
local v15 = Tab(value41_2, {
	Title = "Info",
	Desc = "Important Information & Updates",
	Icon = "solar:info-circle-bold",
	IconColor = color3_2,
	IconShape = "Square",
	Border = true
})
local value7 = t2.value7
local Section = v15.Section
local v18 = "Hello " .. value7.Name .. "!"
local SemiBold = Enum.FontWeight.SemiBold
Section(v15, {
	Title = v18,
	TextSize = 20,
	FontWeight = SemiBold
})
local SemiBold2 = Enum.FontWeight.SemiBold
v15:Section({
	Title = "⚠\239\184\143 Development Notice:\n\nThis script is still under development!\nThere is a possibility it may get detected if used in public servers.\n\nNeed help or just wanna hang out?\nJoin our Discord server below!",
	TextSize = 18,
	TextTransparency = 0.35,
	FontWeight = SemiBold2,
	Box = true,
	BoxBorder = true,
	Opened = true
})
t2.value42 = "RbPdBpV4Mc"
local v21 = "https://discord.com/api/v10/invites/" .. t2.value42 .. "?with_counts=true&with_expiration=true"
t2.value43 = nil
t2.value43 = v21
local ok, result = pcall(function()
    local HttpService = game:GetService("HttpService")
    local HttpService2 = game:GetService("HttpService")
    local value43 = t2.value43
    local RequestAsync = HttpService2.RequestAsync
    local t5 = {
		["User-Agent"] = "ANCH-Hub/1.0",
		Accept = "application/json"
	}

    return HttpService:JSONDecode(RequestAsync(HttpService2, {
		Url = value43,
		Method = "GET",
		Headers = t5
	}).Body)
end)

t1.value1 = result
if ok then
    ok = t1.value1 and t1.value1.guild
end
if ok then
    t1.value2 = Enum.FontWeight.SemiBold
    v15:Section({
		Title = "💬 Join our Discord server!",
		TextSize = 20,
		FontWeight = t1.value2
	})
    v15:Space()

    local str = tostring(t1.value1.guild.name)
    local str2 = tostring(t1.value1.guild.description or "Official ANCH Hub Discord Server")

    t1.value2 = "https://cdn.discordapp.com/icons/" .. t1.value1.guild.id .. "/" .. t1.value1.guild.icon .. ".png?size=1024"
    t1.value3 = "Thumbnail"
    t1.value8 = t1.value1.guild.banner
    t1.value6 = t1.value8

    if t1.value8 then
        t1.value6 = "https://cdn.discordapp.com/banners/" .. t1.value1.guild.id .. "/" .. t1.value1.guild.banner .. ".png?size=512"
    end

    t1.value4 = t1.value6 or nil

    function t1.value10()
        if setclipboard then
            setclipboard("https://discord.gg/3KjWyZ6uBu/" .. t2.value42)
            t2.value1:Notify({
				Title = "Discord Link Copied!",
				Content = "Link has been copied to clipboard."
			})

            return
        end

        t2.value1:Notify({
			Title = "Clipboard Not Supported",
			Content = "Check console for link."
		})
        print("Discord: https://discord.gg/3KjWyZ6uBu" .. t2.value42)
    end

    t1.value9 = {
		Title = "Copy link",
		Icon = "link",
		Callback = t1.value10
	}

    local Paragraph = v15.Paragraph
    local t6 = {
		Title = "Open Discord",
		Icon = "solar:chat-round-line-bold",
		Callback = function()
        t2.value1:Notify({
				Title = "Opening Discord",
				Content = "Check your browser!"
			})

        local _syn = syn

        if _syn then
            _syn = syn.request
        end

        if _syn then
            syn.request({
					Url = "https://discord.gg/" .. t2.value42,
					Method = "GET"
				})
        end
    end
	}

    t1.value8 = {
		t1.value9,
		t6
	}
    Paragraph(v15, {
		Title = str,
		Desc = str2,
		Image = t1.value2,
		[v767] = t1.value4,
		ImageSize = 48,
		Buttons = t1.value8
	})

    if t1.value1.approximate_member_count then
        v15:Space()
        t1.value3 = tostring(t1.value1.approximate_member_count)

        local v28 = "👥 Members: " .. t1.value3 .. " | 🟢 Online: " .. tostring(t1.value1.approximate_presence_count or "N/A")

        t1.value7 = Enum

        local Section2 = v15.Section

        t1.value5 = t1.value7.FontWeight.Regular
        Section2(v15, {
			Title = v28,
			TextSize = 14,
			TextTransparency = 0.4,
			FontWeight = t1.value5
		})
    end
else
    t1.value4 = Enum

    local Section3 = v15.Section

    t1.value2 = t1.value4.FontWeight.SemiBold
    Section3(v15, {
		Title = "💬 Join our Discord server!",
		TextSize = 20,
		FontWeight = t1.value2
	})
    v15:Space()

    local color3_3 = Color3.fromHex("#5865F2")
    local Button = v15.Button

    function t1.value8()
        if setclipboard then
            setclipboard("https://discord.gg/3KjWyZ6uBu/" .. t2.value42)
            t2.value1:Notify({
				Title = "Discord Link Copied!",
				Content = "Link has been copied to clipboard."
			})

            return
        end

        print("Discord: https://discord.gg/" .. t2.value42)
    end

    Button(v15, {
		Title = "Copy Discord Link",
		Color = color3_3,
		Justify = "Center",
		Icon = "solar:chat-round-line-bold",
		IconAlign = "Left",
		Callback = t1.value8
	})
end
v15:Space({
	Columns = 3
})
local v33 = v15:Section({
	Title = "⚠\239\184\143 Use at your own risk!"
})
v33:Space()
t1.value2 = Enum.FontWeight
local Section4 = v33.Section
local Regular = t1.value2.Regular
Section4(v33, {
	Title = "By using ANCH Hub, you acknowledge that:\n\n• This script may be detected by anti-cheat systems\n• Your account could potentially be banned\n• The developer is not responsible for any consequences\n• Always use in private servers when possible",
	TextSize = 15,
	TextTransparency = 0.4,
	FontWeight = Regular
})
local v36 = v15:Section({
	Title = "👤 Credits & Information"
})
v36:Space()
local v37 = "ANCH Hub - Violence District Script\n\nDeveloper: ANCH\nVersion: 2.0 (Stable Release)\nUI Library: Wind UI by Footagesus\nGame: Violence District (Roblox)\n\nLast Updated: " .. os.date("%B %d, %Y")
local Section5 = v36.Section
t1.value2 = Enum.FontWeight.Regular
Section5(v36, {
	Title = v37,
	TextSize = 15,
	TextTransparency = 0.35,
	FontWeight = t1.value2
})
local v39 = v15:Section({
	Title = "✨ Features Overview"
})
v39:Space()
local Section6 = v39.Section
t1.value3 = Enum.FontWeight.Regular
Section6(v39, {
	Title = [[Current Features:

🎯 Auto-Farm Generator (with killer detection)
🎁 Auto-Farm Christmas Presents  
🔫 Auto Aim System
👁️ ESP for Survivors, Killers & Generators
🏃 Movement: NoClip, Blink Speed
📍 Teleportation: Players & Generators
🔍 Unlimited Camera Zoom
🌟 Full Bright Lighting
🎨 Body Lock / Target Lock]],
	TextSize = 14,
	TextTransparency = 0.3,
	FontWeight = t1.value3
})
v15:Space({
	Columns = 2
})
local color3_4 = Color3.fromHex("#30d5ff")
local Button = v15.Button
function t1.value7()
    t2.value1:Notify({
		Title = "Keybinds",
		Content = "RightShift or Insert = Toggle UI\nESC = Close UI"
	})
end
Button(v15, {
	Title = "Show Keybinds",
	Color = color3_4,
	Justify = "Center",
	Icon = "solar:keyboard-bold",
	IconAlign = "Left",
	Callback = t1.value7
})
v15:Space({
	Columns = 1
})
local color3_5 = Color3.fromHex("#a2ff30")
local Button2 = v15.Button
function t1.value7()
    t2.value1:Notify({
		Title = "V2.0 Changelog",
		Content = "All features stable & New UI Design."
	})
end
Button2(v15, {
	Title = "Changelog",
	Color = color3_5,
	Justify = "Center",
	Icon = "solar:document-text-bold",
	IconAlign = "Left",
	Callback = t1.value7
})
v15:Space({
	Columns = 1
})
local color3_6 = Color3.fromHex("#ff4830")
local Button3 = v15.Button
function t1.value7()
    if t2.value21 then
        t2.value21:Disconnect()
    end

    if t2.value22 then
        t2.value22:Disconnect()
    end

    if t2.value23 then
        t2.value23:Disconnect()
    end

    if t2.value33 then
        t2.value33:Destroy()
    end

    _G.NoSkill = false
    t2.value28 = false
    t2.value1:Notify({
		Title = "ANCH Hub",
		Content = "UI destroyed. Thanks for using!"
	})
    task.wait(1)
    t2.value41:Destroy()
end
Button3(v15, {
	Title = "Destroy UI",
	Color = color3_6,
	Justify = "Center",
	Icon = "solar:trash-bin-trash-bold",
	IconAlign = "Left",
	Callback = t1.value7
})
local value41_3 = t2.value41
local color3_7 = Color3.fromRGB(255, 170, 50)
local v49 = value41_3:Tab({
	Title = "General",
	Icon = "solar:home-2-bold",
	IconColor = color3_7,
	IconShape = "Square",
	Border = true
})
v49:Toggle({
	Title = "NoClip",
	Desc = "Walk through walls",
	Callback = function(p9)
    if p9 then
        t2.value21 = t2.value3.Stepped:Connect(function()
            if t2.value7.Character then
                for _, descendant in pairs(t2.value7.Character:GetDescendants()) do
                    if descendant:IsA("BasePart") then
                        descendant.CanCollide = false
                    end
                end
            end
        end)

        return
    end

    if t2.value21 then
        t2.value21:Disconnect()
    end
end
})
v49:Toggle({
	Title = "Flicker/Blink Speed",
	Desc = "Fast movement with blink effect",
	Callback = function(p10)
    t2.value15 = p10

    if p10 then
        t2.value22 = t2.value3.Heartbeat:Connect(function()
            local Character = t2.value7.Character

            if Character then
                Character = t2.value7.Character:FindFirstChild("HumanoidRootPart")
            end

            local v216 = Character

            if Character then
                v216 = Character.AssemblyLinearVelocity.Magnitude > 0.1
            end

            if v216 then
                Character.CFrame = Character.CFrame + Character.CFrame.lookVector * t2.value16
            end
        end)

        return
    end

    if t2.value22 then
        t2.value22:Disconnect()
    end
end
})
v49:Space({
	Columns = 2
})
local Section7 = v49.Section
local SemiBold3 = Enum.FontWeight.SemiBold
Section7(v49, {
	Title = "Teleportation",
	TextSize = 20,
	FontWeight = SemiBold3
})
v49:Space()
t2.value44 = v49:Dropdown({
	Title = "Select Player Target",
	Values = {},
	Callback = function(p11)
    t2.value24 = p11
end
})
v49:Button({
	Title = "Refresh Player List",
	Icon = "solar:refresh-bold",
	Callback = function()
    local t7 = {}

    for _, player in ipairs(t2.value2:GetPlayers()) do
        if player ~= t2.value7 then
            table.insert(t7, player.Name)
        end
    end

    t2.value44:Refresh(t7)

    if t2.value27 then
        t2.value27:Refresh(t7)
    end

    local value1_2 = t2.value1
    local v143 = #t7
    local Notify = value1_2.Notify
    local v145 = "Refreshed! Found " .. v143 .. " players."

    Notify(value1_2, {
			Title = "Player List",
			Content = v145
		})
end
})
local color3_8 = Color3.fromHex("#30d5ff")

v49:Button({
	Title = "TP to Selected Player",
	Icon = "solar:user-bold",
	Color = color3_8,
	Callback = function()
    local v146 = t2.value2:FindFirstChild(t2.value24 or "")
    local v147 = v146

    if v146 then
        v147 = v146.Character

        if v147 then
            v147 = v146.Character:FindFirstChild("HumanoidRootPart")
        end
    end

    if v147 then
        t2.value7.Character.HumanoidRootPart.CFrame = v146.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)

        local value1_3 = t2.value1
        local v149 = "Teleported to " .. v146.Name

        value1_3:Notify({
				Title = "Teleported",
				Content = v149
			})

        return
    end

    t2.value1:Notify({
			Title = "Error",
			Content = "Player not found or invalid!"
		})
end
})
v49:Space({
	Columns = 1
})
t2.value45 = v49:Dropdown({
	Title = "Select Generator Target",
	Values = {},
	Callback = function(p12)
    t2.value25 = p12
end
})
v49:Button({
	Title = "Refresh Generator List",
	Icon = "solar:refresh-bold",
	Callback = function()
    t2.value26 = {}

    local t8 = {}

    for i, v in ipairs(t2.value38()) do
        local v154 = "Generator " .. i

        t2.value26[v154] = v
        table.insert(t8, v154)
    end

    t2.value45:Refresh(t8)

    local value1_4 = t2.value1
    local Notify = value1_4.Notify
    local v157 = "Found " .. #t8 .. " generators."

    Notify(value1_4, {
			Title = "Generator List",
			Content = v157
		})
end
})
local Button4 = v49.Button
local color3_9 = Color3.fromHex("#a2ff30")

function t1.value2()
    if t2.value25 and t2.value26[t2.value25] then
        local v158 = t2.value39(t2.value26[t2.value25])

        if v158 then
            t2.value7.Character.HumanoidRootPart.CFrame = v158.CFrame * CFrame.new(0, 3, 3)

            local value1_5 = t2.value1
            local Notify = value1_5.Notify
            local v161 = "Teleported to " .. t2.value25

            Notify(value1_5, {
				Title = "Teleported",
				Content = v161
			})

            return
        end
    else
        t2.value1:Notify({
			Title = "Error",
			Content = "Please select a generator first!"
		})
    end
end
Button4(v49, {
	Title = "TP to Selected Generator",
	Icon = "solar:electric-refueling-bold",
	Color = color3_9,
	Callback = t1.value2
})
local value41_4 = t2.value41
t1.value2 = Color3.fromRGB(255, 170, 50)

local v56 = value41_4:Tab({
	Title = "Survivor",
	Icon = "solar:check-square-bold",
	IconColor = t1.value2,
	IconShape = "Square",
	Border = true
})
t1.value1 = {
	Title = "Auto-Farm Generator",
	Desc = "Auto teleport & complete generator",
	Callback = function(p13)
    t2.value13 = p13

    if p13 then
        task.spawn(function()
            local g231
            while t2.value13 do
                local v217 = t2.value36()
                local v218 = t2.value38()
                local t9 = {}
                for v222, v223 in ipairs(v218) do

                    if (v223:GetAttribute("RepairProgress") or 0) < 100 then
                        table.insert(t9, v223)
                    end
                end
                if #t9 > 0 and v217 then
                    local v224 = t9[math.random(1, #t9)]
                    local v225 = t2.value39(v224)

                    t2.value7.Character.HumanoidRootPart.CFrame = v225.CFrame * CFrame.new(0, 2, 3)
                    task.wait(0.5)
                    v217:FireServer(v225, true)

                    if t2.value13 then
                        if not ((v224:GetAttribute("RepairProgress") or 0) >= 100) then
                        end
                    end

                    repeat
                        task.wait(0.5)

                        local v226 = false
                        local v227, v228, v229 = ipairs(t2.value2:GetPlayers())

                        repeat
                            local v230

                            v229, v230 = v227(v228, v229)

                            if not v229 then
                                g231 = true
                            end

                            if g231 then
                                break
                            end

                            local v232 = t2.value37(v230)

                            if v232 then
                                v232 = v230.Character

                                if v232 then
                                    v232 = v230.Character:FindFirstChild("HumanoidRootPart")
                                end
                            end
                        until v232 and (t2.value7.Character.HumanoidRootPart.Position - v230.Character.HumanoidRootPart.Position).Magnitude < t2.value8

                        if not g231 then
                            v226 = true
                        end

                        g231 = false

                        if v226 then
                            break
                        end

                        local v233 = not t2.value13

                        if not v233 then
                            v233 = (v224:GetAttribute("RepairProgress") or 0) >= 100
                        end
                    until v233

                    v217:FireServer(v225, false)
                    task.wait(1.5)
                else
                    task.wait(2)
                end
            end
        end)
    end
end
}
v56:Toggle(t1.value1)
t2.value46 = false
local Toggle = v56.Toggle
function t1.value2(p14)
    t2.value46 = p14

    if p14 then
        t2.value1:Notify({
			Title = "Auto-Farm Present",
			Content = "Started!"
		})
        task.spawn(function()
            while t2.value46 do
                local ok2, result2 = pcall(function()
                    local Map = t2.value4:FindFirstChild("Map")
                    if not Map then
                        task.wait(3)

                        return
                    end
                    local v242 = t2.value35(Map, {
						"chris",
						"christmas"
					})
                    if not v242 then
                        task.wait(3)

                        return
                    end
                    local v243 = t2.value35(v242, { "gift" })
                    if not v243 then
                        task.wait(3)

                        return
                    end
                    local t10 = {}
                    local v245, v246, v247 = ipairs(v243:GetChildren())
                    local g263
                    local ChristmasTree
                    while true do
                        local v248

                        v247, v248 = v245(v246, v247)

                        if not v247 then
                            break
                        end

                        if string.find(string.lower(v248.Name), "gift") then
                            local v249 = v248:FindFirstChild("GiftHandle") or v248:FindFirstChildWhichIsA("BasePart")

                            if v249 then
                                table.insert(t10, {
									model = v248,
									handle = v249
								})
                            end
                        end
                    end
                    if #t10 == 0 then
                        t2.value1:Notify({
							Title = "Info",
							Content = "No gifts available, waiting..."
						})
                        task.wait(3)

                        return
                    end
                    local v250 = t10[1]
                    local Character = t2.value7.Character
                    if Character then
                        Character = t2.value7.Character:FindFirstChild("HumanoidRootPart")
                    end
                    if Character then
                        t2.value7.Character.HumanoidRootPart.CFrame = v250.handle.CFrame * CFrame.new(0, 3, 0)
                        task.wait(0.8)

                        local Remotes = t2.value5:FindFirstChild("Remotes")

                        if Remotes then
                            local Events = Remotes:FindFirstChild("Events")

                            if Events then
                                local Christmas = Events:FindFirstChild("Christmas")

                                if Christmas then
                                    local gift = Christmas:FindFirstChild("gift")

                                    if gift then
                                        gift:FireServer(v250.model)
                                        task.wait(0.8)
                                    else
                                        t2.value1:Notify({
											Title = "Error",
											Content = "Gift remote not found!"
										})
                                    end
                                end
                            end
                        end

                        local v256 = t2.value35(v242, {
							"tree",
							"tute"
						})

                        if v256 then
                            local children = v256:GetChildren()
                            local BasePart
                            local v259, v260, v261 = ipairs(children)
                            repeat
                                while true do
                                    local v262

                                    v261, v262 = v259(v260, v261)

                                    if not v261 then
                                        g263 = true
                                    end

                                    if g263 then
                                        break
                                    end

                                    ChristmasTree = v262:FindFirstChild("ChristmasTree")

                                    if ChristmasTree then
                                        break
                                    end

                                    BasePart = v262:FindFirstChildWhichIsA("BasePart")

                                    if BasePart then
                                        g263 = true
                                    end

                                    if g263 then
                                        break
                                    end
                                end

                                if g263 then
                                    break
                                end

                                if g263 then
                                    break
                                end

                                BasePart = ChristmasTree:FindFirstChild("TreePine") or ChristmasTree:FindFirstChildWhichIsA("BasePart")
                            until BasePart
                            g263 = false
                            if BasePart then
                                t2.value7.Character.HumanoidRootPart.CFrame = BasePart.CFrame * CFrame.new(0, 5, 3)
                                task.wait(1.5)
                            end
                        end

                        task.wait(2)
                    end
                end)

                if not ok2 then
                    local value1_6 = t2.value1
                    local str = tostring(result2)

                    value1_6:Notify({
						Title = "Critical Error",
						Content = str
					})
                    task.wait(3)
                end
            end
        end)

        return
    end

    t2.value1:Notify({
		Title = "Auto-Farm Present",
		Content = "Stopped!"
	})
end
Toggle(v56, {
	Title = "Auto-Farm Present",
	Desc = "Farm Gift → Teleport to Christmas Tree",
	Callback = t1.value2
})
function t1.value2(p15)
    _G.NoSkill = p15
    task.spawn(function()
        while _G.NoSkill do
            local PlayerGui = t2.value7:FindFirstChild("PlayerGui", true)

            if PlayerGui then
                PlayerGui = t2.value7.PlayerGui:FindFirstChild(t2.value9, true)
            end

            if PlayerGui then
                PlayerGui:Destroy()
            end

            task.wait(0.1)
        end
    end)
end
v56:Toggle({
	Title = "No Skill Check",
	Desc = "Remove Generator & Healing Skill Check",
	Callback = t1.value2
})
local value41_5 = t2.value41
t1.value4 = Color3.fromRGB(255, 170, 50)

local v59 = value41_5:Tab({
	Title = "Killer",
	Icon = "solar:ghost-bold",
	IconColor = t1.value4,
	IconShape = "Square",
	Border = true
})
local Dropdown = v59.Dropdown
function t1.value3(p16)
    t2.value24 = p16
end
t2.value27 = Dropdown(v59, {
	Title = "Select Target",
	Values = {},
	Callback = t1.value3
})
local Button5 = v59.Button
function t1.value2()
    local t11 = {}

    for _, player in ipairs(t2.value2:GetPlayers()) do
        if player ~= t2.value7 then
            table.insert(t11, player.Name)
        end
    end

    t2.value27:Refresh(t11)

    if t2.value44 then
        t2.value44:Refresh(t11)
    end
end
Button5(v59, {
	Title = "Refresh Player List",
	Callback = t1.value2
})
local Toggle2 = v59.Toggle
function t1.value4(p17)
    t2.value14 = p17

    if p17 then
        t2.value23 = t2.value3.Heartbeat:Connect(function()
            local v239 = t2.value2:FindFirstChild(t2.value24 or "")
            local v240 = v239

            if v239 then
                v240 = v239.Character

                if v240 then
                    v240 = v239.Character:FindFirstChild("HumanoidRootPart")
                end
            end

            if v240 then
                t2.value7.Character.HumanoidRootPart.CFrame = v239.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1.5)
            end
        end)

        return
    end

    if t2.value23 then
        t2.value23:Disconnect()
    end
end
Toggle2(v59, {
	Title = "Body Lock",
	Desc = "Select Target from Dropdown",
	Callback = t1.value4
})
local value41_6 = t2.value41
t1.value6 = Color3.fromRGB(255, 170, 50)

local v64 = value41_6:Tab({
	Title = "Visuals",
	Icon = "solar:eye-bold",
	IconColor = t1.value6,
	IconShape = "Square",
	Border = true
})
local Toggle3 = v64.Toggle
function t1.value5(p18)
    t2.value10 = p18
end
Toggle3(v64, {
	Title = "Survivor ESP",
	Desc = "Enable ESP to Survivor (Blue)",
	Callback = t1.value5
})
local Toggle4 = v64.Toggle
function t1.value5(p19)
    t2.value11 = p19
end
Toggle4(v64, {
	Title = "Killer ESP",
	Desc = "Enable ESP to Killer (Red)",
	Callback = t1.value5
})
local Toggle5 = v64.Toggle
function t1.value5(p20)
    t2.value12 = p20

    if not p20 then
        for _, v in pairs(t2.value20) do
            v.box:Destroy()
            v.gui:Destroy()
        end

        t2.value20 = {}
    end
end
Toggle5(v64, {
	Title = "Generator ESP",
	Desc = "Enable ESP to Generator",
	Callback = t1.value5
})
local Toggle6 = v64.Toggle
function t1.value5(p21)
    if p21 then
        t2.value7.CameraMaxZoomDistance = 100

        return
    end

    t2.value7.CameraMaxZoomDistance = 30
end
Toggle6(v64, {
	Title = "Unlimited Zoom",
	Desc = "Make your vision longer",
	Callback = t1.value5
})
function t1.value5(p22)
    t2.value6.Brightness = not p22 and 1 or 2

    local value6 = t2.value6
    local v178 = p22

    if p22 then
        v178 = Color3.new(1, 1, 1)
    end

    value6.Ambient = v178 or t2.value17

    local value6_2 = t2.value6

    if p22 then
        p22 = Color3.new(1, 1, 1)
    end

    value6_2.OutdoorAmbient = p22 or t2.value18
end
v64:Toggle({
	Title = "Full Bright",
	Desc = "Full Bright for Map",
	Callback = t1.value5
})
t2.value3.Heartbeat:Connect(function()

    for v182, v183 in ipairs(t2.value2:GetPlayers()) do

        local v184 = v183 ~= t2.value7

        if v184 then
            v184 = v183.Character

            if v184 then
                v184 = v183.Character:FindFirstChild("HumanoidRootPart")
            end
        end

        if v184 then
            local v185 = t2.value37(v183)
            local v186 = v185 and t2.value11

            if not v186 then
                v186 = not v185 and t2.value10
            end

            if v186 then
                if not t2.value19[v183] then
                    if v185 then
                        v185 = Color3.new(1, 0, 0)
                    end

                    if not v185 then
                        v185 = Color3.new(0, 0.5, 1)
                    end

                    t2.value19[v183] = t2.value40(v183.Character.HumanoidRootPart, v183.Name, v185, true)
                else
                    local v187 = math.floor((t2.value7.Character.HumanoidRootPart.Position - v183.Character.HumanoidRootPart.Position).Magnitude)
                    local label = t2.value19[v183].label
                    local Name = v183.Name

                    if v185 then
                        v185 = " [KILLER]"
                    end

                    label.Text = Name .. (v185 or " [SURVIVOR]") .. "\n" .. v187 .. "m"
                end
            elseif t2.value19[v183] then
                t2.value19[v183].box:Destroy()
                t2.value19[v183].gui:Destroy()
                t2.value19[v183] = nil
            end
        end
    end
    if t2.value12 then
        for i, v in ipairs(t2.value38()) do
            local v192 = t2.value39(v)
            local v193 = v:GetAttribute("RepairProgress") or 0

            if v192 and v193 < 100 then
                if not t2.value20[v] then
                    t2.value20[v] = t2.value40(v192, "Generator", Color3.new(0, 1, 0.5), false)
                else
                    local v194 = math.floor((t2.value7.Character.HumanoidRootPart.Position - v192.Position).Magnitude)

                    t2.value20[v].label.Text = "Gen " .. i .. " [" .. math.floor(v193) .. "%]\n" .. v194 .. "m"
                end
            elseif t2.value20[v] then
                t2.value20[v].box:Destroy()
                t2.value20[v].gui:Destroy()
                t2.value20[v] = nil
            end
        end
    end
end)

local value41_7 = t2.value41
local Tab2 = value41_7.Tab
t1.value7 = Color3.fromRGB(255, 170, 50)

local v71 = Tab2(value41_7, {
	Title = "Settings",
	Icon = "solar:settings-bold",
	IconColor = t1.value7,
	IconShape = "Square",
	Border = true
})
local Button6 = v71.Button
function t1.value6()
    if t2.value21 then
        t2.value21:Disconnect()
    end

    if t2.value22 then
        t2.value22:Disconnect()
    end

    if t2.value23 then
        t2.value23:Disconnect()
    end

    if t2.value33 then
        t2.value33:Destroy()
    end

    _G.NoSkill = false
    t2.value28 = false
    t2.value1:Notify({
		Title = "ANCH Hax",
		Content = "UI destroyed. Thanks for using!"
	})
    task.wait(1)
    t2.value41:Destroy()
end
Button6(v71, {
	Title = "Destroy UI",
	Desc = "Destroy UI & Turn Off all Feature",
	Callback = t1.value6
})
t2.value47 = nil
t2.value47 = hookmetamethod(game, "__namecall", newcclosure(function(p23, ...)
    local t12 = { ... }
    local v197 = getnamecallmethod() == "FireServer"

    if v197 then
        v197 = p23.Name == "Fire"

        if v197 then
            v197 = p23.Parent

            if v197 then
                v197 = p23.Parent.Parent
            end
        end
    end

    if v197 and (p23.Parent.Parent.Name == "Items" and t2.value28) then
        local v198 = v5()

        if v198 and v198.Character then
            local t2value30 = v198.Character:FindFirstChild(t2.value30)

            if t2value30 then
                if typeof(t12[1]) == "Vector3" then
                    t12[1] = t2value30.Position
                end

                local v200 = t12[2]

                if v200 then
                    v200 = typeof(t12[2]) == "Instance"
                end

                if v200 then
                    t12[2] = t2value30
                end

                local value1_7 = t2.value1
                local Notify = value1_7.Notify
                local v203 = "Redirected to " .. v198.Name

                Notify(value1_7, {
					Title = "Silent Aim",
					Content = v203
				})

                return t2.value47(p23, unpack(t12))
            end
        end
    end

    return t2.value47(p23, ...)
end))
task.wait(0.5)
t2.value41:SelectTab(1)
t2.value1:Notify({
	Title = "ANCH Hax",
	Content = "JOIN ANCH COMMUNITY DISCORD! https://discord.gg/3KjWyZ6uBu"
})
