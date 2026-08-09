-- ============================================================
-- BERLIN V0.1 | BEE SWARM SIMULATOR
-- ATLAS V1.0 EXACT PIXEL-PERFECT REPLICA ENGINE
-- ============================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Clean previous instances if existing
if CoreGui:FindFirstChild("BerlinAtlasGui") then
    CoreGui.BerlinAtlasGui:Destroy()
end
if LocalPlayer.PlayerGui:FindFirstChild("BerlinAtlasGui") then
    LocalPlayer.PlayerGui.BerlinAtlasGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BerlinAtlasGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- Main Window Frame (Exact Atlas Dimensions: 780 x 440)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 780, 0, 440)
MainFrame.Position = UDim2.new(0.5, -390, 0.4, -220)
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = MainFrame

-- 1. TOP BAR (#2b5292 Blue Header)
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 34)
TopBar.BackgroundColor3 = Color3.fromRGB(43, 82, 146) -- Atlas Blue #2b5292
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 10
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 6)
TopBarCorner.Parent = TopBar

local TopPatch = Instance.new("Frame")
TopPatch.Size = UDim2.new(1, 0, 0, 10)
TopPatch.Position = UDim2.new(0, 0, 1, -10)
TopPatch.BackgroundColor3 = Color3.fromRGB(43, 82, 146)
TopPatch.BorderSizePixel = 0
TopPatch.ZIndex = 10
TopPatch.Parent = TopBar

-- Title Label: EXACTLY "Berlin v0.1"
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(0, 300, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Berlin v0.1"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 11
TitleLabel.Parent = TopBar

-- Minimize Button (TOP RIGHT CORNER ▼)
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Size = UDim2.new(0, 34, 1, 0)
MinimizeBtn.Position = UDim2.new(1, -34, 0, 0)
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Text = "▼"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 13
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.ZIndex = 12
MinimizeBtn.Parent = TopBar

-- Body Frame Container (holds Left Sidebar + Content Pages)
local BodyFrame = Instance.new("Frame")
BodyFrame.Name = "BodyFrame"
BodyFrame.Size = UDim2.new(1, 0, 1, -34)
BodyFrame.Position = UDim2.new(0, 0, 0, 34)
BodyFrame.BackgroundTransparency = 1
BodyFrame.ClipsDescendants = true
BodyFrame.ZIndex = 2
BodyFrame.Parent = MainFrame

-- Full Close/Minimize Logic (Ensures NOTHING leaks out when closed!)
local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    BodyFrame.Visible = not isMinimized
    MainFrame.Size = isMinimized and UDim2.new(0, 780, 0, 34) or UDim2.new(0, 780, 0, 440)
    MinimizeBtn.Text = isMinimized and "▲" or "▼"
end)

-- 2. VERTICAL LEFT SIDEBAR NAVIGATION
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 135, 1, -10)
Sidebar.Position = UDim2.new(0, 5, 0, 5)
Sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 5
Sidebar.Parent = BodyFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 5)
SidebarCorner.Parent = Sidebar

local SidebarList = Instance.new("UIListLayout")
SidebarList.Padding = UDim.new(0, 4)
SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
SidebarList.FillDirection = Enum.FillDirection.Vertical
SidebarList.Parent = Sidebar

-- Pages Container
local PagesArea = Instance.new("Frame")
PagesArea.Name = "PagesArea"
PagesArea.Size = UDim2.new(1, -150, 1, -10)
PagesArea.Position = UDim2.new(0, 145, 0, 5)
PagesArea.BackgroundTransparency = 1
PagesArea.ZIndex = 2
PagesArea.Parent = BodyFrame

local createdTabs = {}

