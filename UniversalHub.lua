local AP6Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ap6ykx3/AP6Library/refs/heads/main/AP6Library.lua"))()

local supportedGames = {
    [73904017172892] = { name = "Roll In A Cart", status = "Ready", url = "https://raw.githubusercontent.com/Ap6ykx3/AP6-HUB/main/Roll%20In%20A%20Cart%20(SIMPLE%20AUTO%20CASH).lua" },
    [130850206307448] = { name = "Blox Flipper", status = "Ready", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-BloxFlipper/main/BloxFlipper.lua" },
    [6677985923] = { name = "Millonaire Empire Tycoon", status = "Ready", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-Millonaire-Empire-Tycoon/main/Millonaire%20Empire%20Tycoon.lua" },
    [120390407164140] = { name = "+$1 Every Correct Glass", status = "Ready", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB--1-000-Every-Collect-Glass/main/EveryCorrectGlass.lua" }
}

AP6Lib:Loading(function()
    AP6Lib:CheckKey("Ap6S", function()
        local Hub = Instance.new("ScreenGui", PlayerGui)
        Hub.Name = "AP6UniversalHub"
        Hub.ResetOnSpawn = false

        local Main = Instance.new("Frame", Hub)
        Main.Size = UDim2.new(0, 430, 0, 390)
        Main.Position = UDim2.new(0.5, -215, 0.5, -195)
        Main.BackgroundColor3 = AP6Lib.Colors.Background
        Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)
        local stroke = Instance.new("UIStroke", Main)
        stroke.Color = AP6Lib.Colors.Primary
        stroke.Thickness = 3

        local Top = Instance.new("Frame", Main)
        Top.Size = UDim2.new(1, 0, 0, 54)
        Top.BackgroundColor3 = AP6Lib.Colors.Secondary
        Instance.new("UICorner", Top).CornerRadius = UDim.new(0, 16)
        local Title = Instance.new("TextLabel", Top)
        Title.Size = UDim2.new(1, -20, 1, 0)
        Title.Position = UDim2.new(0, 20, 0, 0)
        Title.BackgroundTransparency = 1
        Title.Text = 'AP6 <font color="#FF002D">TERMINATOR</font>'
        Title.RichText = true
        Title.Font = Enum.Font.GothamBlack
        Title.TextSize = 22
        Title.TextColor3 = Color3.new(1,1,1)
        Title.TextXAlignment = Enum.TextXAlignment.Left

        local Close = Instance.new("TextButton", Top)
        Close.Size = UDim2.new(0, 34, 0, 34)
        Close.Position = UDim2.new(1, -40, 0, 10)
        Close.BackgroundTransparency = 1
        Close.Text = "✕"
        Close.TextColor3 = AP6Lib.Colors.Primary
        Close.Font = Enum.Font.GothamBold
        Close.TextSize = 24
        Close.MouseButton1Click:Connect(function()
            AP6Lib:PlaySound(AP6Lib.Sounds.Click)
            Hub:Destroy()
        end)

        AP6Lib:MakeDraggable(Main)
        AP6Lib:BindToggle(Main)
        AP6Lib:FadeIn(Main, 0.9)

        local Scroll = Instance.new("ScrollingFrame", Main)
        Scroll.Size = UDim2.new(1, -30, 1, -90)
        Scroll.Position = UDim2.new(0, 15, 0, 70)
        Scroll.BackgroundTransparency = 1
        Scroll.ScrollBarThickness = 5
        Scroll.ScrollBarImageColor3 = AP6Lib.Colors.Primary
        local Layout = Instance.new("UIListLayout", Scroll)
        Layout.Padding = UDim.new(0, 14)

        local current = game.PlaceId
        for id, data in pairs(supportedGames) do
            local btn = Instance.new("TextButton", Scroll)
            btn.Size = UDim2.new(1, 0, 0, 56)
            btn.BackgroundColor3 = AP6Lib.Colors.Secondary
            btn.Text = ""
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
            local s = Instance.new("UIStroke", btn)
            s.Color = AP6Lib.Colors.Grey
            s.Thickness = 1.8

            local icon = Instance.new("TextLabel", btn)
            icon.Size = UDim2.new(0, 50, 1, 0)
            icon.BackgroundTransparency = 1
            icon.Text = (id == current and data.status == "Ready") and AP6Lib.Icons.Ready or AP6Lib.Icons.NotInGame
            icon.TextSize = 32
            icon.Font = Enum.Font.GothamBold

            local name = Instance.new("TextLabel", btn)
            name.Size = UDim2.new(1, -70, 1, 0)
            name.Position = UDim2.new(0, 60, 0, 0)
            name.BackgroundTransparency = 1
            name.Text = data.name
            name.TextColor3 = id == current and AP6Lib.Colors.Text or AP6Lib.Colors.Grey
            name.Font = Enum.Font.GothamBold
            name.TextSize = 17
            name.TextXAlignment = Enum.TextXAlignment.Left

            btn.MouseEnter:Connect(function()
                AP6Lib:PlaySound(AP6Lib.Sounds.Hover)
                TweenService:Create(s, TweenInfo.new(0.25), {Color = AP6Lib.Colors.Primary, Thickness = 2.5}):Play()
            end)
            btn.MouseLeave:Connect(function()
                TweenService:Create(s, TweenInfo.new(0.25), {Color = AP6Lib.Colors.Grey, Thickness = 1.8}):Play()
            end)

            btn.MouseButton1Click:Connect(function()
                AP6Lib:PlaySound(AP6Lib.Sounds.Click)
                if id == current and data.status == "Ready" then
                    AP6Lib:Notify("INJECTING", data.name, 3)
                    task.wait(1.2)
                    Hub:Destroy()
                    loadstring(game:HttpGet(data.url))()
                else
                    AP6Lib:Notify("DENIED", "No estás en este juego o no está listo.", 4)
                end
            end)
        end

        Scroll.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 30)
    end, function()
        AP6Lib:Notify("ACCESS DENIED", "Llave inválida. Conexión terminada.", 6)
    end)
end)
