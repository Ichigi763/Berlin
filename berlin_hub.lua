-- ============================================================
-- BERLIN V0.1 | BEE SWARM SIMULATOR
-- FULL OFFICIAL ELERIUM V2 UI LIBRARY LOADER (HTTPGET)
-- ============================================================

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library", true))()

-- Create Elerium Window
local window = library:AddWindow("Berlin v0.1", {
    main_color = Color3.fromRGB(43, 82, 146), -- Atlas Blue #2b5292
    min_size = Vector2.new(780, 440),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

-- ============================================================
-- CONFIGURE ELERIUM LAYOUT (VERTICAL LEFT TABS + FIX MINIMIZE OVERLAP + SEARCH LINE)
-- ============================================================
task.spawn(function()
    task.wait(0.2)
    pcall(function()
        local gui = game:GetService("CoreGui"):FindFirstChild("imgui") or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("imgui")
        if gui then
            local win = gui:FindFirstChild("Window", true)
            if win then
                -- Fix Minimize Button position to FAR RIGHT
                local bar = win:FindFirstChild("Bar")
                if bar then
                    local toggle = bar:FindFirstChild("Toggle")
                    if toggle then
                        toggle.Position = UDim2.new(1, -25, 0, -2)
                    end
                end

                -- Move TabSelection to LEFT SIDE vertically
                local tabSel = win:FindFirstChild("TabSelection", true)
                local tabsCont = win:FindFirstChild("Tabs", true)
                if tabSel and tabsCont then
                    tabSel.Position = UDim2.new(0, 8, 0, 35)
                    tabSel.Size = UDim2.new(0, 130, 1, -45)
                    tabSel.Visible = true

                    local tabBtns = tabSel:FindFirstChild("TabButtons")
                    if tabBtns then
                        local layout = tabBtns:FindFirstChildOfClass("UIListLayout")
                        if layout then
                            layout.FillDirection = Enum.FillDirection.Vertical
                            layout.Padding = UDim.new(0, 4)
                        end
                        for _, btn in ipairs(tabBtns:GetChildren()) do
                            if btn:IsA("TextButton") then
                                btn.Size = UDim2.new(1, 0, 0, 28)
                            end
                        end

                        -- Add Separator Line under Search Button
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

                    tabsCont.Position = UDim2.new(0, 145, 0, 35)
                    tabsCont.Size = UDim2.new(1, -155, 1, -45)
                end

                -- Fix Minimized Overlap Bug (Hide TabSelection when closing window)
                if bar and bar:FindFirstChild("Toggle") then
                    local toggleBtn = bar.Toggle
                    toggleBtn.MouseButton1Click:Connect(function()
                        task.wait(0.05)
                        if tabSel then
                            tabSel.Visible = (win.AbsoluteSize.Y > 50)
                        end
                    end)
                end
            end
        end
    end)
end)

-- ============================================================
-- TABS SETUP
-- ============================================================
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

-- ============================================================
-- GAME SERVICES & AUTO-FARM LOGIC
-- ============================================================
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local startTime = os.time()
local stopEverything = false

-- HOME TAB (UPTIME + SERVER UPTIME + HONEY + STOP EVERYTHING)
homeTab:AddLabel("--- Home ---")

local uptimeLbl = homeTab:AddLabel("Uptime: 00:00:00")
local serverUptimeLbl = homeTab:AddLabel("Server Uptime: 00:00:00")
local honeyLbl = homeTab:AddLabel("Session Honey: 0")
local hphLbl = homeTab:AddLabel("Honey per Hour: 0")

homeTab:AddSwitch("Stop Everything", function(state)
    stopEverything = state
    print("[Berlin v0.1] Stop Everything:", state)
end)

homeTab:AddButton("Fly to My Hive", function()
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

-- FARMING TAB
farmTab:AddLabel("--- Farming Settings ---")
local selectedField = "Pine Tree Forest"
local autoFarmActive = false
local autoDigActive = false

farmTab:AddDropdown("Field", function(selected)
    selectedField = selected
end, {"Pine Tree Forest", "Sunflower Field", "Mushroom Field", "Dandelion Field", "Pineapple Patch", "Mountain Top Field", "Coconut Field", "Pepper Patch"})

farmTab:AddSwitch("Autofarm", function(state) autoFarmActive = state end)
farmTab:AddSwitch("Auto Sprinkler", function(state) end)
farmTab:AddSwitch("Auto Dig", function(state) autoDigActive = state end)

-- CONFIG TAB
configTab:AddLabel("--- Movement Physics ---")
configTab:AddSlider("WalkSpeed", function(val)
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = val end
end, {min = 16, max = 300, readonly = false})

configTab:AddSlider("JumpPower", function(val)
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then hum.JumpPower = val end
end, {min = 50, max = 250, readonly = false})

print("==================================================")
print("✅ Berlin v0.1 (FULL OFFICIAL ELERIUM V2 LOADER) Ready!")
print("==================================================")
