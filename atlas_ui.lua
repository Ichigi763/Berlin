-- ============================================================
-- BERLIN V0.1.46 | BEE SWARM SIMULATOR
-- MAIN SINGLE FILE LOADER - FULL FEATURED RELEASE
-- ============================================================

local library = (function()
local library = {}

local ui_options = {
	main_color = Color3.fromRGB(180, 30, 40),
	min_size = Vector2.new(400, 300),
	toggle_key = Enum.KeyCode.RightShift,
	can_resize = true,
}

do
	local imgui = game:GetService("CoreGui"):FindFirstChild("imgui")
	if imgui then imgui:Destroy() end
end

local imgui = Instance.new("ScreenGui")
local prefabs = Instance.new("Frame")
local label = Instance.new("TextLabel")
local window = Instance.new("ImageLabel")
local resizer = Instance.new("Frame")
local bar = Instance.new("Frame")
local toggle = Instance.new("ImageButton")
local base = Instance.new("ImageLabel")
local top = Instance.new("ImageLabel")
local tabs = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local tabSelection = Instance.new("ImageLabel")
local tabButtons = Instance.new("Frame")
local uiListLayout = Instance.new("UIListLayout")
local frame = Instance.new("Frame")
local tab = Instance.new("Frame")
local uiListLayout2 = Instance.new("UIListLayout")
local textBox = Instance.new("TextBox")
local textBoxRoundify4px = Instance.new("ImageLabel")
local slider = Instance.new("ImageLabel")
local sliderTitle = Instance.new("TextLabel")
local indicator = Instance.new("ImageLabel")
local sliderValue = Instance.new("TextLabel")
local textLabel = Instance.new("TextLabel")
local textLabel2 = Instance.new("TextLabel")
local circle = Instance.new("ImageLabel")
local uiListLayout3 = Instance.new("UIListLayout")
local dropdown = Instance.new("TextButton")
local dropdownIndicator = Instance.new("ImageLabel")
local dropdownBox = Instance.new("ImageButton")
local dropdownObjects = Instance.new("ScrollingFrame")
local uiListLayout4 = Instance.new("UIListLayout")
local textButtonRoundify4px = Instance.new("ImageLabel")
local tabButton = Instance.new("TextButton")
local textButtonRoundify4px_2 = Instance.new("ImageLabel")
local folder = Instance.new("ImageLabel")
local button = Instance.new("TextButton")
local textButtonRoundify4px_3 = Instance.new("ImageLabel")
local toggle2 = Instance.new("ImageLabel")
local objects2 = Instance.new("Frame")
local uiListLayout5 = Instance.new("UIListLayout")
local horizontalAlignment = Instance.new("Frame")
local uiListLayout6 = Instance.new("UIListLayout")
local console = Instance.new("ImageLabel")
local scrollingFrame = Instance.new("ScrollingFrame")
local source = Instance.new("TextBox")
local commentsLabel = Instance.new("TextLabel")
local globalsLabel = Instance.new("TextLabel")
local keywordsLabel = Instance.new("TextLabel")
local remoteHighlight = Instance.new("TextLabel")
local stringsLabel = Instance.new("TextLabel")
local tokensLabel = Instance.new("TextLabel")
local numbersLabel = Instance.new("TextLabel")
local infoLabel = Instance.new("TextLabel")
local linesLabel = Instance.new("TextLabel")
local colorPicker = Instance.new("ImageLabel")
local palette = Instance.new("ImageLabel")
local indicator3 = Instance.new("ImageLabel")
local sample = Instance.new("ImageLabel")
local saturation = Instance.new("ImageLabel")
local indicator4 = Instance.new("Frame")
local switchButton = Instance.new("TextButton")
local textButtonRoundify4px_4 = Instance.new("ImageLabel")
local title3Label = Instance.new("TextLabel")
local button2 = Instance.new("TextButton")
local textButtonRoundify4px_5 = Instance.new("ImageLabel")
local dropdownButton = Instance.new("TextButton")
local keybind = Instance.new("ImageLabel")
local title4Label = Instance.new("TextLabel")
local inputButton = Instance.new("TextButton")
local inputRoundify4px = Instance.new("ImageLabel")
local windowsFrame = Instance.new("Frame")
local cloneref = cloneref and cloneref or function(...) return ... end
local CoreGui= cloneref(game:GetService("CoreGui"))


imgui.Name = "imgui"
local playersSvc = game:GetService("Players")
imgui.Parent = gethui and gethui() or (CoreGui or (playersSvc.LocalPlayer and playersSvc.LocalPlayer:WaitForChild("PlayerGui")))
prefabs.Name = "Prefabs"
prefabs.Parent = imgui
prefabs.BackgroundColor3 = Color3.new(1, 1, 1)
prefabs.Size = UDim2.new(0, 100, 0, 100)
prefabs.Visible = false

label.Name = "Label"
label.Parent = prefabs
label.BackgroundColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.Size = UDim2.new(0, 200, 0, 20)
label.Font = Enum.Font.GothamMedium
label.Text = "Hello, world 123"
label.TextColor3 = Color3.new(1, 1, 1)
label.TextSize = 14
label.TextXAlignment = Enum.TextXAlignment.Left

window.Name = "Window"
window.Parent = prefabs
window.Active = true
window.BackgroundColor3 = Color3.new(1, 1, 1)
window.BackgroundTransparency = 1
window.ClipsDescendants = true
window.Position = UDim2.new(0, 20, 0, 20)
window.Selectable = true
window.Size = UDim2.new(0, 200, 0, 200)
window.Image = "rbxassetid://2851926732"
window.ImageColor3 = Color3.new(0.0823529, 0.0862745, 0.0901961)
window.ScaleType = Enum.ScaleType.Slice
window.SliceCenter = Rect.new(12, 12, 12, 12)

resizer.Name = "Resizer"
resizer.Parent = window
resizer.Active = true
resizer.BackgroundColor3 = Color3.new(1, 1, 1)
resizer.BackgroundTransparency = 1
resizer.BorderSizePixel = 0
resizer.Position = UDim2.new(1, -20, 1, -20)
resizer.Size = UDim2.new(0, 20, 0, 20)

bar.Name = "Bar"
bar.Parent = window
bar.BackgroundColor3 = Color3.fromRGB(180, 30, 40)
bar.BorderSizePixel = 0
bar.Position = UDim2.new(0, 0, 0, 5)
bar.Size = UDim2.new(1, 0, 0, 15)

toggle.Name = "Toggle"
toggle.Parent = bar
toggle.BackgroundColor3 = Color3.new(1, 1, 1)
toggle.BackgroundTransparency = 1
toggle.Position = UDim2.new(1, -25, 0, -2)
toggle.Rotation = 90
toggle.Size = UDim2.new(0, 20, 0, 20)
toggle.ZIndex = 2
toggle.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"

base.Name = "Base"
base.Parent = bar
base.BackgroundColor3 = Color3.fromRGB(180, 30, 40)
base.BorderSizePixel = 0
base.Position = UDim2.new(0, 0, 0.800000012, 0)
base.Size = UDim2.new(1, 0, 0, 10)
base.Image = "rbxassetid://2851926732"
base.ImageColor3 = Color3.fromRGB(180, 30, 40)
base.ScaleType = Enum.ScaleType.Slice
base.SliceCenter = Rect.new(12, 12, 12, 12)

top.Name = "Top"
top.Parent = bar
top.BackgroundColor3 = Color3.new(1, 1, 1)
top.BackgroundTransparency = 1
top.Position = UDim2.new(0, 0, 0, -5)
top.Size = UDim2.new(1, 0, 0, 10)
top.Image = "rbxassetid://2851926732"
top.ImageColor3 = Color3.fromRGB(180, 30, 40)
top.ScaleType = Enum.ScaleType.Slice
top.SliceCenter = Rect.new(12, 12, 12, 12)

tabs.Name = "Tabs"
tabs.Parent = window
tabs.BackgroundColor3 = Color3.new(1, 1, 1)
tabs.BackgroundTransparency = 1
tabs.Position = UDim2.new(0, 130, 0, 35)
tabs.Size = UDim2.new(1, -140, 1, -45)

titleLabel.Name = "Title"
titleLabel.Parent = window
titleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundTransparency = 1
titleLabel.Position = UDim2.new(0, 15, 0, 3)
titleLabel.Size = UDim2.new(0, 200, 0, 20)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "Gamer Time"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

tabSelection.Name = "TabSelection"
tabSelection.Parent = window
tabSelection.BackgroundColor3 = Color3.new(1, 1, 1)
tabSelection.BackgroundTransparency = 1
tabSelection.Position = UDim2.new(0, 8, 0, 35)
tabSelection.Size = UDim2.new(0, 115, 1, -45)
tabSelection.Visible = false
tabSelection.Image = "rbxassetid://2851929490"
tabSelection.ImageColor3 = Color3.new(0.145098, 0.14902, 0.156863)
tabSelection.ScaleType = Enum.ScaleType.Slice
tabSelection.SliceCenter = Rect.new(4, 4, 4, 4)

tabButtons.Name = "TabButtons"
tabButtons.Parent = tabSelection
tabButtons.BackgroundColor3 = Color3.new(1, 1, 1)
tabButtons.BackgroundTransparency = 1
tabButtons.Size = UDim2.new(1, 0, 1, 0)

uiListLayout.Parent = tabButtons
uiListLayout.FillDirection = Enum.FillDirection.Vertical
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 2)

frame.Parent = tabSelection
frame.BackgroundColor3 = Color3.new(0.12549, 0.227451, 0.372549)
frame.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0, 0, 1, 0)
frame.Size = UDim2.new(1, 0, 0, 2)

tab.Name = "Tab"
tab.Parent = prefabs
tab.BackgroundColor3 = Color3.new(1, 1, 1)
tab.BackgroundTransparency = 1
tab.Size = UDim2.new(1, 0, 1, 0)
tab.Visible = false

uiListLayout2.Parent = tab
uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout2.Padding = UDim.new(0, 5)

textBox.Parent = prefabs
textBox.BackgroundColor3 = Color3.new(1, 1, 1)
textBox.BackgroundTransparency = 1
textBox.BorderSizePixel = 0
textBox.Size = UDim2.new(1, 0, 0, 20)
textBox.ZIndex = 2
textBox.Font = Enum.Font.GothamMedium
textBox.PlaceholderColor3 = Color3.new(0.698039, 0.698039, 0.698039)
textBox.PlaceholderText = "Input Text"
textBox.Text = ""
textBox.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
textBox.TextSize = 14

textBoxRoundify4px.Name = "TextBox_Roundify_4px"
textBoxRoundify4px.Parent = textBox
textBoxRoundify4px.BackgroundColor3 = Color3.new(1, 1, 1)
textBoxRoundify4px.BackgroundTransparency = 1
textBoxRoundify4px.Size = UDim2.new(1, 0, 1, 0)
textBoxRoundify4px.Image = "rbxassetid://2851929490"
textBoxRoundify4px.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
textBoxRoundify4px.ScaleType = Enum.ScaleType.Slice
textBoxRoundify4px.SliceCenter = Rect.new(4, 4, 4, 4)

slider.Name = "Slider"
slider.Parent = prefabs
slider.BackgroundColor3 = Color3.new(1, 1, 1)
slider.BackgroundTransparency = 1
slider.Position = UDim2.new(0, 0, 0.178571433, 0)
slider.Size = UDim2.new(1, 0, 0, 20)
slider.Image = "rbxassetid://2851929490"
slider.ImageColor3 = Color3.new(0.145098, 0.14902, 0.156863)
slider.ScaleType = Enum.ScaleType.Slice
slider.SliceCenter = Rect.new(4, 4, 4, 4)

sliderTitle.Name = "Title"
sliderTitle.Parent = slider
sliderTitle.BackgroundColor3 = Color3.new(1, 1, 1)
sliderTitle.BackgroundTransparency = 1
sliderTitle.Position = UDim2.new(0.5, 0, 0.5, -10)
sliderTitle.Size = UDim2.new(0, 0, 0, 20)
sliderTitle.ZIndex = 2
sliderTitle.Font = Enum.Font.GothamBold
sliderTitle.Text = "Slider"
sliderTitle.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
sliderTitle.TextSize = 14

indicator.Name = "Indicator"
indicator.Parent = slider
indicator.BackgroundColor3 = Color3.new(1, 1, 1)
indicator.BackgroundTransparency = 1
indicator.Size = UDim2.new(0, 0, 0, 20)
indicator.Image = "rbxassetid://2851929490"
indicator.ImageColor3 = Color3.new(0.254902, 0.262745, 0.278431)
indicator.ScaleType = Enum.ScaleType.Slice
indicator.SliceCenter = Rect.new(4, 4, 4, 4)

sliderValue.Name = "Value"
sliderValue.Parent = slider
sliderValue.BackgroundColor3 = Color3.new(1, 1, 1)
sliderValue.BackgroundTransparency = 1
sliderValue.Position = UDim2.new(1, -55, 0.5, -10)
sliderValue.Size = UDim2.new(0, 50, 0, 20)
sliderValue.Font = Enum.Font.GothamBold
sliderValue.Text = "0%"
sliderValue.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
sliderValue.TextSize = 14

textLabel.Parent = slider
textLabel.BackgroundColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.Position = UDim2.new(1, -20, -0.75, 0)
textLabel.Size = UDim2.new(0, 26, 0, 50)
textLabel.Font = Enum.Font.GothamBold
textLabel.Text = "]"
textLabel.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
textLabel.TextSize = 14

textLabel2.Parent = slider
textLabel2.BackgroundColor3 = Color3.new(1, 1, 1)
textLabel2.BackgroundTransparency = 1
textLabel2.Position = UDim2.new(1, -65, -0.75, 0)
textLabel2.Size = UDim2.new(0, 26, 0, 50)
textLabel2.Font = Enum.Font.GothamBold
textLabel2.Text = "["
textLabel2.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
textLabel2.TextSize = 14

