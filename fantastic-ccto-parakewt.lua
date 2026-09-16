local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId

-- ئەم بەشە زۆر گرنگە بۆ ئەوەی لە سێرڤەری نوێدا مینیوەکە خۆی بێتەوە سەر شاشە:
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or (identifyexecutor and select(1, identifyexecutor()) == "Delta")
if queueteleport and type(queueteleport) == "function" then
    pcall(function()
        queueteleport([[
            loadstring(game:HttpGet("لێرەدا لینکەکەی ڕاوی گیتهەبەکەت دادەنێیت"))()
        ]])
    end)
end

-- GUI (Vortex Hub) - Premium Design
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VortexHub_ServerHop"
ScreenGui.ResetOnSpawn = false
if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game.CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = game.CoreGui
end

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -145)
MainFrame.Size = UDim2.new(0, 320, 0, 290)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)

-- Premium Outer Border Glow Effect
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 2.5
MainStroke.Color = Color3.fromRGB(120, 80, 255)

-- Title Bar with Gradient feel
local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 46)
TitleBar.BackgroundColor3 = Color3.fromRGB(26, 24, 38)
TitleBar.BorderSizePixel = 0
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 16)

local TitleFix = Instance.new("Frame", TitleBar)
TitleFix.Size = UDim2.new(1, 0, 0, 10)
TitleFix.Position = UDim2.new(0, 0, 1, -10)
TitleFix.BackgroundColor3 = Color3.fromRGB(26, 24, 38)
TitleFix.BorderSizePixel = 0

local TitleText = Instance.new("TextLabel", TitleBar)
TitleText.Size = UDim2.new(1, -40, 1, 0)
TitleText.Position = UDim2.new(0, 14, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "⚡ Vortex Hub | Server Hop"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 14
TitleText.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TitleBar)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -38, 0, 11)
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
CloseBtn.TextSize = 15
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Content Container
local Container = Instance.new("Frame", MainFrame)
Container.BackgroundTransparency = 1
Container.Position = UDim2.new(0, 14, 0, 56)
Container.Size = UDim2.new(1, -28, 1, -66)

-- Info Box (Players count)
local InfoBox = Instance.new("Frame", Container)
InfoBox.Size = UDim2.new(1, 0, 0, 36)
InfoBox.BackgroundColor3 = Color3.fromRGB(24, 22, 35)
InfoBox.BorderSizePixel = 0
Instance.new("UICorner", InfoBox).CornerRadius = UDim.new(0, 10)

local InfoBoxStroke = Instance.new("UIStroke", InfoBox)
InfoBoxStroke.Thickness = 1
InfoBoxStroke.Color = Color3.fromRGB(45, 40, 65)

local NowLabel = Instance.new("TextLabel", InfoBox)
NowLabel.Size = UDim2.new(1, -16, 1, 0)
NowLabel.Position = UDim2.new(0, 12, 0, 0)
NowLabel.BackgroundTransparency = 1
NowLabel.Font = Enum.Font.GothamBold
NowLabel.TextXAlignment = Enum.TextXAlignment.Left
NowLabel.TextColor3 = Color3.fromRGB(100, 255, 160)
NowLabel.TextSize = 13

-- Status Label
local StatusLabel = Instance.new("TextLabel", Container)
StatusLabel.Position = UDim2.new(0, 0, 0, 44)
StatusLabel.Size = UDim2.new(1, 0, 0, 28)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
StatusLabel.TextSize = 12

-- Settings Box (Max Player Input Frame)
local SettingsFrame = Instance.new("Frame", Container)
SettingsFrame.Position = UDim2.new(0, 0, 0, 78)
SettingsFrame.Size = UDim2.new(1, 0, 0, 46)
SettingsFrame.BackgroundColor3 = Color3.fromRGB(24, 22, 35)
SettingsFrame.BorderSizePixel = 0
Instance.new("UICorner", SettingsFrame).CornerRadius = UDim.new(0, 10)

local SettingsStroke = Instance.new("UIStroke", SettingsFrame)
SettingsStroke.Thickness = 1
SettingsStroke.Color = Color3.fromRGB(45, 40, 65)

local MaxLabel = Instance.new("TextLabel", SettingsFrame)
MaxLabel.Position = UDim2.new(0, 12, 0, 0)
MaxLabel.Size = UDim2.new(0.65, 0, 1, 0)
MaxLabel.BackgroundTransparency = 1
MaxLabel.Font = Enum.Font.GothamMedium
MaxLabel.TextXAlignment = Enum.TextXAlignment.Left
MaxLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
MaxLabel.TextSize = 11.5
MaxLabel.Text = "Max Players in Server:"

local MaxBox = Instance.new("TextBox", SettingsFrame)
MaxBox.Position = UDim2.new(1, -65, 0.5, -15)
MaxBox.Size = UDim2.new(0, 52, 0, 30)
MaxBox.BackgroundColor3 = Color3.fromRGB(15, 14, 22)
MaxBox.BorderSizePixel = 0
MaxBox.Font = Enum.Font.GothamBold
MaxBox.Text = "1"
MaxBox.TextColor3 = Color3.fromRGB(255, 255, 255)
MaxBox.TextSize = 13
MaxBox.ClearTextOnFocus = false
Instance.new("UICorner", MaxBox).CornerRadius = UDim.new(0, 8)

local BoxStroke = Instance.new("UIStroke", MaxBox)
BoxStroke.Color = Color3.fromRGB(75, 60, 120)
BoxStroke.Thickness = 1

