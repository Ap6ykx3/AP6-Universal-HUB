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

    local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local Gui = Instance.new("ScreenGui", PlayerGui)
    Gui.Name = "AP6UniversalHub"

    local Main = Instance.new("Frame", Gui)
    Main.Size = UDim2.new(0, 480, 0, 390)
    Main.Position = UDim2.new(0.5, -240, 0.5, -195)
    Main.BackgroundColor3 = AP6Lib.Colors.Background
    Main.BackgroundTransparency = 1
    Main.Active = true
    Main.Draggable = true
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 18)

    AP6Lib:FadeIn(Main, 0.8)

    local Top = Instance.new("Frame", Main)
    Top.Size = UDim2.new(1, 0, 0, 45)
    Top.BackgroundTransparency = 1

    local Title = Instance.new("TextLabel", Top)
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "AP6 UNIVERSAL HUB"
    Title.Font = Enum.Font.GothamBlack
    Title.TextSize = 20
    Title.TextColor3 = Color3.fromRGB(230,230,230)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextYAlignment = Enum.TextYAlignment.Center

    local Minimize = Instance.new("TextButton", Top)
    Minimize.Size = UDim2.new(0, 32, 0, 32)
    Minimize.Position = UDim2.new(1, -80, 0.5, -16)
    Minimize.Text = "—"
    Minimize.Font = Enum.Font.GothamBold
    Minimize.TextSize = 20
    Minimize.TextColor3 = Color3.fromRGB(200,200,200)
    Minimize.BackgroundColor3 = Color3.fromRGB(45,45,45)
    Instance.new("UICorner", Minimize).CornerRadius = UDim.new(1,0)

    local Close = Instance.new("TextButton", Top)
    Close.Size = UDim2.new(0, 32, 0, 32)
    Close.Position = UDim2.new(1, -40, 0.5, -16)
    Close.Text = "✕"
    Close.Font = Enum.Font.GothamBold
    Close.TextSize = 18
    Close.TextColor3 = Color3.fromRGB(255,90,90)
    Close.BackgroundColor3 = Color3.fromRGB(45,45,45)
    Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

    local List = Instance.new("Frame", Main)
    List.Position = UDim2.new(0, 15, 0, 60)
    List.Size = UDim2.new(1, -30, 1, -110)
    List.BackgroundTransparency = 1

    local UIList = Instance.new("UIListLayout", List)
    UIList.Padding = UDim.new(0, 8)

    for id, info in pairs(supportedGames) do
        local txt = info.name.." - "..info.status
        local btn = Instance.new("TextButton", List)
        btn.Size = UDim2.new(1, 0, 0, 36)
        btn.BackgroundColor3 = AP6Lib.Colors.Primary
        btn.Text = txt
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.TextColor3 = Color3.new(1,1,1)
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.TextYAlignment = Enum.TextYAlignment.Center
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)

        btn.MouseButton1Click:Connect(function()
            if id == currentGame then
                Gui:Destroy()
                loadstring(game:HttpGet(info.url))()
            else
                AP6Lib:Notify("AP6 HUB", "You are not in this game", 4)
            end
        end)
    end

    Minimize.MouseButton1Click:Connect(function()
        Main.Visible = not Main.Visible
    end)

    Close.MouseButton1Click:Connect(function()
        AP6Lib:Confirm("Close UI", "Do you want to close the UI?", function()
            Gui:Destroy()
        end)
    end)

end, function()
    AP6Lib:Notify("AP6 HUB", "Invalid key", 4)
end)