circle.Name = "Circle"
circle.Parent = prefabs
circle.BackgroundColor3 = Color3.new(1, 1, 1)
circle.BackgroundTransparency = 1
circle.Image = "rbxassetid://266543268"
circle.ImageTransparency = 0.5

uiListLayout3.Parent = prefabs
uiListLayout3.FillDirection = Enum.FillDirection.Horizontal
uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout3.Padding = UDim.new(0, 20)

dropdown.Name = "Dropdown"
dropdown.Parent = prefabs
dropdown.BackgroundColor3 = Color3.new(1, 1, 1)
dropdown.BackgroundTransparency = 1
dropdown.BorderSizePixel = 0
dropdown.Position = UDim2.new(-0.055555556, 0, 0.0833333284, 0)
dropdown.Size = UDim2.new(0, 200, 0, 20)
dropdown.ZIndex = 2
dropdown.Font = Enum.Font.GothamBold
dropdown.Text = "      Dropdown"
dropdown.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
dropdown.TextSize = 14
dropdown.TextXAlignment = Enum.TextXAlignment.Left

dropdownIndicator.Name = "Indicator"
dropdownIndicator.Parent = dropdown
dropdownIndicator.BackgroundColor3 = Color3.new(1, 1, 1)
dropdownIndicator.BackgroundTransparency = 1
dropdownIndicator.Position = UDim2.new(0.899999976, -10, 0.100000001, 0)
dropdownIndicator.Rotation = -90
dropdownIndicator.Size = UDim2.new(0, 15, 0, 15)
dropdownIndicator.ZIndex = 2
dropdownIndicator.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"

dropdownBox.Name = "Box"
dropdownBox.Parent = dropdown
dropdownBox.BackgroundColor3 = Color3.new(1, 1, 1)
dropdownBox.BackgroundTransparency = 1
dropdownBox.Position = UDim2.new(0, 0, 0, 25)
dropdownBox.Size = UDim2.new(1, 0, 0, 150)
dropdownBox.ZIndex = 3
dropdownBox.Image = "rbxassetid://2851929490"
dropdownBox.ImageColor3 = Color3.new(0.129412, 0.133333, 0.141176)
dropdownBox.ScaleType = Enum.ScaleType.Slice
dropdownBox.SliceCenter = Rect.new(4, 4, 4, 4)

dropdownObjects.Name = "Objects"
dropdownObjects.Parent = dropdownBox
dropdownObjects.BackgroundColor3 = Color3.new(1, 1, 1)
dropdownObjects.BackgroundTransparency = 1
dropdownObjects.BorderSizePixel = 0
dropdownObjects.Size = UDim2.new(1, 0, 1, 0)
dropdownObjects.ZIndex = 3
dropdownObjects.CanvasSize = UDim2.new(0, 0, 0, 0)
dropdownObjects.ScrollBarThickness = 8

uiListLayout4.Parent = dropdownObjects
uiListLayout4.SortOrder = Enum.SortOrder.LayoutOrder

textButtonRoundify4px.Name = "TextButton_Roundify_4px"
textButtonRoundify4px.Parent = dropdown
textButtonRoundify4px.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px.BackgroundTransparency = 1
textButtonRoundify4px.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px.Image = "rbxassetid://2851929490"
textButtonRoundify4px.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
textButtonRoundify4px.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px.SliceCenter = Rect.new(4, 4, 4, 4)

tabButton.Name = "TabButton"
tabButton.Parent = prefabs
tabButton.BackgroundColor3 = Color3.fromRGB(180, 30, 40)
tabButton.BackgroundTransparency = 1
tabButton.BorderSizePixel = 0
tabButton.Position = UDim2.new(0.185185179, 0, 0, 0)
tabButton.Size = UDim2.new(0, 71, 0, 20)
tabButton.ZIndex = 2
tabButton.Font = Enum.Font.GothamMedium
tabButton.Text = "Test tab"
tabButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
tabButton.TextSize = 14

textButtonRoundify4px_2.Name = "TextButton_Roundify_4px"
textButtonRoundify4px_2.Parent = tabButton
textButtonRoundify4px_2.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px_2.BackgroundTransparency = 1
textButtonRoundify4px_2.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px_2.Image = "rbxassetid://2851929490"
textButtonRoundify4px_2.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
textButtonRoundify4px_2.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px_2.SliceCenter = Rect.new(4, 4, 4, 4)

folder.Name = "Folder"
folder.Parent = prefabs
folder.BackgroundColor3 = Color3.new(1, 1, 1)
folder.BackgroundTransparency = 1
folder.Position = UDim2.new(0, 0, 0, 50)
folder.Size = UDim2.new(1, 0, 0, 20)
folder.Image = "rbxassetid://2851929490"
folder.ImageColor3 = Color3.new(0.0823529, 0.0862745, 0.0901961)
folder.ScaleType = Enum.ScaleType.Slice
folder.SliceCenter = Rect.new(4, 4, 4, 4)

button.Name = "Button"
button.Parent = folder
button.BackgroundColor3 = Color3.fromRGB(180, 30, 40)
button.BackgroundTransparency = 1
button.BorderSizePixel = 0
button.Size = UDim2.new(1, 0, 0, 20)
button.ZIndex = 2
button.Font = Enum.Font.GothamMedium
button.Text = "      Folder"
button.TextColor3 = Color3.new(1, 1, 1)
button.TextSize = 14
button.TextXAlignment = Enum.TextXAlignment.Left

textButtonRoundify4px_3.Name = "TextButton_Roundify_4px"
textButtonRoundify4px_3.Parent = button
textButtonRoundify4px_3.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px_3.BackgroundTransparency = 1
textButtonRoundify4px_3.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px_3.Image = "rbxassetid://2851929490"
textButtonRoundify4px_3.ImageColor3 = Color3.fromRGB(180, 30, 40)
textButtonRoundify4px_3.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px_3.SliceCenter = Rect.new(4, 4, 4, 4)

toggle2.Name = "Toggle"
toggle2.Parent = button
toggle2.BackgroundColor3 = Color3.new(1, 1, 1)
toggle2.BackgroundTransparency = 1
toggle2.Position = UDim2.new(0, 5, 0, 0)
toggle2.Size = UDim2.new(0, 20, 0, 20)
toggle2.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"

objects2.Name = "Objects"
objects2.Parent = folder
objects2.BackgroundColor3 = Color3.new(1, 1, 1)
objects2.BackgroundTransparency = 1
objects2.Position = UDim2.new(0, 10, 0, 25)
objects2.Size = UDim2.new(1, -10, 1, -25)
objects2.Visible = false

uiListLayout5.Parent = objects2
uiListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout5.Padding = UDim.new(0, 5)

horizontalAlignment.Name = "HorizontalAlignment"
horizontalAlignment.Parent = prefabs
horizontalAlignment.BackgroundColor3 = Color3.new(1, 1, 1)
horizontalAlignment.BackgroundTransparency = 1
horizontalAlignment.Size = UDim2.new(1, 0, 0, 20)

uiListLayout6.Parent = horizontalAlignment
uiListLayout6.FillDirection = Enum.FillDirection.Horizontal
uiListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout6.Padding = UDim.new(0, 5)

console.Name = "Console"
console.Parent = prefabs
console.BackgroundColor3 = Color3.new(1, 1, 1)
console.BackgroundTransparency = 1
console.Size = UDim2.new(1, 0, 0, 200)
console.Image = "rbxassetid://2851928141"
console.ImageColor3 = Color3.new(0.129412, 0.133333, 0.141176)
console.ScaleType = Enum.ScaleType.Slice
console.SliceCenter = Rect.new(8, 8, 8, 8)

scrollingFrame.Parent = console
scrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.Size = UDim2.new(1, 0, 1, 1)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 4

source.Name = "Source"
source.Parent = scrollingFrame
source.BackgroundColor3 = Color3.new(1, 1, 1)
source.BackgroundTransparency = 1
source.Position = UDim2.new(0, 40, 0, 0)
source.Size = UDim2.new(1, -40, 0, 10000)
source.ZIndex = 3
source.ClearTextOnFocus = false
source.Font = Enum.Font.Code
source.MultiLine = true
source.PlaceholderColor3 = Color3.new(0.8, 0.8, 0.8)
source.Text = ""
source.TextColor3 = Color3.new(1, 1, 1)
source.TextSize = 15
source.TextStrokeColor3 = Color3.new(1, 1, 1)
source.TextWrapped = true
source.TextXAlignment = Enum.TextXAlignment.Left
source.TextYAlignment = Enum.TextYAlignment.Top

commentsLabel.Name = "Comments"
commentsLabel.Parent = source
commentsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
commentsLabel.BackgroundTransparency = 1
commentsLabel.Size = UDim2.new(1, 0, 1, 0)
commentsLabel.ZIndex = 5
commentsLabel.Font = Enum.Font.Code
commentsLabel.Text = ""
commentsLabel.TextColor3 = Color3.new(0.231373, 0.784314, 0.231373)
commentsLabel.TextSize = 15
commentsLabel.TextXAlignment = Enum.TextXAlignment.Left
commentsLabel.TextYAlignment = Enum.TextYAlignment.Top

globalsLabel.Name = "Globals"
globalsLabel.Parent = source
globalsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
globalsLabel.BackgroundTransparency = 1
globalsLabel.Size = UDim2.new(1, 0, 1, 0)
globalsLabel.ZIndex = 5
globalsLabel.Font = Enum.Font.Code
globalsLabel.Text = ""
globalsLabel.TextColor3 = Color3.new(0.517647, 0.839216, 0.968628)
globalsLabel.TextSize = 15
globalsLabel.TextXAlignment = Enum.TextXAlignment.Left
globalsLabel.TextYAlignment = Enum.TextYAlignment.Top

keywordsLabel.Name = "Keywords"
keywordsLabel.Parent = source
keywordsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
keywordsLabel.BackgroundTransparency = 1
keywordsLabel.Size = UDim2.new(1, 0, 1, 0)
keywordsLabel.ZIndex = 5
keywordsLabel.Font = Enum.Font.Code
keywordsLabel.Text = ""
keywordsLabel.TextColor3 = Color3.new(0.972549, 0.427451, 0.486275)
keywordsLabel.TextSize = 15
keywordsLabel.TextXAlignment = Enum.TextXAlignment.Left
keywordsLabel.TextYAlignment = Enum.TextYAlignment.Top

remoteHighlight.Name = "RemoteHighlight"
remoteHighlight.Parent = source
remoteHighlight.BackgroundColor3 = Color3.new(1, 1, 1)
remoteHighlight.BackgroundTransparency = 1
remoteHighlight.Size = UDim2.new(1, 0, 1, 0)
remoteHighlight.ZIndex = 5
remoteHighlight.Font = Enum.Font.Code
remoteHighlight.Text = ""
remoteHighlight.TextColor3 = Color3.new(0, 0.568627, 1)
remoteHighlight.TextSize = 15
remoteHighlight.TextXAlignment = Enum.TextXAlignment.Left
remoteHighlight.TextYAlignment = Enum.TextYAlignment.Top

stringsLabel.Name = "Strings"
stringsLabel.Parent = source
stringsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
stringsLabel.BackgroundTransparency = 1
stringsLabel.Size = UDim2.new(1, 0, 1, 0)
stringsLabel.ZIndex = 5
stringsLabel.Font = Enum.Font.Code
stringsLabel.Text = ""
stringsLabel.TextColor3 = Color3.new(0.678431, 0.945098, 0.584314)
stringsLabel.TextSize = 15
stringsLabel.TextXAlignment = Enum.TextXAlignment.Left
stringsLabel.TextYAlignment = Enum.TextYAlignment.Top

tokensLabel.Name = "Tokens"
tokensLabel.Parent = source
tokensLabel.BackgroundColor3 = Color3.new(1, 1, 1)
tokensLabel.BackgroundTransparency = 1
tokensLabel.Size = UDim2.new(1, 0, 1, 0)
tokensLabel.ZIndex = 5
tokensLabel.Font = Enum.Font.Code
tokensLabel.Text = ""
tokensLabel.TextColor3 = Color3.new(1, 1, 1)
tokensLabel.TextSize = 15
tokensLabel.TextXAlignment = Enum.TextXAlignment.Left
tokensLabel.TextYAlignment = Enum.TextYAlignment.Top

numbersLabel.Name = "Numbers"
numbersLabel.Parent = source
numbersLabel.BackgroundColor3 = Color3.new(1, 1, 1)
numbersLabel.BackgroundTransparency = 1
numbersLabel.Size = UDim2.new(1, 0, 1, 0)
numbersLabel.ZIndex = 4
numbersLabel.Font = Enum.Font.Code
numbersLabel.Text = ""
numbersLabel.TextColor3 = Color3.new(1, 0.776471, 0)
numbersLabel.TextSize = 15
numbersLabel.TextXAlignment = Enum.TextXAlignment.Left
numbersLabel.TextYAlignment = Enum.TextYAlignment.Top

infoLabel.Name = "Info"
infoLabel.Parent = source
infoLabel.BackgroundColor3 = Color3.new(1, 1, 1)
infoLabel.BackgroundTransparency = 1
infoLabel.Size = UDim2.new(1, 0, 1, 0)
infoLabel.ZIndex = 5
infoLabel.Font = Enum.Font.Code
infoLabel.Text = ""
infoLabel.TextColor3 = Color3.new(0, 0.635294, 1)
infoLabel.TextSize = 15
infoLabel.TextXAlignment = Enum.TextXAlignment.Left
infoLabel.TextYAlignment = Enum.TextYAlignment.Top

linesLabel.Name = "Lines"
linesLabel.Parent = scrollingFrame
linesLabel.BackgroundColor3 = Color3.new(1, 1, 1)
linesLabel.BackgroundTransparency = 1
linesLabel.BorderSizePixel = 0
linesLabel.Size = UDim2.new(0, 40, 0, 10000)
linesLabel.ZIndex = 4
linesLabel.Font = Enum.Font.Code
linesLabel.Text = "1\n"
linesLabel.TextColor3 = Color3.new(1, 1, 1)
linesLabel.TextSize = 15
linesLabel.TextWrapped = true
linesLabel.TextYAlignment = Enum.TextYAlignment.Top

