-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AdvancedGreenGUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.5, 0)
frame.Position = UDim2.new(0.25, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 50, 0)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Create UIGradient for Frame
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 100, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 50, 0))
}
gradient.Parent = frame

-- Create Button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.3, 0, 0.1, 0)
button.Position = UDim2.new(0.35, 0, 0.1, 0)
button.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Text = "Click Me"
button.Font = Enum.Font.SourceSansBold
button.TextSize = 24
button.Parent = frame

-- Create Slider
local sliderFrame = Instance.new("Frame")
sliderFrame.Size = UDim2.new(0.8, 0, 0.1, 0)
sliderFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
sliderFrame.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
sliderFrame.BorderSizePixel = 0
sliderFrame.Parent = frame

local slider = Instance.new("TextButton")
slider.Size = UDim2.new(0.1, 0, 1, 0)
slider.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
slider.Text = ""
slider.Parent = sliderFrame

-- Create Switch
local switchFrame = Instance.new("Frame")
switchFrame.Size = UDim2.new(0.3, 0, 0.1, 0)
switchFrame.Position = UDim2.new(0.35, 0, 0.5, 0)
switchFrame.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
switchFrame.BorderSizePixel = 0
switchFrame.Parent = frame

local switch = Instance.new("TextButton")
switch.Size = UDim2.new(0.5, 0, 1, 0)
switch.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
switch.Text = "OFF"
switch.TextColor3 = Color3.fromRGB(255, 255, 255)
switch.Font = Enum.Font.SourceSansBold
switch.TextSize = 24
switch.Parent = switchFrame

-- Switch functionality
local switchOn = false
switch.MouseButton1Click:Connect(function()
    switchOn = not switchOn
    if switchOn then
        switch.Text = "ON"
        switch.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    else
        switch.Text = "OFF"
        switch.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    end
end)

-- Slider functionality
local dragging = false
slider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
    end
end)

slider.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local newPos = UDim2.new(math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1), 0, 0, 0)
        slider.Position = newPos
    end
end)
