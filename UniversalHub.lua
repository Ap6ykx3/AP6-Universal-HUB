local AP6Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ap6ykx3/AP6Library/main/AP6Library.lua"))()

local supportedGames = {
    [73904017172892] = {
        name = "Roll In A Cart",
        status = "Ready",
        url = "https://raw.githubusercontent.com/Ap6ykx3/AP6-HUB/main/Roll%20In%20A%20Cart%20(SIMPLE%20AUTO%20CASH).lua"
    },
    [130850206307448] = {
        name = "Blox Flipper",
        status = "Ready",
        url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-BloxFlipper/main/BloxFlipper.lua"
    },
    [6677985923] = {
        name = "Millonaire Empire Tycoon",
        status = "Ready",
        url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-Millonaire-Empire-Tycoon/main/Millonaire%20Empire%20Tycoon.lua"
    },
    [120390407164140] = {
        name = "+$1 Every Correct Glass",
        status = "Ready",
        url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB--1-000-Every-Collect-Glass/main/EveryCorrectGlass.lua"
    }
}

local currentGame = game.PlaceId

AP6Lib:CheckKey("Ap6S", function()
    local Hub = Instance.new("ScreenGui")
    Hub.Name = "AP6UniversalHub"
    Hub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 400, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -175)
    MainFrame.BackgroundColor3 = AP6Lib.Colors.Background
    MainFrame.Parent = Hub

    AP6Lib:FadeIn(MainFrame, 1.5)
    AP6Lib:MakeDraggable(MainFrame)
    AP6Lib:BindToggle(MainFrame)

    local yOffset = 10

    for id, info in pairs(supportedGames) do
        local statusIcon = AP6Lib.Icons.Developing
        local displayName = info.name .. " - " .. info.status

        if id == currentGame then
            statusIcon = AP6Lib.Icons.Ready
            displayName = info.name .. " - Detected"
        elseif info.status == "Ready" then
            statusIcon = AP6Lib.Icons.NotInGame
            displayName = info.name .. " - Not in game"
        end

        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(1, -20, 0, 30)
        Button.Position = UDim2.new(0, 10, 0, yOffset)
        Button.BackgroundColor3 = AP6Lib.Colors.Primary
        Button.TextColor3 = Color3.new(1,1,1)
        Button.Text = statusIcon .. " " .. displayName
        Button.Parent = MainFrame

        Button.MouseButton1Click:Connect(function()
            if id == currentGame and info.status == "Ready" and info.url then
                Hub:Destroy()
                loadstring(game:HttpGet(info.url))()
            elseif info.status == "Ready" then
                AP6Lib:Notify("AP6 Universal Hub", "You not are in the game", 5)
            else
                AP6Lib:Notify("AP6 Universal Hub", info.name .. " is currently " .. info.status, 5)
            end
        end)

        yOffset = yOffset + 35
    end

    local Credits = Instance.new("TextLabel")
    Credits.Size = UDim2.new(1, -20, 0, 30)
    Credits.Position = UDim2.new(0, 10, 1, -40)
    Credits.BackgroundTransparency = 1
    Credits.TextColor3 = AP6Lib.Colors.Secondary
    Credits.Text = "Developed by Ap6ykx3"
    Credits.Parent = MainFrame
end, function()
    AP6Lib:Notify("AP6 Universal Hub", "Invalid key! Access denied.", 5)
end)
