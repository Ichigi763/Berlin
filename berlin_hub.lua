-- ============================================================
-- BERLIN V0.1 | BEE SWARM SIMULATOR
-- MAIN GITHUB LOADER SCRIPT
-- ============================================================

local eleriumUrl = "https://raw.githubusercontent.com/Ichigi763/Berlin/main/elerium_lib.lua?nocache=" .. os.time() .. "_" .. math.random(1000, 9999)
local library = loadstring(game:HttpGet(eleriumUrl, false))()

-- Create Red & Grey Elerium v2 Window (Exact Width fitted to sidebar + content)
local window = library:AddWindow("Berlin v0.1.7", {
    main_color = Color3.fromRGB(180, 30, 40), -- Crimson Red
    min_size = Vector2.new(780, 440),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

-- Add Interactive Search Field at top of Sidebar
local searchInput = window:AddSearchBox(function(query)
    print("[Berlin v0.1.7] Searching for:", query)
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
-- GAME SERVICES & AUTO-FARM LOGIC
-- ============================================================
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local startTime = os.time()
local stopEverything = false

-- ============================================================
-- HOME TAB WITH NATIVE ELERIUM COLLAPSIBLE FOLDER CARD
-- ============================================================
local homeFolder = homeTab:AddFolder("Home", true)

local uptimeLbl = homeFolder:AddLabel("Uptime: 00:00:00")
local serverUptimeLbl = homeFolder:AddLabel("Server Uptime: 00:00:00")
local honeyLbl = homeFolder:AddLabel("Session Honey: 0")
local hphLbl = homeFolder:AddLabel("Honey per Hour: 0")

homeFolder:AddSwitch("Stop Everything", function(state)
    stopEverything = state
    print("[Berlin v0.1] Stop Everything:", state)
end)

homeFolder:AddButton("Fly to My Hive", function()
    print("[Berlin v0.1] Flying to My Hive...")
    local hives = Workspace:FindFirstChild("Honeycombs") or Workspace:FindFirstChild("Hives")
    if hives then
        for _, hive in ipairs(hives:GetChildren()) do
            for _, val in ipairs(hive:GetDescendants()) do
                if (val:IsA("StringValue") or val:IsA("ObjectValue")) and tostring(val.Value) == LocalPlayer.Name then
                    local cf = hive:IsA("Model") and hive:GetPivot() or hive.CFrame
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Anchored = true
                        local tween = TweenService:Create(hrp, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {CFrame = cf + Vector3.new(0, 5, 0)})
                        tween:Play()
                        tween.Completed:Wait()
                        hrp.Anchored = false
                    end
                    return
                end
            end
        end
    end
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
-- FARMING TAB WITH NATIVE ELERIUM COLLAPSIBLE FOLDER CARDS
-- ============================================================
local farmFolder = farmTab:AddFolder("Farming", true)
local selectedField = "Pine Tree Forest"
local autoFarmActive = false
local autoDigActive = false

farmFolder:AddDropdown("Field", function(selected)
    selectedField = selected
end, {"Pine Tree Forest", "Sunflower Field", "Mushroom Field", "Dandelion Field", "Pineapple Patch", "Mountain Top Field", "Coconut Field", "Pepper Patch"})

farmFolder:AddSwitch("Autofarm", function(state) autoFarmActive = state end)
farmFolder:AddSwitch("Auto Sprinkler", function(state) end)
farmFolder:AddSwitch("Auto Dig", function(state) autoDigActive = state end)

farmTab:AddFolder("Farm Settings", false)
farmTab:AddFolder("Convert Settings", false)
farmTab:AddFolder("Guiding Star Settings", false)
farmTab:AddFolder("Natro Patterns", false)
farmTab:AddFolder("Face Settings", false)

-- CONFIG TAB
local configFolder = configTab:AddFolder("Movement Controls", true)
configFolder:AddSlider("WalkSpeed", function(val)
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = val end
end, {min = 16, max = 300, readonly = false})

configFolder:AddSlider("JumpPower", function(val)
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then hum.JumpPower = val end
end, {min = 50, max = 250, readonly = false})

print("==================================================")
print("✅ Berlin v0.1 (GitHub Clean Elerium v2 Loaded) Ready!")
print("==================================================")