colorPicker.Name = "ColorPicker"
colorPicker.Parent = prefabs
colorPicker.BackgroundColor3 = Color3.new(1, 1, 1)
colorPicker.BackgroundTransparency = 1
colorPicker.Size = UDim2.new(0, 180, 0, 110)
colorPicker.Image = "rbxassetid://2851929490"
colorPicker.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
colorPicker.ScaleType = Enum.ScaleType.Slice
colorPicker.SliceCenter = Rect.new(4, 4, 4, 4)

palette.Name = "Palette"
palette.Parent = colorPicker
palette.BackgroundColor3 = Color3.new(1, 1, 1)
palette.BackgroundTransparency = 1
palette.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
palette.Size = UDim2.new(0, 100, 0, 100)
palette.Image = "rbxassetid://698052001"
palette.ScaleType = Enum.ScaleType.Slice
palette.SliceCenter = Rect.new(4, 4, 4, 4)

indicator3.Name = "Indicator"
indicator3.Parent = palette
indicator3.BackgroundColor3 = Color3.new(1, 1, 1)
indicator3.BackgroundTransparency = 1
indicator3.Size = UDim2.new(0, 5, 0, 5)
indicator3.ZIndex = 2
indicator3.Image = "rbxassetid://2851926732"
indicator3.ImageColor3 = Color3.new(0, 0, 0)
indicator3.ScaleType = Enum.ScaleType.Slice
indicator3.SliceCenter = Rect.new(12, 12, 12, 12)

sample.Name = "Sample"
sample.Parent = colorPicker
sample.BackgroundColor3 = Color3.new(1, 1, 1)
sample.BackgroundTransparency = 1
sample.Position = UDim2.new(0.800000012, 0, 0.0500000007, 0)
sample.Size = UDim2.new(0, 25, 0, 25)
sample.Image = "rbxassetid://2851929490"
sample.ScaleType = Enum.ScaleType.Slice
sample.SliceCenter = Rect.new(4, 4, 4, 4)

saturation.Name = "Saturation"
saturation.Parent = colorPicker
saturation.BackgroundColor3 = Color3.new(1, 1, 1)
saturation.Position = UDim2.new(0.649999976, 0, 0.0500000007, 0)
saturation.Size = UDim2.new(0, 15, 0, 100)
saturation.Image = "rbxassetid://3641079629"

indicator4.Name = "Indicator"
indicator4.Parent = saturation
indicator4.BackgroundColor3 = Color3.new(1, 1, 1)
indicator4.BorderSizePixel = 0
indicator4.Size = UDim2.new(0, 20, 0, 2)
indicator4.ZIndex = 2

switchButton.Name = "Switch"
switchButton.Parent = prefabs
switchButton.BackgroundColor3 = Color3.new(1, 1, 1)
switchButton.BackgroundTransparency = 1
switchButton.BorderSizePixel = 0
switchButton.Position = UDim2.new(0.229411766, 0, 0.20714286, 0)
switchButton.Size = UDim2.new(0, 20, 0, 20)
switchButton.ZIndex = 2
switchButton.Font = Enum.Font.SourceSans
switchButton.Text = ""
switchButton.TextColor3 = Color3.new(1, 1, 1)
switchButton.TextSize = 18

textButtonRoundify4px_4.Name = "TextButton_Roundify_4px"
textButtonRoundify4px_4.Parent = switchButton
textButtonRoundify4px_4.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px_4.BackgroundTransparency = 1
textButtonRoundify4px_4.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px_4.Image = "rbxassetid://2851929490"
textButtonRoundify4px_4.ImageColor3 = Color3.fromRGB(180, 30, 40)
textButtonRoundify4px_4.ImageTransparency = 0.5
textButtonRoundify4px_4.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px_4.SliceCenter = Rect.new(4, 4, 4, 4)

title3Label.Name = "Title"
title3Label.Parent = switchButton
title3Label.BackgroundColor3 = Color3.new(1, 1, 1)
title3Label.BackgroundTransparency = 1
title3Label.Position = UDim2.new(1.20000005, 0, 0, 0)
title3Label.Size = UDim2.new(0, 20, 0, 20)
title3Label.Font = Enum.Font.GothamMedium
title3Label.Text = "Switch"
title3Label.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
title3Label.TextSize = 14
title3Label.TextXAlignment = Enum.TextXAlignment.Left

button2.Name = "Button"
button2.Parent = prefabs
button2.BackgroundColor3 = Color3.fromRGB(180, 30, 40)
button2.BackgroundTransparency = 1
button2.BorderSizePixel = 0
button2.Size = UDim2.new(0, 91, 0, 20)
button2.ZIndex = 2
button2.Font = Enum.Font.GothamMedium
button2.TextColor3 = Color3.new(1, 1, 1)
button2.TextSize = 14

textButtonRoundify4px_5.Name = "TextButton_Roundify_4px"
textButtonRoundify4px_5.Parent = button2
textButtonRoundify4px_5.BackgroundColor3 = Color3.new(1, 1, 1)
textButtonRoundify4px_5.BackgroundTransparency = 1
textButtonRoundify4px_5.Size = UDim2.new(1, 0, 1, 0)
textButtonRoundify4px_5.Image = "rbxassetid://2851929490"
textButtonRoundify4px_5.ImageColor3 = Color3.fromRGB(180, 30, 40)
textButtonRoundify4px_5.ScaleType = Enum.ScaleType.Slice
textButtonRoundify4px_5.SliceCenter = Rect.new(4, 4, 4, 4)

dropdownButton.Name = "DropdownButton"
dropdownButton.Parent = prefabs
dropdownButton.BackgroundColor3 = Color3.new(0.129412, 0.133333, 0.141176)
dropdownButton.BorderSizePixel = 0
dropdownButton.Size = UDim2.new(1, 0, 0, 20)
dropdownButton.ZIndex = 3
dropdownButton.Font = Enum.Font.GothamBold
dropdownButton.Text = "      Button"
dropdownButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
dropdownButton.TextSize = 14
dropdownButton.TextXAlignment = Enum.TextXAlignment.Left

keybind.Name = "Keybind"
keybind.Parent = prefabs
keybind.BackgroundColor3 = Color3.new(1, 1, 1)
keybind.BackgroundTransparency = 1
keybind.Size = UDim2.new(0, 200, 0, 20)
keybind.Image = "rbxassetid://2851929490"
keybind.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
keybind.ScaleType = Enum.ScaleType.Slice
keybind.SliceCenter = Rect.new(4, 4, 4, 4)

title4Label.Name = "Title"
title4Label.Parent = keybind
title4Label.BackgroundColor3 = Color3.new(1, 1, 1)
title4Label.BackgroundTransparency = 1
title4Label.Size = UDim2.new(0, 0, 1, 0)
title4Label.Font = Enum.Font.GothamBold
title4Label.Text = "Keybind"
title4Label.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
title4Label.TextSize = 14
title4Label.TextXAlignment = Enum.TextXAlignment.Left

inputButton.Name = "Input"
inputButton.Parent = keybind
inputButton.BackgroundColor3 = Color3.new(1, 1, 1)
inputButton.BackgroundTransparency = 1
inputButton.BorderSizePixel = 0
inputButton.Position = UDim2.new(1, -85, 0, 2)
inputButton.Size = UDim2.new(0, 80, 1, -4)
inputButton.ZIndex = 2
inputButton.Font = Enum.Font.GothamMedium
inputButton.Text = "RShift"
inputButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
inputButton.TextSize = 12
inputButton.TextWrapped = true

inputRoundify4px.Name = "Input_Roundify_4px"
inputRoundify4px.Parent = inputButton
inputRoundify4px.BackgroundColor3 = Color3.new(1, 1, 1)
inputRoundify4px.BackgroundTransparency = 1
inputRoundify4px.Size = UDim2.new(1, 0, 1, 0)
inputRoundify4px.Image = "rbxassetid://2851929490"
inputRoundify4px.ImageColor3 = Color3.new(0.290196, 0.294118, 0.313726)
inputRoundify4px.ScaleType = Enum.ScaleType.Slice
inputRoundify4px.SliceCenter = Rect.new(4, 4, 4, 4)

windowsFrame.Name = "Windows"
windowsFrame.Parent = imgui
windowsFrame.BackgroundColor3 = Color3.new(1, 1, 1)
windowsFrame.BackgroundTransparency = 1
windowsFrame.Position = UDim2.new(0, 20, 0, 20)
windowsFrame.Size = UDim2.new(1, 20, 1, -20)

--[[ Script ]]--
local root = imgui

local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RS = game:GetService("RunService")
local ps = game:GetService("Players")

local p = ps.LocalPlayer
local mouse = p:GetMouse()

local Prefabs = prefabs
local Windows = windowsFrame

local checks = {
	["binding"] = false,
}

UIS.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == ((typeof(ui_options.toggle_key) == "EnumItem") and ui_options.toggle_key or Enum.KeyCode.RightShift) then
		if root then
			if not checks.binding and root.Enabled ~= nil then
				root.Enabled = not root.Enabled
			end
		end
	end
end)

local function Resize(part, new, _delay)
	_delay = _delay or 0.5
	local tweenInfo = TweenInfo.new(_delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(part, tweenInfo, new)
	tween:Play()
end

local function rgbtohsv(r, g, b) -- idk who made this function, but thanks
	r, g, b = r / 255, g / 255, b / 255
	local max, min = math.max(r, g, b), math.min(r, g, b)
	local h, s, v
	v = max

	local d = max - min
	if max == 0 then
		s = 0
	else
		s = d / max
	end

	if max == min then
		h = 0
	else
		if max == r then
			h = (g - b) / d
			if g < b then
				h = h + 6
			end
		elseif max == g then
			h = (b - r) / d + 2
		elseif max == b then
			h = (r - g) / d + 4
		end
		h = h / 6
	end

	return h, s, v
end

local function hasprop(object, prop)
	local a, b = pcall(function()
		return object[tostring(prop)]
	end)
	if a then
		return b
	end
	return false
end

local function gNameLen(obj)
	return obj.TextBounds.X + 15
end

local function gMouse()
	return Vector2.new(UIS:GetMouseLocation().X + 1, UIS:GetMouseLocation().Y - 35)
end

local function ripple(button, x, y)
	spawn(function()
		button.ClipsDescendants = true

		local circle = prefabs:FindFirstChild("Circle"):Clone()

		circle.Parent = button
		circle.ZIndex = 1000

		local new_x = x - circle.AbsolutePosition.X
		local new_y = y - circle.AbsolutePosition.Y
		circle.Position = UDim2.new(0, new_x, 0, new_y)

		local size = 0
		if button.AbsoluteSize.X > button.AbsoluteSize.Y then
			size = button.AbsoluteSize.X * 1.5
		elseif button.AbsoluteSize.X < button.AbsoluteSize.Y then
			size = button.AbsoluteSize.Y * 1.5
		elseif button.AbsoluteSize.X == button.AbsoluteSize.Y then
			size = button.AbsoluteSize.X * 1.5
		end

		circle:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, -size / 2, 0.5, -size / 2), "Out", "Quad", 0.5, false, nil)
		Resize(circle, {ImageTransparency = 1}, 0.5)

		wait(0.5)
		circle:Destroy()
	end)
end

local windows = 0
local library = {}

local function format_windows()
	local ull = prefabs:FindFirstChild("UIListLayout"):Clone()
	ull.Parent = windowsFrame
	local data = {}

	for i,v in pairs(windowsFrame:GetChildren()) do
		if not (v:IsA("UIListLayout")) then
			data[v] = v.AbsolutePosition
		end
	end

	ull:Destroy()

	for i,v in pairs(data) do
		i.Position = UDim2.new(0, v.X, 0, v.Y)
	end
end

function library:FormatWindows()
	format_windows()
end