local function buildPage(name)
    local page = Instance.new("Frame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ZIndex = 3
    page.Parent = PagesArea

    local leftScroll = Instance.new("ScrollingFrame")
    leftScroll.Name = "LeftColumn"
    leftScroll.Size = UDim2.new(0.49, 0, 1, 0)
    leftScroll.Position = UDim2.new(0, 0, 0, 0)
    leftScroll.BackgroundTransparency = 1
    leftScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    leftScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    leftScroll.ScrollBarThickness = 3
    leftScroll.ScrollBarImageColor3 = Color3.fromRGB(70, 70, 85)
    leftScroll.ZIndex = 3
    leftScroll.Parent = page

    local leftList = Instance.new("UIListLayout")
    leftList.Padding = UDim.new(0, 8)
    leftList.Parent = leftScroll

    local rightScroll = Instance.new("ScrollingFrame")
    rightScroll.Name = "RightColumn"
    rightScroll.Size = UDim2.new(0.49, 0, 1, 0)
    rightScroll.Position = UDim2.new(0.51, 0, 0, 0)
    rightScroll.BackgroundTransparency = 1
    rightScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    rightScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    rightScroll.ScrollBarThickness = 3
    rightScroll.ScrollBarImageColor3 = Color3.fromRGB(70, 70, 85)
    rightScroll.ZIndex = 3
    rightScroll.Parent = page

    local rightList = Instance.new("UIListLayout")
    rightList.Padding = UDim.new(0, 8)
    rightList.Parent = rightScroll

    return page, leftScroll, rightScroll
end

-- TAB DEFINITIONS WITH LUCIDE ICONS
local tabsData = {
    {Name = "Search",   Icon = "rbxassetid://10709782230", IsSpecial = true},
    {Name = "Home",     Icon = "rbxassetid://10723407092"},
    {Name = "Farming",  Icon = "rbxassetid://10723346959"},
    {Name = "Combat",   Icon = "rbxassetid://10723424705"},
    {Name = "Quests",   Icon = "rbxassetid://10709782582"},
    {Name = "Planters", Icon = "rbxassetid://10709782845"},
    {Name = "Toys",     Icon = "rbxassetid://10723434791"},
    {Name = "Webhook",  Icon = "rbxassetid://10709782845"},
    {Name = "Config",   Icon = "rbxassetid://10709782247"},
    {Name = "Debug",    Icon = "rbxassetid://10709782500"}
}

for idx, tInfo in ipairs(tabsData) do
    local btn = Instance.new("TextButton")
    btn.Name = tInfo.Name .. "Btn"
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    btn.BackgroundTransparency = 0.8
    btn.Text = "        " .. tInfo.Name
    btn.TextColor3 = Color3.fromRGB(170, 170, 190)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamMedium
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.ZIndex = 6
    btn.Parent = Sidebar

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 5)
    btnCorner.Parent = btn

    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.new(0, 16, 0, 16)
    icon.Position = UDim2.new(0, 10, 0.5, -8)
    icon.BackgroundTransparency = 1
    icon.Image = tInfo.Icon
    icon.ImageColor3 = Color3.fromRGB(170, 170, 190)
    icon.ZIndex = 7
    icon.Parent = btn

    local page, leftScroll, rightScroll = buildPage(tInfo.Name)

    btn.MouseButton1Click:Connect(function()
        for _, tabObj in pairs(createdTabs) do
            tabObj.Btn.BackgroundTransparency = 0.8
            tabObj.Btn.TextColor3 = Color3.fromRGB(170, 170, 190)
            tabObj.Icon.ImageColor3 = Color3.fromRGB(170, 170, 190)
            tabObj.Page.Visible = false
        end
        btn.BackgroundTransparency = 0
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        page.Visible = true
    end)

    createdTabs[tInfo.Name] = {Btn = btn, Icon = icon, Page = page, Left = leftScroll, Right = rightScroll}

    -- Add Horizontal Divider Line under Search Tab button!
    if tInfo.IsSpecial then
        local divider = Instance.new("Frame")
        divider.Name = "SearchDivider"
        divider.Size = UDim2.new(1, -12, 0, 1)
        divider.Position = UDim2.new(0, 6, 0, 0)
        divider.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
        divider.BorderSizePixel = 0
        divider.ZIndex = 6
        divider.Parent = Sidebar
    end
end

-- Default active tab: Home
if createdTabs["Home"] then
    createdTabs["Home"].Btn.BackgroundTransparency = 0
    createdTabs["Home"].Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    createdTabs["Home"].Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    createdTabs["Home"].Page.Visible = true
end

-- ============================================================
-- 3. COLLAPSIBLE CARD COMPONENT
-- ============================================================
local searchableFeatures = {}

