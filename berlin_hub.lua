-- ============================================================
-- BERLIN V0.1 | BEE SWARM SIMULATOR
-- MAIN HUB LOADER WITH COLLAPSIBLE GROUPS (ADDGROUP ENGINE)
-- ============================================================

local eleriumUrl = "https://raw.githubusercontent.com/Ichigi763/Berlin/main/elerium_lib.lua?v=" .. tick()
local library = loadstring(game:HttpGet(eleriumUrl, false))()

-- Create Red & Grey Elerium v2 Window
local window = library:AddWindow("Berlin v0.1", {
    main_color = Color3.fromRGB(180, 30, 40), -- Crimson Red
    min_size = Vector2.new(780, 440),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

-- Add Vertical Sidebar Tabs via Elerium
local searchTab   = window:AddTab("Search")
local homeTab     = window:AddTab("Home")
local farmTab     = window:AddTab("Farming")
local combatTab   = window:AddTab("Combat")
local questsTab   = window:AddTab("Quests")
local plantersTab = window:AddTab("Planters")
local toysTab     = window:AddTab("Toys")
local webhookTab  = window:AddTab("Webhook")
local configTab   = window:AddTab("Config")
local debugTab    = window:AddTab("Debug")

homeTab:Show()

-- Add Separator Line under Search Button
task.spawn(function()
    task.wait(0.2)
    pcall(function()
        local gui = game:GetService("CoreGui"):FindFirstChild("imgui") or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("imgui")
        if gui then
            local win = gui:FindFirstChild("Window", true)
            local tabSel = win and win:FindFirstChild("TabSelection", true)
            local tabBtns = tabSel and tabSel:FindFirstChild("TabButtons")
            if tabBtns then
                local searchBtn = tabBtns:FindFirstChild("SearchTabButton")
                if searchBtn and not searchBtn:FindFirstChild("SearchLine") then
                    local line = Instance.new("Frame")
                    line.Name = "SearchLine"
                    line.Size = UDim2.new(1, -10, 0, 1)
                    line.Position = UDim2.new(0, 5, 1, 2)
                    line.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
                    line.BorderSizePixel = 0
                    line.Parent = searchBtn
                end
            end
        end
    end)
end)

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
-- HOME TAB WITH COLLAPSIBLE "HOME ▼" CARD
-- ============================================================
local homeGroup = homeTab:AddGroup("Home", true)

local uptimeLbl = homeGroup:AddLabel("Uptime: 00:00:00")
local serverUptimeLbl = homeGroup:AddLabel("Server Uptime: 00:00:00")
local honeyLbl = homeGroup:AddLabel("Session Honey: 0")
local hphLbl = homeGroup:AddLabel("Honey per Hour: 0")

homeGroup:AddSwitch("Stop Everything", function(state)
    stopEverything = state
    print("[Berlin v0.1] Stop Everything:", state)
end)

homeGroup:AddButton("Fly to My Hive", function()
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
-- FARMING TAB WITH COLLAPSIBLE GROUPS
-- ============================================================
local farmGroup = farmTab:AddGroup("Farming", true)
local selectedField = "Pine Tree Forest"
local autoFarmActive = false
local autoDigActive = false

farmGroup:AddDropdown("Field", function(selected)
    selectedField = selected
end, {"Pine Tree Forest", "Sunflower Field", "Mushroom Field", "Dandelion Field", "Pineapple Patch", "Mountain Top Field", "Coconut Field", "Pepper Patch"})

farmGroup:AddSwitch("Autofarm", function(state) autoFarmActive = state end)
farmGroup:AddSwitch("Auto Sprinkler", function(state) end)
farmGroup:AddSwitch("Auto Dig", function(state) autoDigActive = state end)

farmTab:AddGroup("Farm Settings", false)
farmTab:AddGroup("Convert Settings", false)
farmTab:AddGroup("Guiding Star Settings", false)
farmTab:AddGroup("Natro Patterns", false)
farmTab:AddGroup("Face Settings", false)

-- CONFIG TAB
local configGroup = configTab:AddGroup("Movement Controls", true)
configGroup:AddSlider("WalkSpeed", function(val)
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = val end
end, {min = 16, max = 300, readonly = false})

configGroup:AddSlider("JumpPower", function(val)
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then hum.JumpPower = val end
end, {min = 50, max = 250, readonly = false})

print("==================================================")
print("✅ Berlin v0.1 (Elerium Native Collapsible AddGroup API) Ready!")
print("==================================================")