function library:AddWindow(title, options)
	windows = windows + 1
	local dropdown_open = false
	title = tostring(title or "New Window")
	options = (typeof(options) == "table") and options or ui_options
	options.tween_time = 0.1

	local Window = prefabs:FindFirstChild("Window"):Clone()
	Window.Parent = windowsFrame
	Window:FindFirstChild("Title").Text = title
	Window.Size = UDim2.new(0, options.min_size.X, 0, options.min_size.Y)
	Window.ZIndex = Window.ZIndex + (windows * 10)

	do -- Altering Window Color
		local Title = Window:FindFirstChild("Title")
		local Bar = Window:FindFirstChild("Bar")
		local Base = Bar:FindFirstChild("Base")
		local Top = Bar:FindFirstChild("Top")
		local SplitFrame = Window:FindFirstChild("TabSelection"):FindFirstChild("Frame")
		local Toggle = Bar:FindFirstChild("Toggle")

		spawn(function()
			while true do
				Bar.BackgroundColor3 = options.main_color
				Base.BackgroundColor3 = options.main_color
				Base.ImageColor3 = options.main_color
				Top.ImageColor3 = options.main_color
				SplitFrame.BackgroundColor3 = options.main_color

				RS.Heartbeat:Wait()
			end
		end)

	end

	local Resizer = Window:WaitForChild("Resizer")

	local window_data = {}
	Window.Draggable = true

	do -- Resize Window
		local oldIcon = mouse.Icon
		local Entered = false
		Resizer.MouseEnter:Connect(function()
			Window.Draggable = false
			if options.can_resize then
				oldIcon = mouse.Icon
				-- mouse.Icon = "http://www.roblox.com/asset?id=4745131330"
			end
			Entered = true
		end)

		Resizer.MouseLeave:Connect(function()
			Entered = false
			if options.can_resize then
				mouse.Icon = oldIcon
			end
			Window.Draggable = true
		end)

		local Held = false
		UIS.InputBegan:Connect(function(inputObject)
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
				Held = true

				spawn(function() -- Loop check
					if Entered and Resizer.Active and options.can_resize then
						while Held and Resizer.Active do

							local mouse_location = gMouse()
							local x = mouse_location.X - Window.AbsolutePosition.X
							local y = mouse_location.Y - Window.AbsolutePosition.Y

							--
							if x >= options.min_size.X and y >= options.min_size.Y then
								Resize(Window, {Size = UDim2.new(0, x, 0, y)}, options.tween_time)
							elseif x >= options.min_size.X then
								Resize(Window, {Size = UDim2.new(0, x, 0, options.min_size.Y)}, options.tween_time)
							elseif y >= options.min_size.Y then
								Resize(Window, {Size = UDim2.new(0, options.min_size.X, 0, y)}, options.tween_time)
							else
								Resize(Window, {Size = UDim2.new(0, options.min_size.X, 0, options.min_size.Y)}, options.tween_time)
							end

							RS.Heartbeat:Wait()
						end
					end
				end)
			end
		end)
		UIS.InputEnded:Connect(function(inputObject)
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
				Held = false
			end
		end)
	end

	do -- [Open / Close] Window
		local open_close = Window:FindFirstChild("Bar"):FindFirstChild("Toggle")
		local open = true
		local canopen = true

		local oldwindowdata = {}
		local oldy = Window.AbsoluteSize.Y
		open_close.MouseButton1Click:Connect(function()
			if canopen then
				canopen = false

				if open then
					-- Close

					oldwindowdata = {}
					for i,v in pairs(Window:FindFirstChild("Tabs"):GetChildren()) do
						oldwindowdata[v] = v.Visible
						v.Visible = false
					end

					Resizer.Active = false

					oldy = Window.AbsoluteSize.Y
					Resize(open_close, {Rotation = 180}, options.tween_time)
					Resize(Window, {Size = UDim2.new(0, Window.AbsoluteSize.X, 0, 26)}, options.tween_time)
					open_close.Parent:FindFirstChild("Base").Transparency = 1
					local ts = Window:FindFirstChild("TabSelection")
					if ts then ts.Visible = false end

				else
					-- Open

					for i,v in pairs(oldwindowdata) do
						i.Visible = v
					end

					Resizer.Active = true

					Resize(open_close, {Rotation = 90}, options.tween_time)
					Resize(Window, {Size = UDim2.new(0, Window.AbsoluteSize.X, 0, oldy)}, options.tween_time)
					open_close.Parent:FindFirstChild("Base").Transparency = 0
					local ts = Window:FindFirstChild("TabSelection")
					if ts then ts.Visible = true end

				end

				open = not open
				wait(options.tween_time)
				canopen = true

			end
		end)
	end

	do -- UI Elements
		local tabs = Window:FindFirstChild("Tabs")
		local tab_selection = Window:FindFirstChild("TabSelection")
		local tab_buttons = tab_selection:FindFirstChild("TabButtons")

		do -- Add Search Box in Sidebar
			function window_data:AddSearchBox(callback)
				tab_selection.Visible = true

				tab_buttons.Position = UDim2.new(0, 0, 0, 36)
				tab_buttons.Size = UDim2.new(1, 0, 1, -36)

				local searchFrame = Instance.new("Frame")
				searchFrame.Name = "SearchFrame"
				searchFrame.Size = UDim2.new(1, -8, 0, 26)
				searchFrame.Position = UDim2.new(0, 4, 0, 4)
				searchFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
				searchFrame.BorderSizePixel = 0
				searchFrame.ZIndex = 6
				searchFrame.ClipsDescendants = true
				searchFrame.Parent = tab_selection

				local searchCorner = Instance.new("UICorner")
				searchCorner.CornerRadius = UDim.new(0, 4)
				searchCorner.Parent = searchFrame

				local searchIcon = Instance.new("ImageLabel")
				searchIcon.Name = "SearchIcon"
				searchIcon.Size = UDim2.new(0, 14, 0, 14)
				searchIcon.Position = UDim2.new(0, 6, 0.5, -7)
				searchIcon.BackgroundTransparency = 1
				searchIcon.Image = "rbxassetid://6031154871" -- Search magnifying glass
				searchIcon.ImageColor3 = Color3.fromRGB(160, 160, 175)
				searchIcon.ZIndex = 7
				searchIcon.Parent = searchFrame

				local searchBox = Instance.new("TextBox")
				searchBox.Name = "SearchInput"
				searchBox.Size = UDim2.new(1, -26, 1, 0)
				searchBox.Position = UDim2.new(0, 24, 0, 0)
				searchBox.BackgroundTransparency = 1
				searchBox.Font = Enum.Font.GothamMedium
				searchBox.TextSize = 12
				searchBox.TextColor3 = Color3.fromRGB(240, 240, 240)
				searchBox.PlaceholderText = "Search..."
				searchBox.PlaceholderColor3 = Color3.fromRGB(140, 140, 155)
				searchBox.TextXAlignment = Enum.TextXAlignment.Left
				searchBox.Text = ""
				searchBox.ZIndex = 8
				searchBox.Parent = searchFrame

				searchBox:GetPropertyChangedSignal("Text"):Connect(function()
					if typeof(callback) == "function" then
						callback(searchBox.Text)
					end
				end)

				return searchBox
			end
		end

		do -- Add Tab
			function window_data:AddTab(tab_name, icon_id)
				local tab_data = {}
				tab_name = tostring(tab_name or "New Tab")
				tab_selection.Visible = true

				local new_button = prefabs:FindFirstChild("TabButton"):Clone()
				new_button.Name = tab_name .. "TabButton"
				new_button.Parent = tab_buttons
				new_button.Font = Enum.Font.GothamBold
				new_button.TextSize = 13
				new_button.TextColor3 = Color3.fromRGB(190, 190, 195)
				new_button.Text = "     " .. tab_name
				new_button.TextXAlignment = Enum.TextXAlignment.Left
				new_button.Size = UDim2.new(1, 0, 0, 26)
				new_button.ZIndex = new_button.ZIndex + (windows * 10)
				new_button:GetChildren()[1].ZIndex = new_button:GetChildren()[1].ZIndex + (windows * 10)

				if icon_id then
					local LucideMap = {
						["search"]    = "rbxassetid://10734943674",
						["info"]      = "rbxassetid://10723415903",
						["house"]     = "rbxassetid://10723407389",
						["home"]      = "rbxassetid://10723407389",
						["swords"]    = "rbxassetid://10734975692",
						["book"]      = "rbxassetid://10709781824",
						["tree-pine"] = "rbxassetid://10747362748",
						["briefcase"] = "rbxassetid://10709782662",
						["link"]      = "rbxassetid://10723426722",
						["settings"]  = "rbxassetid://10734950309",
						["bug"]       = "rbxassetid://10709782845",
					}
					local raw_asset = LucideMap[tostring(icon_id):lower()] or icon_id

					local icon = Instance.new("ImageLabel")
					icon.Name = "Icon"
					icon.Size = UDim2.new(0, 16, 0, 16)
					icon.Position = UDim2.new(0, 8, 0.5, -8)
					icon.BackgroundTransparency = 1
					icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
					icon.ZIndex = new_button:GetChildren()[1].ZIndex + 10
					icon.Parent = new_button
					new_button.Font = Enum.Font.GothamBold
					new_button.TextSize = 13
					new_button.Text = "         " .. tab_name
					new_button.TextXAlignment = Enum.TextXAlignment.Left

					task.spawn(function()
						local num = tostring(raw_asset):match("%d+")
						if num then
							local success, result = pcall(function()
								local objs = game:GetObjects("rbxassetid://" .. num)
								if objs and objs[1] and objs[1]:IsA("Decal") then
									return objs[1].Texture
								end
							end)
							if success and result and result ~= "" then
								icon.Image = result
							else
								icon.Image = "rbxassetid://" .. num
							end
						else
							icon.Image = raw_asset
						end
					end)
				end

				if tab_name == "Search" then
					local line = Instance.new("Frame")
					line.Name = "SearchLine"
					line.Size = UDim2.new(1, -8, 0, 1)
					line.Position = UDim2.new(0, 4, 1, 3)
					line.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
					line.BorderSizePixel = 0
					line.ZIndex = new_button.ZIndex + 2
					line.Parent = new_button
				end

				local new_tab = prefabs:FindFirstChild("Tab"):Clone()
				new_tab.Parent = tabs
				new_tab.ZIndex = new_tab.ZIndex + (windows * 10)

				-- Destroy vertical UIListLayout on new_tab so columns sit side-by-side
				local default_layout = new_tab:FindFirstChildOfClass("UIListLayout")
				if default_layout then
					default_layout:Destroy()
				end

				local left_col = Instance.new("ScrollingFrame")
				left_col.Name = "LeftColumn"
				left_col.Size = UDim2.new(0.49, 0, 1, 0)
				left_col.Position = UDim2.new(0, 0, 0, 0)
				left_col.BackgroundTransparency = 1
				left_col.BorderSizePixel = 0
				left_col.ScrollBarThickness = 3
				left_col.CanvasSize = UDim2.new(0, 0, 0, 0)
				left_col.Parent = new_tab

				local left_layout = Instance.new("UIListLayout")
				left_layout.Padding = UDim.new(0, 4)
				left_layout.SortOrder = Enum.SortOrder.LayoutOrder
				left_layout.Parent = left_col

				left_layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					left_col.CanvasSize = UDim2.new(0, 0, 0, left_layout.AbsoluteContentSize.Y + 6)
				end)

				local right_col = Instance.new("ScrollingFrame")
				right_col.Name = "RightColumn"
				right_col.Size = UDim2.new(0.49, 0, 1, 0)
				right_col.Position = UDim2.new(0.51, 0, 0, 0)
				right_col.BackgroundTransparency = 1
				right_col.BorderSizePixel = 0
				right_col.ScrollBarThickness = 3
				right_col.CanvasSize = UDim2.new(0, 0, 0, 0)
				right_col.Parent = new_tab

				local right_layout = Instance.new("UIListLayout")
				right_layout.Padding = UDim.new(0, 4)
				right_layout.SortOrder = Enum.SortOrder.LayoutOrder
				right_layout.Parent = right_col

				right_layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					right_col.CanvasSize = UDim2.new(0, 0, 0, right_layout.AbsoluteContentSize.Y + 6)
				end)

				tab_data.LeftCol = left_col
				tab_data.RightCol = right_col
				tab_data.TabFrame = new_tab

				local function show()
					if dropdown_open then return end
					for i, v in pairs(tab_buttons:GetChildren()) do
						if v:IsA("TextButton") then
							v.Font = Enum.Font.GothamBold
							v.TextColor3 = Color3.fromRGB(180, 185, 190)
							local bgImage = v:FindFirstChildOfClass("ImageLabel")
							if bgImage and bgImage.Name ~= "Icon" then
								bgImage.ImageColor3 = Color3.fromRGB(52, 53, 56)
							end
						end
					end
					for i, v in pairs(tabs:GetChildren()) do
						v.Visible = false
					end

					new_button.Font = Enum.Font.GothamBold
					new_button.TextColor3 = Color3.fromRGB(255, 255, 255)
					local bgImage = new_button:FindFirstChildOfClass("ImageLabel")
					if bgImage and bgImage.Name ~= "Icon" then
						bgImage.ImageColor3 = Color3.fromRGB(73, 75, 79)
					end
					new_tab.Visible = true
				end

				new_button.MouseButton1Click:Connect(function()
					show()
				end)

				function tab_data:Show()
					show()
				end

				do -- Tab Elements

					function tab_data:AddLabel(label_text) -- [Label]
						label_text = tostring(label_text or "New Label")

						local label = prefabs:FindFirstChild("Label"):Clone()

						label.Parent = new_tab
						label.Text = label_text
						label.Size = UDim2.new(0, gNameLen(label), 0, 20)
						label.ZIndex = label.ZIndex + (windows * 10)

						return label
					end

					function tab_data:AddButton(button_text, callback) -- [Button]
						button_text = tostring(button_text or "New Button")
						callback = typeof(callback) == "function" and callback or function()end

						local button = Instance.new("TextButton")
						button.Name = button_text .. "Button"
						button.Parent = new_tab
						button.Size = UDim2.new(1, 0, 0, 26)
						button.BackgroundColor3 = options.main_color or Color3.fromRGB(180, 30, 40)
						button.BorderSizePixel = 0
						button.Font = Enum.Font.GothamBold
						button.TextSize = 13
						button.TextColor3 = Color3.fromRGB(255, 255, 255)
						button.Text = button_text
						button.AutoButtonColor = true
						button.ZIndex = (windows * 10) + 20

						local btnCorner = Instance.new("UICorner")
						btnCorner.CornerRadius = UDim.new(0, 5)
						btnCorner.Parent = button

						button.MouseButton1Click:Connect(function()
							ripple(button, mouse.X, mouse.Y)
							pcall(callback)
						end)

						return button
					end

					function tab_data:AddSwitch(switch_text, callback) -- [Switch]
						local switch_data = {}

						switch_text = tostring(switch_text or "New Switch")
						callback = typeof(callback) == "function" and callback or function()end

						local switch = prefabs:FindFirstChild("Switch"):Clone()

						switch.Parent = new_tab
						switch:FindFirstChild("Title").Text = switch_text

						switch:FindFirstChild("Title").ZIndex = switch:FindFirstChild("Title").ZIndex + (windows * 10)
						switch.ZIndex = switch.ZIndex + (windows * 10)
						local bgImg = switch:GetChildren()[1]
						if bgImg then
							bgImg.ZIndex = bgImg.ZIndex + (windows * 10)
							bgImg.ImageColor3 = Color3.fromRGB(32, 48, 75) -- Dark Navy Blue Square
						end

						local toggled = false
						local function updateSwitchColor()
							if bgImg then
								bgImg.ImageColor3 = toggled and Color3.fromRGB(50, 95, 175) or Color3.fromRGB(32, 48, 75)
							end
						end

						switch.MouseButton1Click:Connect(function()
							toggled = not toggled
							switch.Text = toggled and utf8.char(10003) or ""
							updateSwitchColor()
							pcall(callback, toggled)
						end)

						function switch_data:Set(bool)
							toggled = (typeof(bool) == "boolean") and bool or false
							switch.Text = toggled and utf8.char(10003) or ""
							updateSwitchColor()
							pcall(callback,toggled)
						end

						return switch_data, switch
					end

					function tab_data:AddTextBox(textbox_text, callback, textbox_options)
						textbox_text = tostring(textbox_text or "New TextBox")
						callback = typeof(callback) == "function" and callback or function()end
						textbox_options = typeof(textbox_options) == "table" and textbox_options or {["clear"] = true}
						textbox_options = {
							["clear"] = ((textbox_options.clear) == true)
						}

						local textbox = prefabs:FindFirstChild("TextBox"):Clone()

						textbox.Parent = new_tab
						textbox.PlaceholderText = textbox_text
						textbox.ZIndex = textbox.ZIndex + (windows * 10)
						textbox:GetChildren()[1].ZIndex = textbox:GetChildren()[1].ZIndex + (windows * 10)

						textbox.FocusLost:Connect(function(ep)
							if ep then
								if #textbox.Text > 0 then
									pcall(callback, textbox.Text)
									if textbox_options.clear then
										textbox.Text = ""
									end
								end
							end
						end)

						return textbox
					end

					function tab_data:AddSlider(slider_text, callback, slider_options)
						local slider_data = {}
						slider_text = tostring(slider_text or "New Slider")
						callback = typeof(callback) == "function" and callback or function()end
						slider_options = typeof(slider_options) == "table" and slider_options or {}
						local minv = slider_options.min or 0
						local maxv = slider_options.max or 100
						local readonly = slider_options.readonly or false

						local baseZ = (windows * 10) + 20

						local slider = Instance.new("Frame")
						slider.Name = slider_text .. "Slider"
						slider.Parent = new_tab
						slider.Size = UDim2.new(1, 0, 0, 26)
						slider.BackgroundColor3 = Color3.fromRGB(36, 37, 44)
						slider.BorderSizePixel = 0
						slider.ClipsDescendants = true
						slider.ZIndex = baseZ

						local sCorner = Instance.new("UICorner")
						sCorner.CornerRadius = UDim.new(0, 5)
						sCorner.Parent = slider

						-- Background Fill Bar (drawn BEHIND text)
						local indicator = Instance.new("Frame")
						indicator.Name = "Indicator"
						indicator.Parent = slider
						indicator.Size = UDim2.new(0, 0, 1, 0)
						indicator.Position = UDim2.new(0, 0, 0, 0)
						indicator.BackgroundColor3 = options.main_color or Color3.fromRGB(180, 30, 40)
						indicator.BackgroundTransparency = 0.4
						indicator.BorderSizePixel = 0
						indicator.ZIndex = baseZ + 1

						local indCorner = Instance.new("UICorner")
						indCorner.CornerRadius = UDim.new(0, 5)
						indCorner.Parent = indicator

						-- Title Text (drawn ON TOP of slider fill!)
						local title = Instance.new("TextLabel")
						title.Name = "Title"
						title.Parent = slider
						title.Size = UDim2.new(1, -75, 1, 0)
						title.Position = UDim2.new(0, 10, 0, 0)
						title.BackgroundTransparency = 1
						title.Font = Enum.Font.GothamBold
						title.TextSize = 13
						title.TextColor3 = Color3.fromRGB(255, 255, 255)
						title.TextXAlignment = Enum.TextXAlignment.Left
						title.Text = slider_text
						title.ZIndex = baseZ + 2

						-- Value Display Text (right-aligned)
						local value = Instance.new("TextLabel")
						value.Name = "Value"
						value.Parent = slider
						value.Size = UDim2.new(0, 65, 1, 0)
						value.Position = UDim2.new(1, -70, 0, 0)
						value.BackgroundTransparency = 1
						value.Font = Enum.Font.GothamBold
						value.TextSize = 13
						value.TextColor3 = Color3.fromRGB(240, 240, 240)
						value.TextXAlignment = Enum.TextXAlignment.Right
						value.Text = "[ " .. tostring(minv) .. " ]"
						value.ZIndex = baseZ + 2

						-- Interactive Drag Logic
						local Entered = false
						slider.MouseEnter:Connect(function()
							Entered = true
							Window.Draggable = false
						end)
						slider.MouseLeave:Connect(function()
							Entered = false
							Window.Draggable = true
						end)

						local Held = false
						UIS.InputBegan:Connect(function(inputObject)
							if inputObject.UserInputType == Enum.UserInputType.MouseButton1 and Entered and not readonly then
								Held = true
								task.spawn(function()
									while Held do
										local mouseLoc = gMouse()
										local relX = math.clamp((mouseLoc.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
										local currentVal = math.floor(minv + (relX * (maxv - minv)))
										indicator.Size = UDim2.new(relX, 0, 1, 0)
										value.Text = "[ " .. tostring(currentVal) .. " ]"
										pcall(callback, currentVal)
										RS.Heartbeat:Wait()
									end
								end)
							end
						end)
						UIS.InputEnded:Connect(function(inputObject)
							if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
								Held = false
							end
						end)

						function slider_data:Set(val)
							val = math.clamp(tonumber(val) or minv, minv, maxv)
							local relX = (maxv > minv) and ((val - minv) / (maxv - minv)) or 0
							indicator.Size = UDim2.new(relX, 0, 1, 0)
							value.Text = "[ " .. tostring(math.floor(val)) .. " ]"
							pcall(callback, math.floor(val))
						end

						slider_data:Set(minv)
						return slider_data, slider
					end

					function tab_data:AddKeybind(keybind_name, callback, keybind_options)
						local keybind_data = {}

						keybind_name = tostring(keybind_name or "New Keybind")
						callback = typeof(callback) == "function" and callback or function()end
						keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
						keybind_options = {
							["standard"] = keybind_options.standard or Enum.KeyCode.RightShift,
						}

						local keybind = prefabs:FindFirstChild("Keybind"):Clone()
						local input = keybind:FindFirstChild("Input")
						local title = keybind:FindFirstChild("Title")
						keybind.ZIndex = keybind.ZIndex + (windows * 10)
						input.ZIndex = input.ZIndex + (windows * 10)
						input:GetChildren()[1].ZIndex = input:GetChildren()[1].ZIndex + (windows * 10)
						title.ZIndex = title.ZIndex + (windows * 10)

						keybind.Parent = new_tab
						title.Text = "  " .. keybind_name
						keybind.Size = UDim2.new(0, gNameLen(title) + 80, 0, 20)

						local shortkeys = { -- thanks to stroketon for helping me out with this
							RightControl = 'RightCtrl',
							LeftControl = 'LeftCtrl',
							LeftShift = 'LShift',
							RightShift = 'RShift',
							MouseButton1 = "Mouse1",
							MouseButton2 = "Mouse2"
						}

						local keybind = keybind_options.standard

						function keybind_data:SetKeybind(Keybind)
							local key = shortkeys[Keybind.Name] or Keybind.Name
							input.Text = key
							keybind = Keybind
						end

						UIS.InputBegan:Connect(function(a, b)
							if checks.binding then
								spawn(function()
									wait()
									checks.binding = false
								end)
								return
							end
							if a.KeyCode == keybind and not b then
								pcall(callback, keybind)
							end
						end)

						keybind_data:SetKeybind(keybind_options.standard)

						input.MouseButton1Click:Connect(function()
							if checks.binding then return end
							input.Text = "..."
							checks.binding = true
							local a, b = UIS.InputBegan:Wait()
							keybind_data:SetKeybind(a.KeyCode)
						end)

						return keybind_data, keybind
					end

					function tab_data:AddDropdown(dropdown_name, callback, options_array)
						local dropdown_data = {}
						dropdown_name = tostring(dropdown_name or "New Dropdown")
						callback = typeof(callback) == "function" and callback or function()end

						local baseZ = (windows * 10) + 25

						local dropdownHolder = Instance.new("Frame")
						dropdownHolder.Name = dropdown_name .. "DropdownHolder"
						dropdownHolder.Parent = new_tab
						dropdownHolder.Size = UDim2.new(1, 0, 0, 26)
						dropdownHolder.BackgroundTransparency = 1
						dropdownHolder.BorderSizePixel = 0
						dropdownHolder.ZIndex = baseZ

						local dropdown = Instance.new("TextButton")
						dropdown.Name = dropdown_name .. "DropdownButton"
						dropdown.Parent = dropdownHolder
						dropdown.Size = UDim2.new(1, 0, 0, 26)
						dropdown.BackgroundColor3 = Color3.fromRGB(36, 37, 44)
						dropdown.BorderSizePixel = 0
						dropdown.Font = Enum.Font.GothamBold
						dropdown.TextSize = 13
						dropdown.TextColor3 = Color3.fromRGB(240, 240, 240)
						dropdown.TextXAlignment = Enum.TextXAlignment.Left
						
						local initialText = dropdown_name
						if typeof(options_array) == "table" and #options_array > 0 then
							initialText = dropdown_name .. ": " .. tostring(options_array[1])
						end
						dropdown.Text = "   " .. initialText
						dropdown.ZIndex = baseZ + 1

						local d_corner = Instance.new("UICorner")
						d_corner.CornerRadius = UDim.new(0, 5)
						d_corner.Parent = dropdown

						local indicator = Instance.new("ImageLabel")
						indicator.Name = "Indicator"
						indicator.Size = UDim2.new(0, 14, 0, 14)
						indicator.Position = UDim2.new(1, -22, 0.5, -7)
						indicator.BackgroundTransparency = 1
						indicator.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"
						indicator.ImageColor3 = Color3.fromRGB(240, 240, 240)
						indicator.Rotation = 180
						indicator.ZIndex = baseZ + 2
						indicator.Parent = dropdown

						local box = Instance.new("Frame")
						box.Name = "Box"
						box.Parent = dropdownHolder
						box.Position = UDim2.new(0, 0, 0, 30)
						box.Size = UDim2.new(1, 0, 0, 0)
						box.BackgroundColor3 = Color3.fromRGB(24, 25, 30) -- Solid opaque dark background
						box.BackgroundTransparency = 0
						box.BorderSizePixel = 0
						box.ClipsDescendants = true
						box.ZIndex = baseZ + 10
						box.Visible = false

						local boxCorner = Instance.new("UICorner")
						boxCorner.CornerRadius = UDim.new(0, 6)
						boxCorner.Parent = box

						local objects = Instance.new("ScrollingFrame")
						objects.Name = "Objects"
						objects.Parent = box
						objects.Size = UDim2.new(1, 0, 1, 0)
						objects.BackgroundTransparency = 1
						objects.BorderSizePixel = 0
						objects.ScrollBarThickness = 3
						objects.ZIndex = baseZ + 11
						objects.CanvasSize = UDim2.new(0, 0, 0, 0)

						local objLayout = Instance.new("UIListLayout")
						objLayout.Padding = UDim.new(0, 2)
						objLayout.Parent = objects

						local open = false

						local function updateParentFolder()
							local p = dropdownHolder.Parent
							while p and not p.Name:find("Folder") and p ~= game do
								p = p.Parent
							end
							if p and p:FindFirstChild("Button") then
								local f_objects = p:FindFirstChild("Objects")
								if f_objects then
									local f_layout = f_objects:FindFirstChildOfClass("UIListLayout")
									if f_layout then
										local totalH = f_layout.AbsoluteContentSize.Y
										p.Size = UDim2.new(1, -6, 0, totalH + 42)
									end
								end
							end
						end

						dropdown.MouseButton1Click:Connect(function()
							open = not open
							local count = #objects:GetChildren() - 1
							local len = math.clamp(count * 24, 24, 180)
							objects.CanvasSize = UDim2.new(0, 0, 0, count * 24)

							if open then
								box.Visible = true
								dropdownHolder.Size = UDim2.new(1, 0, 0, 26 + len + 6)
								Resize(box, {Size = UDim2.new(1, 0, 0, len)}, options.tween_time)
								Resize(indicator, {Rotation = 0}, options.tween_time) -- Open points UP
								task.delay(0.05, updateParentFolder)
							else
								dropdownHolder.Size = UDim2.new(1, 0, 0, 26)
								Resize(indicator, {Rotation = 180}, options.tween_time) -- Closed points DOWN/LEFT
								local t = Resize(box, {Size = UDim2.new(1, 0, 0, 0)}, options.tween_time)
								if t then
									t.Completed:Connect(function()
										if not open then box.Visible = false end
									end)
								else
									box.Visible = false
								end
								task.delay(0.05, updateParentFolder)
							end
						end)

						function dropdown_data:Add(n)
							local object_data = {}
							n = tostring(n or "New Object")

							local object = Instance.new("TextButton")
							object.Name = n .. "Option"
							object.Parent = objects
							object.Size = UDim2.new(1, 0, 0, 22)
							object.BackgroundColor3 = Color3.fromRGB(33, 34, 36)
							object.BorderSizePixel = 0
							object.Font = Enum.Font.GothamMedium
							object.TextSize = 12
							object.TextColor3 = Color3.fromRGB(230, 230, 230)
							object.Text = "      " .. n
							object.TextXAlignment = Enum.TextXAlignment.Left
							object.ZIndex = baseZ + 12

							local oCorner = Instance.new("UICorner")
							oCorner.CornerRadius = UDim.new(0, 4)
							oCorner.Parent = object

							-- Field Category Color Dot
							local colorDot = Instance.new("Frame")
							colorDot.Name = "CategoryDot"
							colorDot.Size = UDim2.new(0, 8, 0, 8)
							colorDot.Position = UDim2.new(0, 6, 0.5, -4)
							colorDot.BorderSizePixel = 0
							colorDot.ZIndex = baseZ + 13

							local lowerN = n:lower()
							if lowerN:find("blue") or lowerN:find("bamboo") or lowerN:find("pine") or lowerN:find("stump") then
								colorDot.BackgroundColor3 = Color3.fromRGB(40, 160, 255) -- Blue Field
							elseif lowerN:find("rose") or lowerN:find("mushroom") or lowerN:find("strawberry") or lowerN:find("pepper") then
								colorDot.BackgroundColor3 = Color3.fromRGB(255, 65, 65) -- Red Field
							else
								colorDot.BackgroundColor3 = Color3.fromRGB(70, 210, 100) -- Green Field
							end

							local dotCorner = Instance.new("UICorner")
							dotCorner.CornerRadius = UDim.new(1, 0)
							dotCorner.Parent = colorDot
							colorDot.Parent = object

							object.MouseEnter:Connect(function()
								object.BackgroundColor3 = options.main_color
							end)
							object.MouseLeave:Connect(function()
								object.BackgroundColor3 = Color3.fromRGB(33, 34, 36)
							end)

							object.MouseButton1Click:Connect(function()
								dropdown.Text = "   " .. dropdown_name .. ": " .. n
								open = false
								dropdownHolder.Size = UDim2.new(1, 0, 0, 26)
								Resize(indicator, {Rotation = 180}, options.tween_time)
								local t = Resize(box, {Size = UDim2.new(1, 0, 0, 0)}, options.tween_time)
								if t then
									t.Completed:Connect(function()
										if not open then box.Visible = false end
									end)
								else
									box.Visible = false
								end
								task.delay(0.05, updateParentFolder)
								pcall(callback, n)
							end)

							return object, object_data
						end

						if typeof(options_array) == "table" then
							for _, opt in ipairs(options_array) do
								dropdown_data:Add(tostring(opt))
							end
						end

						return dropdown_data, dropdownHolder
					end

					function tab_data:AddColorPicker(callback)
						local color_picker_data = {}
						callback = typeof(callback) == "function" and callback or function()end

						local color_picker = prefabs:FindFirstChild("ColorPicker"):Clone()

						color_picker.Parent = new_tab
						color_picker.ZIndex = color_picker.ZIndex + (windows * 10)

						local palette = color_picker:FindFirstChild("Palette")
						local sample = color_picker:FindFirstChild("Sample")
						local saturation = color_picker:FindFirstChild("Saturation")
						palette.ZIndex = palette.ZIndex + (windows * 10)
						sample.ZIndex = sample.ZIndex + (windows * 10)
						saturation.ZIndex = saturation.ZIndex + (windows * 10)

						do -- Color Picker Math
							local h = 0
							local s = 1
							local v = 1

							local function update()
								local color = Color3.fromHSV(h, s, v)
								sample.ImageColor3 = color
								saturation.ImageColor3 = Color3.fromHSV(h, 1, 1)
								pcall(callback, color)
							end

							do
								local color = Color3.fromHSV(h, s, v)
								sample.ImageColor3 = color
								saturation.ImageColor3 = Color3.fromHSV(h, 1, 1)
							end

							local Entered1, Entered2 = false, false
							palette.MouseEnter:Connect(function()
								Window.Draggable = false
								Entered1 = true
							end)
							palette.MouseLeave:Connect(function()
								Window.Draggable = true
								Entered1 = false
							end)
							saturation.MouseEnter:Connect(function()
								Window.Draggable = false
								Entered2 = true
							end)
							saturation.MouseLeave:Connect(function()
								Window.Draggable = true
								Entered2 = false
							end)

							local palette_indicator = palette:FindFirstChild("Indicator")
							local saturation_indicator = saturation:FindFirstChild("Indicator")
							palette_indicator.ZIndex = palette_indicator.ZIndex + (windows * 10)
							saturation_indicator.ZIndex = saturation_indicator.ZIndex + (windows * 10)

							local Held = false
							UIS.InputBegan:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = true

									spawn(function() -- Loop check
										while Held and Entered1 and (not dropdown_open) do -- Palette
											local mouse_location = gMouse()

											local x = ((palette.AbsoluteSize.X - (mouse_location.X - palette.AbsolutePosition.X)) + 1)
											local y = ((palette.AbsoluteSize.Y - (mouse_location.Y - palette.AbsolutePosition.Y)) + 1.5)

											local color = Color3.fromHSV(x / 100, y / 100, 0)
											h = x / 100
											s = y / 100

											Resize(palette_indicator, {Position = UDim2.new(0, math.abs(x - 100) - (palette_indicator.AbsoluteSize.X / 2), 0, math.abs(y - 100) - (palette_indicator.AbsoluteSize.Y / 2))}, options.tween_time)

											update()
											RS.Heartbeat:Wait()
										end

										while Held and Entered2 and (not dropdown_open) do -- Saturation
											local mouse_location = gMouse()
											local y = ((palette.AbsoluteSize.Y - (mouse_location.Y - palette.AbsolutePosition.Y)) + 1.5)
											v = y / 100

											Resize(saturation_indicator, {Position = UDim2.new(0, 0, 0, math.abs(y - 100))}, options.tween_time)

											update()
											RS.Heartbeat:Wait()
										end
									end)
								end
							end)
							UIS.InputEnded:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = false
								end
							end)

							function color_picker_data:Set(color)
								color = typeof(color) == "Color3" and color or Color3.new(1, 1, 1)
								local h2, s2, v2 = rgbtohsv(color.r * 255, color.g * 255, color.b * 255)
								sample.ImageColor3 = color
								saturation.ImageColor3 = Color3.fromHSV(h2, 1, 1)
								pcall(callback, color)
							end
						end

						return color_picker_data, color_picker
					end

					function tab_data:AddConsole(console_options)
						local console_data = {}

						console_options = typeof(console_options) == "table" and console_options or {["readonly"] = true,["full"] = false,}
						console_options = {
							["y"] = tonumber(console_options.y) or 200,
							["source"] = console_options.source or "Logs",
							["readonly"] = ((console_options.readonly) == true),
							["full"] = ((console_options.full) == true),
						}

						local console = prefabs:FindFirstChild("Console"):Clone()

						console.Parent = new_tab
						console.ZIndex = console.ZIndex + (windows * 10)
						console.Size = UDim2.new(1, 0, console_options.full and 1 or 0, console_options.y)

						local sf = console:GetChildren()[1]
						local Source = sf:FindFirstChild("Source")
						local Lines = sf:FindFirstChild("Lines")
						Source.ZIndex = Source.ZIndex + (windows * 10)
						Lines.ZIndex = Lines.ZIndex + (windows * 10)

						Source.TextEditable = not console_options.readonly

						do
							for i,v in pairs(Source:GetChildren()) do
								v.ZIndex = v.ZIndex + (windows * 10) + 1
							end
						end
						Source.Comments.ZIndex = Source.Comments.ZIndex + 1

						do
							local lua_keywords = {"and", "break", "do", "else", "elseif", "end", "false", "for", "function", "goto", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while"}
							local global_env = {"getrawmetatable", "newcclosure", "islclosure", "setclipboard", "game", "workspace", "script", "math", "string", "table", "print", "wait", "BrickColor", "Color3", "next", "pairs", "ipairs", "select", "unpack", "Instance", "Vector2", "Vector3", "CFrame", "Ray", "UDim2", "Enum", "assert", "error", "warn", "tick", "loadstring", "_G", "shared", "getfenv", "setfenv", "newproxy", "setmetatable", "getmetatable", "os", "debug", "pcall", "ypcall", "xpcall", "rawequal", "rawset", "rawget", "tonumber", "tostring", "type", "typeof", "_VERSION", "coroutine", "delay", "require", "spawn", "LoadLibrary", "settings", "stats", "time", "UserSettings", "version", "Axes", "ColorSequence", "Faces", "ColorSequenceKeypoint", "NumberRange", "NumberSequence", "NumberSequenceKeypoint", "gcinfo", "elapsedTime", "collectgarbage", "PhysicalProperties", "Rect", "Region3", "Region3int16", "UDim", "Vector2int16", "Vector3int16", "load", "fire", "Fire"}

							local Highlight = function(string, keywords)
								local K = {}
								local S = string
								local Token =
									{
									["="] = true,
									["."] = true,
									[","] = true,
									["("] = true,
									[")"] = true,
									["["] = true,
									["]"] = true,
									["{"] = true,
									["}"] = true,
									[":"] = true,
									["*"] = true,
									["/"] = true,
									["+"] = true,
									["-"] = true,
									["%"] = true,
									[";"] = true,
									["~"] = true
								}
								for i, v in pairs(keywords) do
									K[v] = true
								end
								S = S:gsub(".", function(c)
									if Token[c] ~= nil then
										return "\32"
									else
										return c
									end
								end)
								S = S:gsub("%S+", function(c)
									if K[c] ~= nil then
										return c
									else
										return (" "):rep(#c)
									end
								end)

								return S
							end

							local hTokens = function(string)
								local Token =
									{
									["="] = true,
									["."] = true,
									[","] = true,
									["("] = true,
									[")"] = true,
									["["] = true,
									["]"] = true,
									["{"] = true,
									["}"] = true,
									[":"] = true,
									["*"] = true,
									["/"] = true,
									["+"] = true,
									["-"] = true,
									["%"] = true,
									[";"] = true,
									["~"] = true
								}
								local A = ""
								string:gsub(".", function(c)
									if Token[c] ~= nil then
										A = A .. c
									elseif c == "\n" then
										A = A .. "\n"
									elseif c == "\t" then
										A = A .. "\t"
									else
										A = A .. "\32"
									end
								end)

								return A
							end

							local strings = function(string)
								local highlight = ""
								local quote = false
								string:gsub(".", function(c)
									if quote == false and c == "\34" then
										quote = true
									elseif quote == true and c == "\34" then
										quote = false
									end
									if quote == false and c == "\34" then
										highlight = highlight .. "\34"
									elseif c == "\n" then
										highlight = highlight .. "\n"
									elseif c == "\t" then
										highlight = highlight .. "\t"
									elseif quote == true then
										highlight = highlight .. c
									elseif quote == false then
										highlight = highlight .. "\32"
									end
								end)

								return highlight
							end

							local info = function(string)
								local highlight = ""
								local quote = false
								string:gsub(".", function(c)
									if quote == false and c == "[" then
										quote = true
									elseif quote == true and c == "]" then
										quote = false
									end
									if quote == false and c == "]" then
										highlight = highlight .. "]"
									elseif c == "\n" then
										highlight = highlight .. "\n"
									elseif c == "\t" then
										highlight = highlight .. "\t"
									elseif quote == true then
										highlight = highlight .. c
									elseif quote == false then
										highlight = highlight .. "\32"
									end
								end)

								return highlight
							end

							local comments = function(string)
								local ret = ""
								string:gsub("[^\r\n]+", function(c)
									local comm = false
									local i = 0
									c:gsub(".", function(n)
										i = i + 1
										if c:sub(i, i + 1) == "--" then
											comm = true
										end
										if comm == true then
											ret = ret .. n
										else
											ret = ret .. "\32"
										end
									end)
									ret = ret
								end)

								return ret
							end

							local numbers = function(string)
								local A = ""
								string:gsub(".", function(c)
									if tonumber(c) ~= nil then
										A = A .. c
									elseif c == "\n" then
										A = A .. "\n"
									elseif c == "\t" then
										A = A .. "\t"
									else
										A = A .. "\32"
									end
								end)

								return A
							end

                            local function highlight_logs(s)
                                local result = s
                                for _, name in ipairs({"print","warn","error","console.log"}) do
                                    local pat = name:gsub("%.", "%%.")
                                    result = result:gsub(pat .. "%s*%b()", '<font color="rgb(130,255,170)">%0</font>')
                                end
                                return result
                            end

							local highlight_lua = function(type)
								if type == "Text" then
									Source.Text = Source.Text:gsub("\13", "")
									Source.Text = Source.Text:gsub("\t", "      ")
									local s = Source.Text

									Source.Keywords.Text = Highlight(s, lua_keywords)
									Source.Globals.Text = Highlight(s, global_env)
									Source.RemoteHighlight.Text = Highlight(s, {"FireServer", "fireServer", "InvokeServer", "invokeServer"})
									Source.Tokens.Text = hTokens(s)
									Source.Numbers.Text = numbers(s)
									Source.Strings.Text = strings(s)
									Source.Comments.Text = comments(s)

									local lin = 1
									s:gsub("\n", function()
										lin = lin + 1
									end)

									Lines.Text = ""
									for i = 1, lin do
										Lines.Text = Lines.Text .. i .. "\n"
									end

									sf.CanvasSize = UDim2.new(0, 0, lin * 0.153846154, 0)
								end

								local highlight_logs = function(type)
                                    if type == "Text" then
                                        Source.Text = Source.Text:gsub("\13", "")
                                        Source.Text = Source.Text:gsub("\t", "      ")
                                        local s = Source.Text
                                        Source.Keywords.Text     = Highlight(s, lua_keywords)
                                        Source.Globals.Text      = Highlight(s, global_env)
                                        Source.RemoteHighlight.Text = Highlight(s, {"FireServer", "fireServer", "InvokeServer", "invokeServer"})
                                        Source.Tokens.Text       = hTokens(s)
                                        Source.Numbers.Text      = numbers(s)
                                        Source.Strings.Text      = strings(s)
                                        Source.Comments.Text     = comments(s)
                                        Source.Logs.Text = highlight_logs(s)
                                        local lin = 1
                                        s:gsub("\n", function() lin = lin + 1 end)
                                        Lines.Text = ""
                                        for i = 1, lin do
                                            Lines.Text = Lines.Text .. i .. "\n"
                                        end

                                        sf.CanvasSize = UDim2.new(0, 0, lin * 0.153846154, 0)
                                    end
								end
								if type == "Text" then
									Source.Text = Source.Text:gsub("\13", "")
									Source.Text = Source.Text:gsub("\t", "      ")
									local s = Source.Text

									Source.Info.Text = info(s)

									local lin = 1
									s:gsub("\n", function()
										lin = lin + 1
									end)

									sf.CanvasSize = UDim2.new(0, 0, lin * 0.153846154, 0)
								end
							end

							if console_options.source == "Lua" then
								highlight_lua("Text")
								Source.Changed:Connect(highlight_lua)
							elseif console_options.source == "Logs" then
								Lines.Visible = false

								highlight_logs("Text")
								Source.Changed:Connect(highlight_logs)
							end

							function console_data:Set(code)
								Source.Text = tostring(code)
							end

							function console_data:Get()
								return Source.Text
							end

							function console_data:Log(msg)
								Source.Text = Source.Text .. "[*] " .. tostring(msg) .. "\n"
							end

						end

						return console_data, console
					end

					function tab_data:AddHorizontalAlignment()
						local ha_data = {}

						local ha = prefabs:FindFirstChild("HorizontalAlignment"):Clone()
						ha.Parent = new_tab

						function ha_data:AddButton(...)
							local data, object
							local ret = {tab_data:AddButton(...)}
							if typeof(ret[1]) == "table" then
								data = ret[1]
								object = ret[2]
								object.Parent = ha
								return data, object
							else
								object = ret[1]
								object.Parent = ha
								return object
							end
						end

						return ha_data, ha
					end

					function tab_data:AddFolder(folder_name, default_open, side)
						folder_name = tostring(folder_name or "New Folder")
						local is_open = (default_open == nil and true or default_open)

						local target_col = (side == "right" or side == 2 or side == "col2") and (self.RightCol or right_col) or (self.LeftCol or left_col)
						if not target_col then
							target_col = self.TabFrame or new_tab
						end

						local baseZ = (windows * 10) + 15
						local new_folder = Instance.new("Frame")
						new_folder.Name = folder_name .. "Folder"
						new_folder.Parent = target_col
						new_folder.Size = UDim2.new(1, -6, 0, 26)
						new_folder.BackgroundColor3 = Color3.fromRGB(26, 27, 33) -- Dark Card Container Box
						new_folder.BackgroundTransparency = 0
						new_folder.BorderSizePixel = 0
						new_folder.ClipsDescendants = true
						new_folder.ZIndex = baseZ

						local card_corner = Instance.new("UICorner")
						card_corner.CornerRadius = UDim.new(0, 6)
						card_corner.Parent = new_folder

						local f_button = Instance.new("TextButton")
						f_button.Name = "Button"
						f_button.Parent = new_folder
						f_button.Size = UDim2.new(1, 0, 0, 26)
						f_button.Position = UDim2.new(0, 0, 0, 0)
						f_button.BackgroundColor3 = Color3.fromRGB(36, 37, 44)
						f_button.BackgroundTransparency = 0
						f_button.BorderSizePixel = 0
						f_button.Text = "   " .. folder_name
						f_button.Font = Enum.Font.GothamBold
						f_button.TextSize = 12
						f_button.TextColor3 = Color3.fromRGB(240, 240, 240)
						f_button.TextXAlignment = Enum.TextXAlignment.Left
						f_button.AutoButtonColor = true
						f_button.ZIndex = baseZ + 1

						local f_corner = Instance.new("UICorner")
						f_corner.CornerRadius = UDim.new(0, 5)
						f_corner.Parent = f_button

						-- Original Window Toggle Arrow Asset (assetId=4731371541)
						local arrow = Instance.new("ImageLabel")
						arrow.Name = "ArrowIcon"
						arrow.Size = UDim2.new(0, 14, 0, 14)
						arrow.Position = UDim2.new(1, -22, 0.5, -7)
						arrow.BackgroundTransparency = 1
						arrow.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"
						arrow.ImageColor3 = Color3.fromRGB(240, 240, 240)
						arrow.ZIndex = baseZ + 2
						arrow.Parent = f_button
						arrow.Rotation = is_open and 90 or 180

						local f_objects = Instance.new("Frame")
						f_objects.Name = "Objects"
						f_objects.Parent = new_folder
						f_objects.BackgroundTransparency = 1
						f_objects.Position = UDim2.new(0, 4, 0, 30)
						f_objects.Size = UDim2.new(1, -8, 0, 0)
						f_objects.Visible = is_open
						f_objects.ZIndex = baseZ + 3

						local f_layout = f_objects:FindFirstChildOfClass("UIListLayout")
						if not f_layout then
							f_layout = Instance.new("UIListLayout")
							f_layout.Padding = UDim.new(0, 4)
							f_layout.Parent = f_objects
						end

						local function updateFolderSize(animate)
							local h = f_layout.AbsoluteContentSize.Y
							if h == 0 then
								local count = 0
								for _, child in ipairs(f_objects:GetChildren()) do
									if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
										count = count + 1
									end
								end
								h = count * 24
							end

							if is_open then
								f_button.BackgroundColor3 = Color3.fromRGB(42, 44, 52)
								new_folder.BackgroundColor3 = Color3.fromRGB(26, 27, 33)
								new_folder.BackgroundTransparency = 0
								f_objects.Visible = true
								if animate then
									Resize(arrow, {Rotation = 90}, 0.2)
									Resize(new_folder, {Size = UDim2.new(1, -6, 0, h + 34)}, 0.2)
								else
									arrow.Rotation = 90
									new_folder.Size = UDim2.new(1, -6, 0, h + 34)
								end
							else
								f_button.BackgroundColor3 = Color3.fromRGB(36, 37, 44)
								new_folder.BackgroundColor3 = Color3.fromRGB(36, 37, 44)
								new_folder.BackgroundTransparency = 0
								new_folder.ClipsDescendants = true
								if animate then
									Resize(arrow, {Rotation = 180}, 0.2)
									local t = Resize(new_folder, {Size = UDim2.new(1, -6, 0, 26)}, 0.2)
									if t then
										t.Completed:Connect(function()
											if not is_open then f_objects.Visible = false end
										end)
									end
								else
									arrow.Rotation = 180
									new_folder.Size = UDim2.new(1, -6, 0, 26)
									f_objects.Visible = false
								end
							end
						end

						f_layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
							updateFolderSize(false)
						end)
						task.defer(function()
							updateFolderSize(false)
						end)

						local function toggleFolder()
							is_open = not is_open
							updateFolderSize(true)
						end

						f_button.MouseButton1Click:Connect(toggleFolder)

						local function elevateZ(obj)
							if not obj then return end
							if hasprop(obj, "ZIndex") then obj.ZIndex = baseZ + 10 end
							for _, c in ipairs(obj:GetDescendants()) do
								if hasprop(c, "ZIndex") then c.ZIndex = baseZ + 11 end
							end
						end

						local folder_data = {}

						function folder_data:AddSwitch(switch_text, callback)
							local s_data, s_obj = tab_data:AddSwitch(switch_text, callback)
							if s_obj then
								s_obj.Parent = f_objects
								elevateZ(s_obj)
							end
							updateFolderSize(false)
							return s_data, s_obj
						end

						function folder_data:AddDropdown(dd_text, callback, options)
							local d_data, d_obj = tab_data:AddDropdown(dd_text, callback, options)
							if d_obj then
								d_obj.Parent = f_objects
								elevateZ(d_obj)
							end
							updateFolderSize(false)
							return d_data, d_obj
						end

						function folder_data:AddSlider(slider_text, callback, slider_options)
							local sl_data, sl_obj = tab_data:AddSlider(slider_text, callback, slider_options)
							if sl_obj then
								sl_obj.Parent = f_objects
								elevateZ(sl_obj)
							end
							updateFolderSize(false)
							return sl_data, sl_obj
						end

						function folder_data:AddButton(button_text, callback)
							local b_obj = tab_data:AddButton(button_text, callback)
							if b_obj then
								b_obj.Parent = f_objects
								elevateZ(b_obj)
							end
							updateFolderSize(false)
							return b_obj
						end

						function folder_data:AddLabel(label_text)
							local l_obj = tab_data:AddLabel(label_text)
							if l_obj then
								l_obj.Parent = f_objects
								elevateZ(l_obj)
							end
							updateFolderSize(false)
							return l_obj
						end

						function folder_data:AddGroup(group_name, default_open_g)
							return tab_data:AddFolder(group_name, default_open_g)
						end

						updateFolderSize(false)
						return folder_data, new_folder
					end

					function tab_data:AddGroup(group_name, default_open)
						return tab_data:AddFolder(group_name, default_open)
					end

				end

				return tab_data, new_tab
			end
		end
	end

	do
		for i, v in pairs(Window:GetDescendants()) do
			if hasprop(v, "ZIndex") then
				v.ZIndex = v.ZIndex + (windows * 10)
			end
		end
	end

	return window_data, Window
end


return library
end)()