local function createPanelCard(columnParent, titleText, isOpen)
    local openState = (isOpen == nil and true or isOpen)

    local card = Instance.new("Frame")
    card.Name = titleText .. "Card"
    card.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
    card.BorderSizePixel = 0
    card.ClipsDescendants = true
    card.ZIndex = 4
    card.Parent = columnParent

    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 5)
    cardCorner.Parent = card

    local cardHeader = Instance.new("TextButton")
    cardHeader.Size = UDim2.new(1, 0, 0, 32)
    cardHeader.BackgroundTransparency = 1
    cardHeader.Text = "  " .. titleText
    cardHeader.TextColor3 = Color3.fromRGB(240, 240, 250)
    cardHeader.TextSize = 13
    cardHeader.Font = Enum.Font.GothamBold
    cardHeader.TextXAlignment = Enum.TextXAlignment.Left
    cardHeader.ZIndex = 5
    cardHeader.Parent = card

    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 20, 1, 0)
    arrow.Position = UDim2.new(1, -24, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = openState and "▼" or "◄"
    arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
    arrow.TextSize = 11
    arrow.Font = Enum.Font.GothamBold
    arrow.ZIndex = 6
    arrow.Parent = cardHeader

    local cardContainer = Instance.new("Frame")
    cardContainer.Name = "Container"
    cardContainer.Size = UDim2.new(1, -20, 0, 0)
    cardContainer.Position = UDim2.new(0, 10, 0, 34)
    cardContainer.BackgroundTransparency = 1
    cardContainer.Visible = openState
    cardContainer.ZIndex = 5
    cardContainer.Parent = card

    local cardList = Instance.new("UIListLayout")
    cardList.Padding = UDim.new(0, 6)
    cardList.Parent = cardContainer

    local function updateCardSize()
        if openState then
            local totalH = cardList.AbsoluteContentSize.Y + 42
            card.Size = UDim2.new(1, 0, 0, totalH)
        else
            card.Size = UDim2.new(1, 0, 0, 32)
        end
    end

    cardList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCardSize)

    cardHeader.MouseButton1Click:Connect(function()
        openState = not openState
        arrow.Text = openState and "▼" or "◄"
        cardContainer.Visible = openState
        updateCardSize()
    end)

    updateCardSize()
    return cardContainer
end

