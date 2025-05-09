function Keylibrary:MakeWindow(Settings)
    local HUI = Instance.new("ScreenGui")
    local Window = Instance.new("Frame")
    local Bar = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Element = Instance.new("Frame")
    local EnterKey = Instance.new("TextBox")
    local CheckKey = Instance.new("TextButton")
    local GetKey = Instance.new("TextButton")
    local Clear = Instance.new("TextButton")
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

    getgenv().Key = Settings.Key or "Key"
    getgenv().InputDate = ""

    function CorrectKey()
        CheckKey.Text = "CorrectKey"
        if typeof(Settings.ExecuteScript) == "function" then
            Settings.ExecuteScript()
        end
        wait(2)
        HUI:Destroy()
    end

    function Incorrect()
        CheckKey.Text = "IncorrectKey"
        wait(2)
        CheckKey.Text = "Check Key"
    end

    HUI.Name = "HUI"
    HUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    HUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Window.Name = "Window"
    Window.Parent = HUI
    Window.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
    Window.BorderColor3 = Color3.new(0.564706, 0, 0)
    Window.Position = UDim2.new(0.38056162, 0, 0.397443235, 0)
    Window.Size = UDim2.new(0, 386, 0, 163)

    Bar.Name = "Bar"
    Bar.Parent = Window
    Bar.BackgroundColor3 = Color3.new(0.564706, 0, 0)
    Bar.BorderColor3 = Color3.new(0, 0, 0)
    Bar.BorderSizePixel = 0
    Bar.Position = UDim2.new(0, 0, 0.134228185, 0)
    Bar.Size = UDim2.new(1, 0, 0.00671140943, 0)

    Title.Name = "Title"
    Title.Parent = Window
    Title.BackgroundColor3 = Color3.new(1, 1, 1)
    Title.BackgroundTransparency = 1
    Title.BorderColor3 = Color3.new(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(0.880829036, 0, 0.120805368, 0)
    Title.Font = Enum.Font.SourceSans
    Title.Text = Settings.Title or "Keylibrary"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.TextScaled = true
    Title.TextSize = 27
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Element.Name = "Element"
    Element.Parent = Window
    Element.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
    Element.BorderColor3 = Color3.new(0, 0, 0)
    Element.BorderSizePixel = 0
    Element.Position = UDim2.new(0, 6, 0, 29)
    Element.Size = UDim2.new(0.96632123, 0, 0.78082931, 0)

    EnterKey.Name = "EnterKey"
    EnterKey.Parent = Element
    EnterKey.BackgroundColor3 = Color3.new(0, 0, 0)
    EnterKey.BorderColor3 = Color3.new(0.564706, 0, 0)
    EnterKey.Position = UDim2.new(0.0134048257, 0, 0.0616666153, 0)
    EnterKey.Size = UDim2.new(0, 363, 0, 38)
    EnterKey.Font = Enum.Font.SourceSans
    EnterKey.Text = ""
    EnterKey.TextColor3 = Color3.new(1, 1, 1)
    EnterKey.TextSize = 19
    EnterKey.TextWrapped = true
    EnterKey.TextXAlignment = Enum.TextXAlignment.Left

    CheckKey.Name = "CheckKey"
    CheckKey.Parent = Element
    CheckKey.BackgroundColor3 = Color3.new(0, 0, 0)
    CheckKey.BorderColor3 = Color3.new(0.564706, 0, 0)
    CheckKey.Position = UDim2.new(0.0134048257, 0, 0.536666632, 0)
    CheckKey.Size = UDim2.new(0, 174, 0, 50)
    CheckKey.Font = Enum.Font.SourceSans
    CheckKey.Text = "Check Key"
    CheckKey.TextColor3 = Color3.new(1, 1, 1)
    CheckKey.TextSize = 20

    CheckKey.MouseButton1Click:Connect(function()
        getgenv().InputDate = EnterKey.Text
        if getgenv().InputDate == getgenv().Key then
            CorrectKey()
        else
            Incorrect()
        end
    end)

    GetKey.Name = "GetKey"
    GetKey.Parent = Element
    GetKey.BackgroundColor3 = Color3.new(0, 0, 0)
    GetKey.BorderColor3 = Color3.new(0.564706, 0, 0)
    GetKey.Position = UDim2.new(0.52010721, 0, 0.536666632, 0)
    GetKey.Size = UDim2.new(0, 174, 0, 50)
    GetKey.Font = Enum.Font.SourceSans
    GetKey.Text = "GetKey"
    GetKey.TextColor3 = Color3.new(1, 1, 1)
    GetKey.TextSize = 20

    GetKey.MouseButton1Click:Connect(function()
        if Settings.Keylink then
            setclipboard(Settings.Keylink)
        end
    end)

    Clear.Name = "Clear"
    Clear.Parent = Window
    Clear.BackgroundColor3 = Color3.new(0.564706, 0, 0)
    Clear.BackgroundTransparency = 1
    Clear.BorderColor3 = Color3.new(0, 0, 0)
    Clear.BorderSizePixel = 0
    Clear.Position = UDim2.new(0, 368, 0, 0)
    Clear.Size = UDim2.new(0.046632126, 0, 0.120805368, 0)
    Clear.Font = Enum.Font.FredokaOne
    Clear.Text = "X"
    Clear.TextColor3 = Color3.new(1, 0, 0)
    Clear.TextScaled = true
    Clear.TextSize = 14
    Clear.TextWrapped = true

    Clear.MouseButton1Click:Connect(function()
        HUI:Destroy()
    end)

    UIAspectRatioConstraint.Parent = Clear

    local function MakeDraggable()
        local UIS = game:GetService("UserInputService")
        local dragging
        local dragInput
        local dragStart
        local startPos

        local function update(input)
            local delta = input.Position - dragStart
            Window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end

        Window.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = Window.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        Window.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)

        UIS.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)
    end

    MakeDraggable()
end

return Keylibrary