-- Stylish Buttons Container
local HopBtn = Instance.new("TextButton", Container)
HopBtn.Position = UDim2.new(0, 0, 0, 136)
HopBtn.Size = UDim2.new(0, 138, 0, 42)
HopBtn.BackgroundColor3 = Color3.fromRGB(85, 40, 210)
HopBtn.BorderSizePixel = 0
HopBtn.Font = Enum.Font.GothamBold
HopBtn.Text = "Hop Once"
HopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HopBtn.TextSize = 13
Instance.new("UICorner", HopBtn).CornerRadius = UDim.new(0, 10)

local HopStroke = Instance.new("UIStroke", HopBtn)
HopStroke.Color = Color3.fromRGB(130, 90, 255)
HopStroke.Thickness = 1

local AutoBtn = Instance.new("TextButton", Container)
AutoBtn.Position = UDim2.new(1, -138, 0, 136)
AutoBtn.Size = UDim2.new(0, 138, 0, 42)
AutoBtn.BackgroundColor3 = Color3.fromRGB(20, 135, 75)
AutoBtn.BorderSizePixel = 0
AutoBtn.Font = Enum.Font.GothamBold
AutoBtn.Text = "Auto Hop: OFF"
AutoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoBtn.TextSize = 13
Instance.new("UICorner", AutoBtn).CornerRadius = UDim.new(0, 10)

local AutoStroke = Instance.new("UIStroke", AutoBtn)
AutoStroke.Color = Color3.fromRGB(50, 205, 115)
AutoStroke.Thickness = 1

-- Footer Branding
local FooterLabel = Instance.new("TextLabel", Container)
FooterLabel.Position = UDim2.new(0, 0, 0, 190)
FooterLabel.Size = UDim2.new(1, 0, 0, 20)
FooterLabel.BackgroundTransparency = 1
FooterLabel.Font = Enum.Font.GothamBold
FooterLabel.TextXAlignment = Enum.TextXAlignment.Center
FooterLabel.TextSize = 12
FooterLabel.Text = "TikTok: @vexx_k6"

-- Smooth RGB Glow Loop for Outer Border
task.spawn(function()
    while ScreenGui.Parent do
        local t = tick() * 0.2
        local hue = t % 1
        local rainbowColor = Color3.fromHSV(hue, 0.7, 1)
        MainStroke.Color = rainbowColor
        FooterLabel.TextColor3 = rainbowColor
        task.wait(0.1)
    end
end)

-- Server Hop Logic
local autoEnabled = false
local autoThread = nil

task.spawn(function()
    while ScreenGui.Parent do
        local count = #Players:GetPlayers()
        NowLabel.Text = "👤 Players in this server: " .. count
        task.wait(1)
    end
end)

local function getRandomServer()
    local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local ok, raw = pcall(function() return game:HttpGet(url) end)
    if not ok or not raw or raw == "" then return nil end

    local ok2, data = pcall(HttpService.JSONDecode, HttpService, raw)
    if not ok2 or not data or not data.data or #data.data == 0 then return nil end
    local currentId = tostring(game.JobId)
    local candidates = {}
    for _, s in ipairs(data.data) do
        if s.id and tostring(s.id) ~= currentId then
            table.insert(candidates, tostring(s.id))
        end
    end

    if #candidates == 0 then return nil end
    return candidates[math.random(1, #candidates)]
end

local function hopOnce()
    StatusLabel.Text = "Searching for a new server..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 195, 45)
    task.wait(0.5)

    local serverId = getRandomServer()
    if not serverId then
        StatusLabel.Text = "❌ Failed to fetch server list."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 75, 75)
        return false
    end
    
    StatusLabel.Text = "Teleporting..."
    StatusLabel.TextColor3 = Color3.fromRGB(85, 175, 255)
    task.wait(0.5)

    local ok, err = pcall(function()
        TeleportService:TeleportToPlaceInstance(PlaceId, serverId, LocalPlayer)
    end)

    if not ok then
        StatusLabel.Text = "Teleport error!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 75, 75)
        return false
    end

    return true
end

HopBtn.MouseButton1Click:Connect(function()
    HopBtn.Active = false
    hopOnce()
    task.wait(2)
    HopBtn.Active = true
end)

AutoBtn.MouseButton1Click:Connect(function()
    autoEnabled = not autoEnabled

    if autoEnabled then
        AutoBtn.Text = "Auto Hop: ON"
        AutoBtn.BackgroundColor3 = Color3.fromRGB(205, 45, 45)
        AutoStroke.Color = Color3.fromRGB(255, 90, 90)
        autoThread = task.spawn(function()
            while autoEnabled and ScreenGui.Parent do
                local threshold = math.max(1, math.floor(tonumber(MaxBox.Text) or 1))
                local count = #Players:GetPlayers()
                if count <= threshold then
                    StatusLabel.Text = "✓ Status OK (" .. count .. " players)."
                    StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 160)
                    task.wait(3)
                else
                    hopOnce()
                    task.wait(5)
                end
            end
        end)
    else
        AutoBtn.Text = "Auto Hop: OFF"
        AutoBtn.BackgroundColor3 = Color3.fromRGB(20, 135, 75)
        AutoStroke.Color = Color3.fromRGB(50, 205, 115)
        if autoThread then
            task.cancel(autoThread)
            autoThread = nil
        end
        StatusLabel.Text = "Auto Hop stopped."
        StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    end
end)

StatusLabel.Text = "Ready. Click Hop."
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