-- ============================================================
-- WIDGET HELPERS (CHECKBOX & DROPDOWN & LABELS)
-- ============================================================
local function createCheckbox(cardContainer, title, isChecked, callback)
    local state = isChecked or false

    local row = Instance.new("Frame")
    row.Name = title
    row.Size = UDim2.new(1, 0, 0, 24)
    row.BackgroundTransparency = 1
    row.ZIndex = 5
    row.Parent = cardContainer

    local box = Instance.new("TextButton")
    box.Size = UDim2.new(0, 18, 0, 18)
    box.Position = UDim2.new(0, 2, 0, 3)
    box.BackgroundColor3 = state and Color3.fromRGB(43, 82, 146) or Color3.fromRGB(42, 42, 52)
    box.BorderSizePixel = 0
    box.Text = state and "✓" or ""
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.TextSize = 13
    box.Font = Enum.Font.GothamBold
    box.ZIndex = 6
    box.Parent = row

    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 3)
    boxCorner.Parent = box

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -30, 1, 0)
    label.Position = UDim2.new(0, 28, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = title
    label.TextColor3 = Color3.fromRGB(220, 220, 235)
    label.TextSize = 13
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 6
    label.Parent = row

    box.MouseButton1Click:Connect(function()
        state = not state
        box.Text = state and "✓" or ""
        box.BackgroundColor3 = state and Color3.fromRGB(43, 82, 146) or Color3.fromRGB(42, 42, 52)
        if callback then callback(state) end
    end)

    table.insert(searchableFeatures, {Title = title, Object = row})
    return row
end

local function createDropdown(cardContainer, title, options, defaultOpt, callback)
    local selected = defaultOpt or options[1]

    local ddFrame = Instance.new("Frame")
    ddFrame.Name = title
    ddFrame.Size = UDim2.new(1, 0, 0, 30)
    ddFrame.BackgroundColor3 = Color3.fromRGB(42, 42, 54)
    ddFrame.BorderSizePixel = 0
    ddFrame.ZIndex = 5
    ddFrame.Parent = cardContainer

    local ddCorner = Instance.new("UICorner")
    ddCorner.CornerRadius = UDim.new(0, 4)
    ddCorner.Parent = ddFrame

    local ddBtn = Instance.new("TextButton")
    ddBtn.Size = UDim2.new(1, 0, 1, 0)
    ddBtn.BackgroundTransparency = 1
    ddBtn.Text = "  " .. title .. ": " .. selected
    ddBtn.TextColor3 = Color3.fromRGB(240, 240, 255)
    ddBtn.TextSize = 13
    ddBtn.Font = Enum.Font.GothamMedium
    ddBtn.TextXAlignment = Enum.TextXAlignment.Left
    ddBtn.ZIndex = 6
    ddBtn.Parent = ddFrame

    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 20, 1, 0)
    arrow.Position = UDim2.new(1, -22, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = "v"
    arrow.TextColor3 = Color3.fromRGB(200, 200, 220)
    arrow.TextSize = 11
    arrow.Font = Enum.Font.GothamBold
    arrow.ZIndex = 7
    arrow.Parent = ddFrame

    local currIndex = 1
    ddBtn.MouseButton1Click:Connect(function()
        currIndex = (currIndex % #options) + 1
        selected = options[currIndex]
        ddBtn.Text = "  " .. title .. ": " .. selected
        if callback then callback(selected) end
    end)

    table.insert(searchableFeatures, {Title = title, Object = ddFrame})
    return ddFrame
end

local function createInfoLabel(cardContainer, titleText)
    local lbl = Instance.new("TextLabel")
    lbl.Name = titleText
    lbl.Size = UDim2.new(1, 0, 0, 22)
    lbl.BackgroundTransparency = 1
    lbl.Text = titleText
    lbl.TextColor3 = Color3.fromRGB(210, 210, 225)
    lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 6
    lbl.Parent = cardContainer
    return lbl
end

-- ============================================================
-- POPULATE HOME PAGE (EXACT MATCH TO ATLAS SCREENSHOT 3)
-- ============================================================
local homePageObj = createdTabs["Home"]
local homeCard = createPanelCard(homePageObj.Left, "Home", true)

local startTime = os.time()

local uptimeLbl = createInfoLabel(homeCard, "Uptime: 00:00:00")
local serverUptimeLbl = createInfoLabel(homeCard, "Server Uptime: 00:00:00")
local honeyLbl = createInfoLabel(homeCard, "Session Honey: 0")
local hphLbl = createInfoLabel(homeCard, "Honey per Hour: 0")

local stopEverythingActive = false
local stopEverythingBox = createCheckbox(homeCard, "Stop Everything", false, function(state)
    stopEverythingActive = state
    print("[Berlin v0.1] Stop Everything:", state)
end)

-- Live Timers Updating Thread
task.spawn(function()
    while task.wait(1) do
        local elapsed = os.time() - startTime
        local h = math.floor(elapsed / 3600)
        local m = math.floor((elapsed % 3600) / 60)
        local s = elapsed % 60
        uptimeLbl.Text = string.format("Uptime: %02d:%02d:%02d", h, m, s)

        local sUptime = math.floor(Workspace.DistributedGameTime)
        local sh = math.floor(sUptime / 3600)
        local sm = math.floor((sUptime % 3600) / 60)
        local ss = sUptime % 60
        serverUptimeLbl.Text = string.format("Server Uptime: %02d:%02d:%02d", sh, sm, ss)
    end
end)

-- ============================================================
-- POPULATE FARMING PAGE (EXACT MATCH TO ATLAS SCREENSHOT 3)
-- ============================================================
local farmPageObj = createdTabs["Farming"]

-- Left Column Cards
local farmColLeft = createPanelCard(farmPageObj.Left, "Farming", true)
local selectedField = "Pine Tree Forest"
local autoFarmActive = false
local autoSprinklerActive = false
local autoDigActive = false

createDropdown(farmColLeft, "Field", {"Pine Tree Forest", "Sunflower Field", "Mushroom Field", "Dandelion Field", "Pineapple Patch", "Mountain Top Field", "Coconut Field", "Pepper Patch"}, "Pine Tree Forest", function(opt)
    selectedField = opt
end)
createCheckbox(farmColLeft, "Autofarm", false, function(v) autoFarmActive = v end)
createCheckbox(farmColLeft, "Auto Sprinkler", false, function(v) autoSprinklerActive = v end)
createCheckbox(farmColLeft, "Auto Dig", false, function(v) autoDigActive = v end)

createPanelCard(farmPageObj.Left, "Farm Settings", false)
createPanelCard(farmPageObj.Left, "Convert Settings", false)
createPanelCard(farmPageObj.Left, "Guiding Star Settings", false)
createPanelCard(farmPageObj.Left, "Natro Patterns", false)
createPanelCard(farmPageObj.Left, "Face Settings", false)

-- Right Column Cards
local sproutColRight = createPanelCard(farmPageObj.Right, "Sprout Settings", true)
createCheckbox(sproutColRight, "Farm Sprouts", false, function(v) end)
createCheckbox(sproutColRight, "Auto Plant Sprouts", false, function(v) end)
createCheckbox(sproutColRight, "Plant During Day Only", false, function(v) end)
createCheckbox(sproutColRight, "Plant During Night Only", false, function(v) end)
createDropdown(sproutColRight, "Allowed Fields", {"All Fields", "Pine Tree Only", "Coconut Only"}, "All Fields", function(opt) end)
createDropdown(sproutColRight, "Sprout Rarity", {"Any Rarity", "Rare Only", "Epic Only"}, "Any Rarity", function(opt) end)

createPanelCard(farmPageObj.Right, "Puffshrooms", false)
createPanelCard(farmPageObj.Right, "Robo Bear Challenge", false)
createPanelCard(farmPageObj.Right, "Follow Player", false)

-- ============================================================
-- WORKING SEARCH TAB
-- ============================================================
local searchPageObj = createdTabs["Search"]
local searchCard = createPanelCard(searchPageObj.Left, "Search Features", true)

local searchBoxFrame = Instance.new("Frame")
searchBoxFrame.Size = UDim2.new(1, 0, 0, 32)
searchBoxFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
searchBoxFrame.BorderSizePixel = 0
searchBoxFrame.Parent = searchCard

local searchBoxCorner = Instance.new("UICorner")
searchBoxCorner.CornerRadius = UDim.new(0, 5)
searchBoxCorner.Parent = searchBoxFrame

local searchInput = Instance.new("TextBox")
searchInput.Size = UDim2.new(1, -10, 1, 0)
searchInput.Position = UDim2.new(0, 10, 0, 0)
searchInput.BackgroundTransparency = 1
searchInput.PlaceholderText = "Type feature name to search..."
searchInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
searchInput.Text = ""
searchInput.TextColor3 = Color3.fromRGB(255, 255, 255)
searchInput.TextSize = 13
searchInput.Font = Enum.Font.Gotham
searchInput.TextXAlignment = Enum.TextXAlignment.Left
searchInput.Parent = searchBoxFrame

searchInput:GetPropertyChangedSignal("Text"):Connect(function()
    local query = searchInput.Text:lower()
    for _, item in ipairs(searchableFeatures) do
        if query == "" then
            item.Object.Visible = true
        else
            if item.Title:lower():find(query) then
                item.Object.Visible = true
            else
                item.Object.Visible = false
            end
        end
    end
end)

-- ============================================================
-- GAME LOOPS (AUTOFARM & AUTO DIG)
-- ============================================================
local function getExactCenter(obj)
    if obj:IsA("Model") then
        local cframe, size = obj:GetBoundingBox()
        return cframe.Position
    elseif obj:IsA("BasePart") then
        return obj.Position
    else
        return obj:GetPivot().Position
    end
end

task.spawn(function()
    while task.wait(0.5) do
        if autoFarmActive and not stopEverythingActive then
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local flowerFolder = Workspace:FindFirstChild("FlowerZones") or Workspace:FindFirstChild("Fields")
            if hrp and flowerFolder then
                local targetZone = flowerFolder:FindFirstChild(selectedField)
                if targetZone then
                    local center = getExactCenter(targetZone)
                    local offsetX = math.random(-25, 25)
                    local offsetZ = math.random(-25, 25)
                    local targetPos = center + Vector3.new(offsetX, 3, offsetZ)
                    
                    hrp.Anchored = true
                    local tween = TweenService:Create(hrp, TweenInfo.new(1.2, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPos)})
                    tween:Play()
                    tween.Completed:Wait()
                    hrp.Anchored = false
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.2) do
        if (autoDigActive or autoFarmActive) and not stopEverythingActive then
            pcall(function()
                local char = LocalPlayer.Character
                local tool = char and char:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                else
                    local bpTool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                    if bpTool and char then bpTool.Parent = char end
                end
            end)
        end
    end
end)

print("==================================================")
print("✅ Berlin v0.1 (Atlas v1.0 Exact Replica) Loaded!")
print("==================================================")
