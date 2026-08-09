-- ============================================================
-- BERLIN V0.1 | BEE SWARM SIMULATOR
-- OFFICIAL ELERIUM V2 UI LIBRARY (CLEAN UNOBFUSCATED RELEASE)
-- ============================================================

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library", true))()

-- Create Window with Elerium v2
local window = library:AddWindow("Berlin v0.1", {
    main_color = Color3.fromRGB(38, 75, 135), -- Atlas Blue
    min_size = Vector2.new(780, 440),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

-- Reposition Elerium tabs to the LEFT SIDE
task.spawn(function()
    task.wait(0.2)
    pcall(function()
        local gui = game:GetService("CoreGui"):FindFirstChild("imgui") or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("imgui")
        if gui then
            local win = gui:FindFirstChild("Prefabs") and gui.Prefabs.Parent:FindFirstChild("Window", true) or gui:FindFirstChild("Window", true)
            if win then
                local tabSel = win:FindFirstChild("TabSelection", true)
                local tabsCont = win:FindFirstChild("Tabs", true)
                if tabSel and tabsCont then
                    tabSel.Position = UDim2.new(0, 10, 0, 35)
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
                                btn.Size = UDim2.new(1, 0, 0, 26)
                            end
                        end
                    end
                    
                    tabsCont.Position = UDim2.new(0, 150, 0, 35)
                    tabsCont.Size = UDim2.new(1, -160, 1, -45)
                end
            end
        end
    end)
end)

-- ============================================================
-- TABS & SECTIONS
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

farmTab:Show()

-- ============================================================
-- GAME SERVICES & LOGIC FOR BEE SWARM SIMULATOR
-- ============================================================
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

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

local autoFarmActive = false
local autoTokensActive = false
local autoDigActive = false
local selectedField = "Pine Tree Forest"

-- 1. AUTO-FARM LOGIC
task.spawn(function()
    while task.wait(0.5) do
        if autoFarmActive then
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

-- 2. AUTO-DIG LOGIC
task.spawn(function()
    while task.wait(0.2) do
        if autoDigActive or autoFarmActive then
            pcall(function()
                local char = LocalPlayer.Character
                local tool = char and char:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                else
                    local bpTool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                    if bpTool and char then
                        bpTool.Parent = char
                    end
                end
            end)
        end
    end
end)

-- 3. AUTO-COLLECT TOKENS LOGIC
local function isTokenVisible(tok)
    if tok:IsA("BasePart") and tok.Transparency >= 0.5 then return false end
    local decal = tok:FindFirstChildOfClass("Decal") or tok:FindFirstChildOfClass("Texture")
    if decal and decal.Transparency >= 0.5 then return false end
    return true
end

task.spawn(function()
    while task.wait(0.3) do
        if autoTokensActive then
            local collectibles = Workspace:FindFirstChild("Collectibles") or Workspace:FindFirstChild("Tokens")
            if collectibles then
                local validTokens = {}
                for _, tok in ipairs(collectibles:GetChildren()) do
                    if (tok:IsA("BasePart") or tok:IsA("Model")) and isTokenVisible(tok) then
                        table.insert(validTokens, tok)
                    end
                end
                
                if #validTokens > 0 then
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local closestTok = validTokens[1]
                        local targetPos = getExactCenter(closestTok) + Vector3.new(0, 3, 0)
                        
                        hrp.Anchored = true
                        local tween = TweenService:Create(hrp, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPos)})
                        tween:Play()
                        tween.Completed:Wait()
                        hrp.Anchored = false
                    end
                end
            end
        end
    end
end)

-- ============================================================
-- POPULATE TABS
-- ============================================================

-- FARMING TAB
farmTab:AddLabel("--- Farming Controls ---")

farmTab:AddDropdown("Select Field", function(selected)
    selectedField = selected
    print("[Berlin v0.1] Selected Field:", selectedField)
end, {"Pine Tree Forest", "Sunflower Field", "Mushroom Field", "Dandelion Field", "Pineapple Patch", "Mountain Top Field", "Coconut Field", "Pepper Patch"})

farmTab:AddSwitch("Autofarm Field", function(state)
    autoFarmActive = state
    print("[Berlin v0.1] Auto-Farm:", state)
end)

farmTab:AddSwitch("Auto Dig / Swing Tool", function(state)
    autoDigActive = state
    print("[Berlin v0.1] Auto Dig:", state)
end)

farmTab:AddSwitch("Auto Collect Tokens", function(state)
    autoTokensActive = state
    print("[Berlin v0.1] Auto Tokens:", state)
end)

-- HOME TAB
homeTab:AddLabel("--- Berlin v0.1 Hub ---")
homeTab:AddLabel("UI Library: Official Elerium v2")
homeTab:AddLabel("Press RightShift to Toggle UI")

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

-- CONFIG / PLAYER TAB
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
print("✅ Berlin v0.1 (Clean Unobfuscated Elerium v2) Loaded Successfully!")
print("==================================================")
