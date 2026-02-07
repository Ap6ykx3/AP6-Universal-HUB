local AP6Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ap6ykx3/AP6Library/refs/heads/main/AP6Library.lua"))()

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

    local HubGui = Instance.new("ScreenGui")
    HubGui.Name = "AP6UniversalHub"
    HubGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 460, 0, 380)
    Main.Position = UDim2.new(0.5, -230, 0.5, -190)
    Main.BackgroundColor3 = AP6Lib.Colors.Background
    Main.BackgroundTransparency = 1
    Main.Parent = HubGui
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 18)

    local Stroke = Instance.new("UIStroke", Main)
    Stroke.Color = AP6Lib.Colors.Primary
    Stroke.Thickness = 1
    Stroke.Transparency = 0.4

    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1, -20, 0, 45)
    Title.Position = UDim2.new(0, 10, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = "AP6 UNIVERSAL HUB"
    Title.TextColor3 = Color3.fromRGB(220,220,220)
    Title.Font = Enum.Font.GothamBlack
    Title.TextSize = 22
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 8)

    local Holder = Instance.new("Frame", Main)
    Holder.Size = UDim2.new(1, -20, 1, -90)
    Holder.Position = UDim2.new(0, 10, 0, 65)
    Holder.BackgroundTransparency = 1
    Layout.Parent = Holder

    AP6Lib:FadeIn(Main, 1)
    AP6Lib:MakeDraggable(Main)
    AP6Lib:BindToggle(Main)

    for id, info in pairs(supportedGames) do
        local icon = AP6Lib.Icons.Developing
        local text = info.name .. " - " .. info.status

        if id == currentGame then
            icon = AP6Lib.Icons.Ready
            text = info.name .. " - Detected"
        elseif info.status == "Ready" then
            icon = AP6Lib.Icons.NotInGame
            text = info.name .. " - Not in game"
        end

        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(1, 0, 0, 36)
        Button.BackgroundColor3 = AP6Lib.Colors.Primary
        Button.TextColor3 = Color3.new(1,1,1)
        Button.Text = icon .. "  " .. text
        Button.Font = Enum.Font.GothamBold
        Button.TextSize = 14
        Button.Parent = Holder
        Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 12)

        Button.MouseButton1Click:Connect(function()
            if id == currentGame and info.status == "Ready" and info.url then
                AP6Lib:Notify("AP6 HUB", "Loading "..info.name, 3)
                HubGui:Destroy()
                loadstring(game:HttpGet(info.url))()
            elseif info.status == "Ready" then
                AP6Lib:Notify("AP6 HUB", "You are not in this game", 4)
            else
                AP6Lib:Notify("AP6 HUB", info.name.." is "..info.status, 4)
            end
        end)
    end

    local Credits = Instance.new("TextLabel", Main)
    Credits.Size = UDim2.new(1, -20, 0, 25)
    Credits.Position = UDim2.new(0, 10, 1, -30)
    Credits.BackgroundTransparency = 1
    Credits.Text = "Developed by Ap6ykx3"
    Credits.TextColor3 = AP6Lib.Colors.Secondary
    Credits.Font = Enum.Font.GothamBold
    Credits.TextSize = 13

end, function()
    AP6Lib:Notify("AP6 HUB", "Invalid key", 4)
end)
