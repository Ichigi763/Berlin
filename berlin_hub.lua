-- ============================================================
-- BERLIN V0.1.10 | BEE SWARM SIMULATOR
-- MAIN GITHUB LOADER SCRIPT
-- ============================================================

local eleriumUrl = "https://raw.githubusercontent.com/Ichigi763/Berlin/main/elerium_lib.lua?nocache=" .. os.time() .. "_" .. math.random(1000, 9999)
local library = loadstring(game:HttpGet(eleriumUrl, false))()

-- Create Red & Grey Elerium v2 Window
local window = library:AddWindow("Berlin v0.1.10", {
    main_color = Color3.fromRGB(180, 30, 40), -- Crimson Red
    min_size = Vector2.new(780, 440),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

-- Add Interactive Search Field at top of Sidebar
local searchInput = window:AddSearchBox(function(query)
    print("[Berlin v0.1.10] Searching for:", query)
end)

-- Add Vertical Sidebar Tabs with User's Exact Lucide Icons via Elerium
local homeTab     = window:AddTab("Home", "info")
local farmTab     = window:AddTab("Farming", "house")
local combatTab   = window:AddTab("Combat", "swords")
local questsTab   = window:AddTab("Quests", "book")
local plantersTab = window:AddTab("Planters", "tree-pine")
local toysTab     = window:AddTab("Toys", "briefcase")
local webhookTab  = window:AddTab("Webhook", "link")
local configTab   = window:AddTab("Config", "settings")
local debugTab    = window:AddTab("Debug", "bug")

homeTab:Show()

-- ============================================================
-- GAME SERVICES & ALL BSS FIELD POSITIONS
-- ============================================================
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local startTime = os.time()
local stopEverything = false

-- Complete List of 22 Bee Swarm Simulator Fields
local FieldPositions = {
    ["Sunflower Field"]     = Vector3.new(-208, 4, 184),
    ["Dandelion Field"]     = Vector3.new(-28, 4, 222),
    ["Mushroom Field"]      = Vector3.new(-258, 4, 296),
    ["Blue Flower Field"]   = Vector3.new(114, 4, 102),
    ["Clover Field"]        = Vector3.new(148, 34, 198),
    ["Strawberry Field"]    = Vector3.new(-182, 20, -12),
    ["Spider Field"]        = Vector3.new(-44, 20, -42),
    ["Bamboo Field"]        = Vector3.new(134, 20, -82),
    ["Pineapple Patch"]     = Vector3.new(258, 68, -210),
    ["Stump Field"]         = Vector3.new(422, 98, -174),
    ["Cactus Field"]        = Vector3.new(-194, 68, -130),
    ["Pumpkin Patch"]       = Vector3.new(-194, 68, -190),
    ["Pine Tree Forest"]    = Vector3.new(-328, 68, -190),
    ["Rose Field"]          = Vector3.new(-328, 20, 128),
    ["Mountain Top Field"]  = Vector3.new(76, 176, -164),
    ["Coconut Field"]       = Vector3.new(-258, 72, 464),
    ["Pepper Patch"]        = Vector3.new(-486, 124, 524),
    ["Dapper Bear Field"]   = Vector3.new(512, 140, -320),
    ["Hub Field"]           = Vector3.new(0, 4, 0),
    ["Ant Field"]           = Vector3.new(120, 30, 500),
    ["Robo Field"]          = Vector3.new(310, 150, 200),
}

-- ============================================================
-- HELPER FUNCTIONS: HIVE FINDER & REMOTE EVENTS
-- ============================================================

-- Find Player's Exact Hive & Converter Platform
local function getMyHivePlatform()
    local hives = Workspace:FindFirstChild("Honeycombs") or Workspace:FindFirstChild("Hives")
    if not hives then return nil end

    for _, hive in ipairs(hives:GetChildren()) do
        local ownerVal = hive:FindFirstChild("Owner")
        if ownerVal and (tostring(ownerVal.Value) == LocalPlayer.Name or ownerVal.Value == LocalPlayer) then
            local platform = hive:FindFirstChild("Platform") or hive:FindFirstChild("Pad") or hive:FindFirstChild("Base")
            if platform then
                return platform.CFrame * CFrame.new(0, 3.5, -4)
            else
                return hive:GetPivot() * CFrame.new(0, 3.5, -6)
            end
        end
        for _, val in ipairs(hive:GetDescendants()) do
            if (val:IsA("StringValue") or val:IsA("ObjectValue")) and tostring(val.Value) == LocalPlayer.Name then
                local platform = hive:FindFirstChild("Platform") or hive:FindFirstChild("Pad")
                if platform then
                    return platform.CFrame * CFrame.new(0, 3.5, -4)
                else
                    return hive:GetPivot() * CFrame.new(0, 3.5, -6)
                end
            end
        end
    end
    return nil
end

-- Teleport to Player's Hive Converting Pad
local function teleportToHiveConverter()
    local targetCF = getMyHivePlatform()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if targetCF and hrp then
        hrp.Anchored = true
        local tween = TweenService:Create(hrp, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = targetCF})
        tween:Play()
        tween.Completed:Wait()
        hrp.Anchored = false

        -- Fire Honey Converter RemoteEvent
        local events = ReplicatedStorage:FindFirstChild("Events")
        if events and events:FindFirstChild("PlayerHiveCommand") then
            events.PlayerHiveCommand:FireServer("MakeHoney")
            events.PlayerHiveCommand:FireServer("ConvertHoney")
        end
    end
end

-- Fire Item Buff RemoteEvent
local function useInventoryBuff(itemName)
    local events = ReplicatedStorage:FindFirstChild("Events")
    if events and events:FindFirstChild("PlayerItemEvent") then
        events.PlayerItemEvent:FireServer(itemName)
        print("[Berlin v0.1.10] Used Buff:", itemName)
    end
end

-- Fire Dispenser / Toy RemoteEvent
local function collectDispenser(toyName)
    local events = ReplicatedStorage:FindFirstChild("Events")
    if events and events:FindFirstChild("ToyEvent") then
        events.ToyEvent:FireServer(toyName)
        print("[Berlin v0.1.10] Collected Dispenser:", toyName)
    end
end

-- Fire Quest RemoteEvent
local function takeQuest(npcName)
    local events = ReplicatedStorage:FindFirstChild("Events")
    if events and events:FindFirstChild("QuestEvent") then
        events.QuestEvent:FireServer("AcceptQuest", npcName)
        print("[Berlin v0.1.10] Took Quest from:", npcName)
    end
end

-- ============================================================
-- HOME TAB
-- ============================================================
local homeFolder = homeTab:AddFolder("Home", true)

local uptimeLbl = homeFolder:AddLabel("Uptime: 00:00:00")
local serverUptimeLbl = homeFolder:AddLabel("Server Uptime: 00:00:00")
local honeyLbl = homeFolder:AddLabel("Session Honey: 0")
local hphLbl = homeFolder:AddLabel("Honey per Hour: 0")

homeFolder:AddSwitch("Stop Everything", function(state)
    stopEverything = state
    print("[Berlin v0.1.10] Stop Everything:", state)
end)

homeFolder:AddButton("Fly to My Hive Converter", function()
    print("[Berlin v0.1.10] Flying to Hive Converter...")
    teleportToHiveConverter()
end)

-- Live Timers Loop
task.spawn(function()
    while task.wait(1) do
        local elapsed = os.time() - startTime
        local h = math.floor(elapsed / 3600)
        local m = math.floor((elapsed % 3600) / 60)
        local s = elapsed % 60
        if uptimeLbl then uptimeLbl.Text = string.format("Uptime: %02d:%02d:%02d", h, m, s) end

        local sUptime = math.floor(Workspace.DistributedGameTime)
        local sh = math.floor(sUptime / 3600)
        local sm = math.floor((sUptime % 3600) / 60)
        local ss = sUptime % 60
        if serverUptimeLbl then serverUptimeLbl.Text = string.format("Server Uptime: %02d:%02d:%02d", sh, sm, ss) end
    end
end)

-- ============================================================
-- FARMING TAB (2-COLUMN COLLAPSIBLE CARDS MATCHING ATLAS V1.0)
-- ============================================================

local selectedField = "Pine Tree Forest"
local autoFarmActive = false
local autoDigActive = false
local autoSprinklerActive = false

-- LEFT COLUMN
local farmFolder = farmTab:AddFolder("Farming", true, "left")

local fieldList = {}
for name, _ in pairs(FieldPositions) do
    table.insert(fieldList, name)
end
table.sort(fieldList)

farmFolder:AddDropdown("Field", function(selected)
    selectedField = selected
    print("[Berlin v0.1.10] Selected Field:", selectedField)
end, fieldList)

farmFolder:AddSwitch("Autofarm", function(state)
    autoFarmActive = state
    print("[Berlin v0.1.10] Autofarm:", state)
end)

farmFolder:AddSwitch("Auto Sprinkler", function(state)
    autoSprinklerActive = state
end)

farmFolder:AddSwitch("Auto Dig", function(state)
    autoDigActive = state
end)

farmTab:AddFolder("Farm Settings", false, "left")
local convertFolder = farmTab:AddFolder("Convert Settings", false, "left")
convertFolder:AddButton("Convert Honey at Hive", function()
    teleportToHiveConverter()
end)

farmTab:AddFolder("Guiding Star Settings", false, "left")
farmTab:AddFolder("Natro Patterns", false, "left")
farmTab:AddFolder("Face Settings", false, "left")

-- RIGHT COLUMN
local sproutFolder = farmTab:AddFolder("Sprout Settings", true, "right")
sproutFolder:AddSwitch("Farm Sprouts", function(state) end)
sproutFolder:AddSwitch("Auto Plant Sprouts", function(state) end)
sproutFolder:AddSwitch("Plant During Day Only", function(state) end)
sproutFolder:AddSwitch("Plant During Night Only", function(state) end)

farmTab:AddFolder("Allowed Fields", false, "right")
farmTab:AddFolder("Sprout Rarity", false, "right")
farmTab:AddFolder("Puffshrooms", false, "right")
farmTab:AddFolder("Robo Bear Challenge", false, "right")
farmTab:AddFolder("Follow Player", false, "right")

-- ============================================================
-- OTHER TABS: COMBAT, TOYS, CONFIG, DEBUG
-- ============================================================

-- TOYS TAB (DISPENSERS)
local dispenserFolder = toysTab:AddFolder("Dispensers", true, "left")
dispenserFolder:AddButton("Collect All Dispensers", function()
    collectDispenser("Blueberry Dispenser")
    collectDispenser("Strawberry Dispenser")
    collectDispenser("Honey Dispenser")
    collectDispenser("Treat Dispenser")
    collectDispenser("Coconut Dispenser")
    collectDispenser("Glue Dispenser")
    collectDispenser("Free Ant Pass")
    collectDispenser("Wealth Clock")
end)

-- QUESTS TAB
local questFolder = questsTab:AddFolder("Quests", true, "left")
questFolder:AddButton("Take All Available Quests", function()
    takeQuest("Black Bear")
    takeQuest("Brown Bear")
    takeQuest("Panda Bear")
    takeQuest("Science Bear")
    takeQuest("Polar Bear")
end)

-- CONFIG TAB
local configFolder = configTab:AddFolder("Movement Controls", true, "left")
configFolder:AddSlider("WalkSpeed", function(val)
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = val end
end, {min = 16, max = 300, readonly = false})

configFolder:AddSlider("JumpPower", function(val)
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then hum.JumpPower = val end
end, {min = 50, max = 300, readonly = false})

-- ============================================================
-- AUTOFARM ENGINE LOOP (DIG + FIELD MOVEMENT + TOKEN COLLECT + AUTO CONVERT)
-- ============================================================
task.spawn(function()
    local angle = 0
    while task.wait(0.15) do
        if not stopEverything and autoFarmActive then
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local tool = char and char:FindFirstChildOfClass("Tool")

            -- Auto Dig Scoop Tool
            if autoDigActive or autoFarmActive then
                if tool then tool:Activate() end
            end

            -- Bounded Field Patrol & Token Collection
            if hrp then
                local center = FieldPositions[selectedField] or Vector3.new(0, 4, 0)

                -- Check for Tokens in workspace
                local collectibles = Workspace:FindFirstChild("Collectibles") or Workspace:FindFirstChild("Tokens")
                local targetToken = nil
                if collectibles then
                    for _, token in ipairs(collectibles:GetChildren()) do
                        if token:IsA("BasePart") and (token.Position - center).Magnitude < 38 then
                            targetToken = token
                            break
                        end
                    end
                end

                if targetToken then
                    hrp.CFrame = CFrame.new(targetToken.Position + Vector3.new(0, 2.5, 0))
                else
                    -- Move in field circle radius
                    angle = angle + 0.35
                    local offsetX = math.cos(angle) * 18
                    local offsetZ = math.sin(angle) * 18
                    hrp.CFrame = CFrame.new(center + Vector3.new(offsetX, 3, offsetZ))
                end

                -- Auto Convert check if Pollen Container is Full
                local stats = LocalPlayer:FindFirstChild("CoreStats") or LocalPlayer:FindFirstChild("PlayerGui")
                local pollen = LocalPlayer:FindFirstChild("Pollen")
                local capacity = LocalPlayer:FindFirstChild("Capacity")
                if pollen and capacity and pollen.Value >= capacity.Value and capacity.Value > 0 then
                    print("[Berlin v0.1.10] Pollen Full! Converting at Hive...")
                    teleportToHiveConverter()
                    task.wait(4)
                end
            end
        end
    end
end)
