pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Message",
        Text = "Hello world",
        Duration = 5
    })
end)