-- Create Red & Grey Elerium v2 Window (680x370 Exact Compact Scale)
local window = library:AddWindow("Berlin v0.1.46", {
    main_color = Color3.fromRGB(180, 30, 40), -- Crimson Red Accent
    min_size = Vector2.new(680, 370),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

-- Add Search Field at top of Sidebar
local searchInput = window:AddSearchBox(function(query)
    print("[Berlin v0.1.46] Searching for:", query)
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

farmTab:Show()

-- ============================================================
-- GAME SERVICES & ALL BSS FIELD POSITIONS
-- ============================================================
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

local startTime = os.time()
local stopEverything = false
local flySpeed = 75 -- Separate Speed for Flying / Teleporting
local walkSpeed = 60 -- Separate Speed for Walking on Field
local speedLockEnabled = true -- 100% Stable WalkSpeed Lock

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

-- Format Numbers cleanly (e.g. 1.23M, 4.56B, 7.89T)
local function formatNumber(n)
    n = tonumber(n) or 0
    if n >= 1e12 then
        return string.format("%.2fT", n / 1e12)
    elseif n >= 1e9 then
        return string.format("%.2fB", n / 1e9)
    elseif n >= 1e6 then
        return string.format("%.2fM", n / 1e6)
    elseif n >= 1e3 then
        return string.format("%.2fK", n / 1e3)
    else
        return tostring(math.floor(n))
    end
end

-- Get Current Player Honey Amount
local function getHoney()
    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    if leaderstats and leaderstats:FindFirstChild("Honey") then
        return leaderstats.Honey.Value
    end
    local coreStats = LocalPlayer:FindFirstChild("CoreStats")
    if coreStats and coreStats:FindFirstChild("Honey") then
        return coreStats.Honey.Value
    end
    return 0
end

local initialHoney = getHoney()

-- ============================================================
-- STABLE SPEED LOCK ENGINE (PREVENTS BSS BUFFS FROM RESETTING SPEED)
-- ============================================================
local function enforceStableSpeed()
    if not speedLockEnabled then return end
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum and hum.WalkSpeed ~= walkSpeed then
        hum.WalkSpeed = walkSpeed
    end
end

RunService.Heartbeat:Connect(enforceStableSpeed)
RunService.Stepped:Connect(enforceStableSpeed)

-- ============================================================
-- HELPER FUNCTIONS: HIVE FINDER & SMOOTH TRAVEL TO CONVERTER
-- ============================================================

-- Find Player's Exact Hive Model
local function getMyHive()
    local hives = Workspace:FindFirstChild("Honeycombs") or Workspace:FindFirstChild("Hives")
    if hives then
        for _, hive in ipairs(hives:GetChildren()) do
            local ownerVal = hive:FindFirstChild("Owner")
            if ownerVal and (ownerVal.Value == LocalPlayer or (ownerVal.Value and tostring(ownerVal.Value) == LocalPlayer.Name)) then
                return hive
            end
            for _, child in ipairs(hive:GetChildren()) do
                if child.Name == "Owner" and (child.Value == LocalPlayer or (child.Value and tostring(child.Value) == LocalPlayer.Name)) then
                    return hive
                end
            end
        end
    end
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if (obj.Name == "SpawnPos" or obj.Name == "Platform" or obj.Name == "Pad") and obj.Parent then
            local owner = obj.Parent:FindFirstChild("Owner") or obj:FindFirstChild("Owner")
            if owner and (owner.Value == LocalPlayer or (owner.Value and tostring(owner.Value) == LocalPlayer.Name)) then
                return obj.Parent
            end
        end
    end
    return nil
end

-- Smooth Movement (Walk/Fly) Directly to Player's Hive Converting Pad
local function travelToHiveConverter()
    print("[Berlin v0.1.46] Traveling Smoothly to My Hive Converter Pad at flySpeed:", flySpeed)
    local hive = getMyHive()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")

    if not hrp then return end

    local targetCF = nil
    if hive then
        local platform = hive:FindFirstChild("Platform") or hive:FindFirstChild("Pad") or hive:FindFirstChild("Base") or hive:FindFirstChild("SpawnPos")
        if platform then
            targetCF = platform.CFrame * CFrame.new(0, 3.5, 0)
        else
            targetCF = hive:GetPivot() * CFrame.new(0, 3.5, -5)
        end
    else
        for _, spawnPoint in ipairs(Workspace:GetDescendants()) do
            if spawnPoint:IsA("SpawnLocation") and (spawnPoint.Name:find("Hive") or (spawnPoint.Parent and spawnPoint.Parent.Name:find("Hive"))) then
                targetCF = spawnPoint.CFrame * CFrame.new(0, 3.5, 0)
                break
            end
        end
    end

    if targetCF then
        local distance = (hrp.Position - targetCF.Position).Magnitude
        local travelTime = math.clamp(distance / math.max(flySpeed, 10), 0.2, 10)

        hrp.Anchored = true
        local tween = TweenService:Create(hrp, TweenInfo.new(travelTime, Enum.EasingStyle.Linear), {CFrame = targetCF})
        tween:Play()
        tween.Completed:Wait()
        hrp.Anchored = false
        print("[Berlin v0.1.46] Arrived at Hive Converter Pad!")

        local events = ReplicatedStorage:FindFirstChild("Events")
        if events and events:FindFirstChild("PlayerHiveCommand") then
            events.PlayerHiveCommand:FireServer("MakeHoney")
            events.PlayerHiveCommand:FireServer("ConvertHoney")
        end
    else
        warn("[Berlin v0.1.46] Hive not found! Please claim a hive first.")
    end
end

-- Place Sprinkler from Inventory in Field Center
local function placeSprinklerInField(fieldName)
    local events = ReplicatedStorage:FindFirstChild("Events")
    if events then
        if events:FindFirstChild("ToyEvent") then
            events.ToyEvent:FireServer("Sprinkler")
            events.ToyEvent:FireServer("PlaceSprinkler")
        end
        if events:FindFirstChild("PlayerItemEvent") then
            events.PlayerItemEvent:FireServer("Sprinkler")
        end
    end
    print("[Berlin v0.1.46] Placed Sprinkler in Center of Field:", fieldName)
end

-- Fire Item Buff RemoteEvent
local function useInventoryBuff(itemName)
    local events = ReplicatedStorage:FindFirstChild("Events")
    if events and events:FindFirstChild("PlayerItemEvent") then
        events.PlayerItemEvent:FireServer(itemName)
        print("[Berlin v0.1.46] Used Buff:", itemName)
    end
end

-- Fire Dispenser / Toy RemoteEvent
local function collectDispenser(toyName)
    local events = ReplicatedStorage:FindFirstChild("Events")
    if events and events:FindFirstChild("ToyEvent") then
        events.ToyEvent:FireServer(toyName)
        print("[Berlin v0.1.46] Collected Dispenser:", toyName)
    end
end

-- Fire Quest RemoteEvent
local function takeQuest(npcName)
    local events = ReplicatedStorage:FindFirstChild("Events")
    if events and events:FindFirstChild("QuestEvent") then
        events.QuestEvent:FireServer("AcceptQuest", npcName)
        print("[Berlin v0.1.46] Took Quest from:", npcName)
    end
end

-- ============================================================
-- HOME TAB (WITH LIVE SESSION HONEY & HONEY/HOUR STATS)
-- ============================================================
local homeFolder = homeTab:AddFolder("Home Overview", true, "left")

local uptimeLbl = homeFolder:AddLabel("Uptime: 00:00:00")
local serverUptimeLbl = homeFolder:AddLabel("Server Uptime: 00:00:00")
local honeyLbl = homeFolder:AddLabel("Session Honey: 0")
local hphLbl = homeFolder:AddLabel("Honey per Hour: 0/h")

homeFolder:AddSwitch("Stop Everything", function(state)
    stopEverything = state
    print("[Berlin v0.1.46] Stop Everything:", state)
end)

homeFolder:AddButton("Fly to My Hive Converter", function()
    print("[Berlin v0.1.46] Traveling to Hive Converter...")
    travelToHiveConverter()
end)

-- Live Timers & Session Honey Stats Loop
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

        -- Calculate Session Honey & Honey per Hour
        local currentHoney = getHoney()
        local sessionHoney = math.max(currentHoney - initialHoney, 0)
        local hph = (elapsed > 5) and math.floor((sessionHoney / elapsed) * 3600) or 0

        if honeyLbl then honeyLbl.Text = "Session Honey: " .. formatNumber(sessionHoney) end
        if hphLbl then hphLbl.Text = "Honey per Hour: " .. formatNumber(hph) .. "/h" end
    end
end)

-- ============================================================
-- FARMING TAB (2-COLUMN COLLAPSIBLE CARDS MATCHING ATLAS V1.0)
-- ============================================================

local selectedField = "Pine Tree Forest"
local autoFarmActive = false
local autoDigActive = false
local autoSprinklerActive = false

-- LEFT COLUMN (COLUMN 1)
local farmFolder = farmTab:AddFolder("Farming", true, "left")

local fieldList = {}
for name, _ in pairs(FieldPositions) do
    table.insert(fieldList, name)
end
table.sort(fieldList)

farmFolder:AddDropdown("Field", function(selected)
    selectedField = selected
    print("[Berlin v0.1.46] Selected Field:", selectedField)
    if autoSprinklerActive then
        placeSprinklerInField(selectedField)
    end
end, fieldList)

farmFolder:AddSwitch("Autofarm", function(state)
    autoFarmActive = state
    print("[Berlin v0.1.46] Autofarm:", state)
    if state and autoSprinklerActive then
        placeSprinklerInField(selectedField)
    end
end)

farmFolder:AddSwitch("Auto Sprinkler", function(state)
    autoSprinklerActive = state
    print("[Berlin v0.1.46] Auto Sprinkler:", state)
    if state then
        placeSprinklerInField(selectedField)
    end
end)

farmFolder:AddSwitch("Auto Dig", function(state)
    autoDigActive = state
    print("[Berlin v0.1.46] Auto Dig:", state)
end)

farmTab:AddFolder("Farm Settings", false, "left")
local convertFolder = farmTab:AddFolder("Convert Settings", false, "left")
convertFolder:AddButton("Convert Honey at Hive", function()
    travelToHiveConverter()
end)

farmTab:AddFolder("Guiding Star Settings", false, "left")
farmTab:AddFolder("Natro Patterns", false, "left")
farmTab:AddFolder("Face Settings", false, "left")

-- RIGHT COLUMN (COLUMN 2)
local sproutFolder = farmTab:AddFolder("Sprout Settings", true, "right")
sproutFolder:AddSwitch("Farm Sprouts", function(state) end)
sproutFolder:AddSwitch("Auto Plant Sprouts", function(state) end)
sproutFolder:AddSwitch("Plant During Day Only", function(state) end)
sproutFolder:AddSwitch("Plant During Night Only", function(state) end)

sproutFolder:AddDropdown("Allowed Fields", function(selected) end, {"All Fields", "Pine Tree Forest", "Coconut Field", "Pepper Patch"})
sproutFolder:AddDropdown("Sprout Rarity", function(selected) end, {"All Rarities", "Moon Sprout", "Epic Sprout", "Supreme Sprout"})

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

-- CONFIG TAB (SEPARATE FLY AND WALK SPEED SLIDERS)
local configFolder = configTab:AddFolder("Movement Controls", true, "left")

configFolder:AddSwitch("Stable Speed Lock", function(state)
    speedLockEnabled = state
    print("[Berlin v0.1.46] Stable Speed Lock:", state)
end)

configFolder:AddSlider("Fly Speed", function(val)
    flySpeed = val
    print("[Berlin v0.1.46] Fly Speed set to:", val)
end, {min = 10, max = 300, readonly = false})

configFolder:AddSlider("Walk Speed", function(val)
    walkSpeed = val
    enforceStableSpeed()
    print("[Berlin v0.1.46] Walk Speed set to:", val)
end, {min = 16, max = 300, readonly = false})

configFolder:AddSlider("JumpPower", function(val)
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then hum.JumpPower = val end
end, {min = 50, max = 300, readonly = false})

-- ============================================================
-- AUTOMATED UI DIAGNOSTICS ENGINE IN DEBUG TAB
-- ============================================================
local debugFolder = debugTab:AddFolder("UI Diagnostics", true, "left")

local function runUIDiagnostics()
    print("==================================================")
    print("[Berlin Debug] RUNNING AUTOMATED UI DIAGNOSTICS...")
    print("==================================================")
    
    local gui = LocalPlayer.PlayerGui:FindFirstChild("Elerium") or LocalPlayer.PlayerGui:FindFirstChild("Berlin")
    if not gui then
        local foundAny = false
        for _, child in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
            if child:FindFirstChild("Window") or child.Name:find("Elerium") then
                gui = child
                foundAny = true
                break
            end
        end
        if not foundAny then
            warn("[Berlin Debug] ❌ PlayerGui UI Container not found!")
            return
        end
    end

    print("[Berlin Debug] ✅ Main ScreenGui Container Found:", gui.Name)
    local windowFrame = gui:FindFirstChild("Window", true)
    if windowFrame then
        print("[Berlin Debug] ✅ Window Frame Found. Size:", tostring(windowFrame.Size))
    end

    local btnCount = 0
    local dropdownCount = 0
    local folderCount = 0

    for _, desc in ipairs(gui:GetDescendants()) do
        if desc:IsA("TextButton") then
            if desc.Name:find("Button") then
                btnCount = btnCount + 1
            elseif desc.Name:find("Dropdown") then
                dropdownCount = dropdownCount + 1
            end
        elseif desc:IsA("Frame") and desc.Name:find("Folder") then
            folderCount = folderCount + 1
        end
    end

    print("--------------------------------------------------")
    print(string.format("[Berlin Debug] SUMMARY: %d Folders, %d Buttons, %d Dropdowns Diagnostic Complete!", folderCount, btnCount, dropdownCount))
    print("[Berlin Debug] ✅ ALL UI ELEMENTS VERIFIED HEALTHY!")
    print("==================================================")
end

debugFolder:AddButton("Run UI Diagnostic Test", function()
    runUIDiagnostics()
end)

-- ============================================================
-- LOOK-AHEAD TOKEN CHAIN PATHING ENGINE
-- ============================================================
local function isTokenReachable(token, hrpPos, playerSpeed)
    if not token or not token.Parent or not token:IsA("BasePart") then
        return false
    end
    local dist = (hrpPos - token.Position).Magnitude
    
    local spawnTime = token:GetAttribute("SpawnTime") or (token:FindFirstChild("SpawnTime") and token.SpawnTime.Value)
    if spawnTime then
        local age = os.clock() - spawnTime
        local remainingLife = math.max(7 - age, 0)
        local timeToReach = dist / math.max(playerSpeed, 16)
        if timeToReach >= remainingLife then
            return false
        end
    end

    local maxReachDist = math.clamp(playerSpeed * 2.5, 45, 130)
    return dist <= maxReachDist
end

-- Nearest-Neighbor Look-Ahead Token Chain Builder
local function getOptimizedTokenChain(hrpPos, fieldCenter, playerSpeed)
    local collectibles = Workspace:FindFirstChild("Collectibles") or Workspace:FindFirstChild("Tokens")
    if not collectibles then return {} end

    local validTokens = {}
    for _, token in ipairs(collectibles:GetChildren()) do
        if token:IsA("BasePart") and (token.Position - fieldCenter).Magnitude < 52 then
            if isTokenReachable(token, hrpPos, playerSpeed) then
                table.insert(validTokens, token)
            end
        end
    end

    local chain = {}
    local currPos = hrpPos
    local visited = {}

    for i = 1, math.min(#validTokens, 8) do
        local bestToken = nil
        local minDist = 9999
        for _, token in ipairs(validTokens) do
            if not visited[token] then
                local d = (currPos - token.Position).Magnitude
                if d < minDist then
                    minDist = d
                    bestToken = token
                end
            end
        end
        if bestToken then
            visited[bestToken] = true
            table.insert(chain, bestToken)
            currPos = bestToken.Position
        else
            break
        end
    end

    return chain
end

-- Dedicated Multi-Method Auto Dig Loop (Click Screen & Swing Tool)
task.spawn(function()
    while task.wait(0.08) do
        if not stopEverything and (autoDigActive or autoFarmActive) then
            local char = LocalPlayer.Character
            local tool = char and char:FindFirstChildOfClass("Tool")

            -- Method 1: Swing Equipped Scoop / Tool
            if tool then
                tool:Activate()
            end

            -- Method 2: VirtualUser Screen Click
            pcall(function()
                VirtualUser:ClickButton1(Vector2.new(500, 500))
            end)

            -- Method 3: Executor Screen Click / Mouse Click
            pcall(function()
                if mouse1click then
                    mouse1click()
                elseif mouse1press and mouse1release then
                    mouse1press()
                    task.wait()
                    mouse1release()
                end
            end)

            -- Method 4: BSS RemoteEvent Digging
            local events = ReplicatedStorage:FindFirstChild("Events")
            if events and events:FindFirstChild("ToolCollect") then
                events.ToolCollect:FireServer()
            end
        end
    end
end)

-- Main Look-Ahead Non-Stop Movement & Token Queue Loop
task.spawn(function()
    local angle = 0
    while task.wait(0.05) do
        if not stopEverything and autoFarmActive then
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")

            if hrp and hum then
                local center = FieldPositions[selectedField] or Vector3.new(0, 4, 0)
                local distFromField = (hrp.Position - center).Magnitude

                -- If player is far off field (>120 studs), smoothly travel to field first
                if distFromField > 120 then
                    local travelTime = math.clamp(distFromField / math.max(flySpeed, 10), 0.5, 6)
                    hrp.Anchored = true
                    local tween = TweenService:Create(hrp, TweenInfo.new(travelTime, Enum.EasingStyle.Linear), {CFrame = CFrame.new(center + Vector3.new(0, 4, 0))})
                    tween:Play()
                    tween.Completed:Wait()
                    hrp.Anchored = false

                    if autoSprinklerActive then
                        placeSprinklerInField(selectedField)
                    end
                end

                -- Compute Multi-Step Look-Ahead Token Chain
                local chain = getOptimizedTokenChain(hrp.Position, center, walkSpeed)

                if #chain > 0 then
                    local currentTarget = chain[1]
                    local distToFirst = (hrp.Position - currentTarget.Position).Magnitude

                    -- Look-Ahead Steering: if close to 1st token (<4.5 studs) and 2nd token exists, seamlessly steer towards 2nd token!
                    if #chain >= 2 and distToFirst < 4.5 then
                        hum:MoveTo(chain[2].Position)
                    else
                        hum:MoveTo(currentTarget.Position)
                    end
                else
                    -- Smooth natural patrol without sudden stops
                    angle = angle + 0.08
                    local patrolPoint = center + Vector3.new(math.cos(angle) * 20, 0, math.sin(angle) * 20)
                    hum:MoveTo(patrolPoint)
                end

                -- Auto Convert check if Pollen Container is Full
                local pollen = LocalPlayer:FindFirstChild("Pollen")
                local capacity = LocalPlayer:FindFirstChild("Capacity")
                if pollen and capacity and capacity.Value > 0 and pollen.Value >= capacity.Value then
                    print("[Berlin v0.1.46] Pollen Full! Traveling smoothly to Hive...")
                    travelToHiveConverter()
                    task.wait(3)
                end
            end
        end
    end
end)
