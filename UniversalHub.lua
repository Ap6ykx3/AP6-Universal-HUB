-- UNIVERSAL HUB (este es el único script que ejecutas)
local AP6 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ap6ykx3/AP6Library/main/AP6Library.lua"))()

local supportedGames = {
    [73904017172892] = { name = "Roll In A Cart", status = "Ready", url = "https://raw.githubusercontent.com/Ap6ykx3/AP6-HUB/main/Roll%20In%20A%20Cart%20(SIMPLE%20AUTO%20CASH).lua" },
    [130850206307448] = { name = "Blox Flipper", status = "Ready", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-BloxFlipper/main/BloxFlipper.lua" },
    [6677985923] = { name = "Millonaire Empire Tycoon", status = "Ready", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-Millonaire-Empire-Tycoon/main/Millonaire%20Empire%20Tycoon.lua" },
    [120390407164140] = { name = "+$1 Every Correct Glass", status = "Ready", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB--1-000-Every-Collect-Glass/main/EveryCorrectGlass.lua" }
}

AP6:Loading(function()
    AP6:CheckKey("Ap6S", function()
        AP6:Notify("AUTHENTICATED", "Bienvenido, Ap6ykx3. Cargando hub...", 2.5)

        local Hub = Instance.new("ScreenGui", AP6.PlayerGui)
        Hub.Name = "AP6UniversalHub"
        Hub.IgnoreGuiInset = true
        Hub.ResetOnSpawn = false

        local Main = Instance.new("Frame", Hub)
        Main.Size = UDim2.new(0, 460, 0, 420)
        Main.Position = UDim2.new(0.5, -230, 0.5, -210)
        Main.BackgroundColor3 = AP6.Colors.Background
        Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 18)
        local stroke = Instance.new("UIStroke", Main)
        stroke.Color = AP6.Colors.Primary
        stroke.Thickness = 4
        stroke.Transparency = 0.2

        local Top = Instance.new("Frame", Main)
        Top.Size = UDim2.new(1, 0, 0, 60)
        Top.BackgroundColor3 = AP6.Colors.Secondary
        Instance.new("UICorner", Top).CornerRadius = UDim.new(0, 18)
        local Title = Instance.new("TextLabel", Top)
        Title.Size = UDim2.new(1, -20, 1, 0)
        Title.Position = UDim2.new(0, 25, 0, 0)
        Title.BackgroundTransparency = 1
        Title.Text = 'AP6 <font color="#FF002D">TERMINATOR</font>'
        Title.RichText = true
        Title.Font = Enum.Font.GothamBlack
        Title.TextSize = 24
        Title.TextColor3 = Color3.new(1,1,1)
        Title.TextXAlignment = Enum.TextXAlignment.Left

        local CloseBtn = Instance.new("TextButton", Top)
        CloseBtn.Size = UDim2.new(0, 40, 0, 40)
        CloseBtn.Position = UDim2.new(1, -50, 0.5, -20)
        CloseBtn.BackgroundTransparency = 1
        CloseBtn.Text = "✕"
        CloseBtn.TextColor3 = AP6.Colors.Primary
        CloseBtn.Font = Enum.Font.GothamBold
        CloseBtn.TextSize = 26
        CloseBtn.MouseButton1Click:Connect(function()
            AP6:PlaySound(AP6.Sounds.Click)
            Hub:Destroy()
        end)

        AP6:MakeDraggable(Main)
        AP6:BindToggle(Main)
        AP6:FadeIn(Main, 1)

        local Scroll = Instance.new("ScrollingFrame", Main)
        Scroll.Size = UDim2.new(1, -40, 1, -100)
        Scroll.Position = UDim2.new(0, 20, 0, 80)
        Scroll.BackgroundTransparency = 1
        Scroll.ScrollBarThickness = 6
        Scroll.ScrollBarImageColor3 = AP6.Colors.Primary
        Scroll.ScrollBarImageTransparency = 0.4

        local Layout = Instance.new("UIListLayout", Scroll)
        Layout.Padding = UDim.new(0, 16)
        Layout.SortOrder = Enum.SortOrder.LayoutOrder

        local currentPlace = game.PlaceId

        for placeId, gameInfo in pairs(supportedGames) do
            local btn = Instance.new("TextButton", Scroll)
            btn.Size = UDim2.new(1, 0, 0, 64)
            btn.BackgroundColor3 = AP6.Colors.Secondary
            btn.Text = ""
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 14)
            local btnStroke = Instance.new("UIStroke", btn)
            btnStroke.Color = AP6.Colors.Grey
            btnStroke.Thickness = 2

            local icon = Instance.new("TextLabel", btn)
            icon.Size = UDim2.new(0, 60, 1, 0)
            icon.BackgroundTransparency = 1
            icon.Text = (placeId == currentPlace) and AP6.Icons.Ready or AP6.Icons.NotInGame
            icon.TextSize = 38
            icon.Font = Enum.Font.GothamBold

            local nameLabel = Instance.new("TextLabel", btn)
            nameLabel.Size = UDim2.new(1, -80, 1, 0)
            nameLabel.Position = UDim2.new(0, 70, 0, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = gameInfo.name
            nameLabel.TextColor3 = (placeId == currentPlace) and AP6.Colors.Text or AP6.Colors.Grey
            nameLabel.Font = Enum.Font.GothamBold
            nameLabel.TextSize = 19
            nameLabel.TextXAlignment = Enum.TextXAlignment.Left

            btn.MouseEnter:Connect(function()
                AP6:PlaySound(AP6.Sounds.Hover)
                TweenService:Create(btnStroke, TweenInfo.new(0.25), {Color = AP6.Colors.Primary, Thickness = 3}):Play()
            end)
            btn.MouseLeave:Connect(function()
                TweenService:Create(btnStroke, TweenInfo.new(0.25), {Color = AP6.Colors.Grey, Thickness = 2}):Play()
            end)

            btn.MouseButton1Click:Connect(function()
                AP6:PlaySound(AP6.Sounds.Click)
                if placeId == currentPlace and gameInfo.status == "Ready" then
                    AP6:Notify("INJECTING", gameInfo.name, 3)
                    task.wait(1.3)
                    Hub:Destroy()
                    loadstring(game:HttpGet(gameInfo.url))()
                else
                    AP6:Notify("DENIED", "No estás en este juego o no está listo aún.", 5)
                end
            end)
        end

        Scroll.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 40)
    end, function()
        AP6:Notify("ACCESS DENIED", "Llave inválida. Conexión terminada.", 7)
    end)
end)
