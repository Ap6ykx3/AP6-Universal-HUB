-- UNIVERSAL HUB (este es el script que ejecutas)
local AP6 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ap6ykx3/AP6Library/main/AP6Library.lua"))()

local supportedGames = {
    [73904017172892] = { name = "Roll In A Cart", status = "Ready", url = "https://raw.githubusercontent.com/Ap6ykx3/AP6-HUB/main/Roll%20In%20A%20Cart%20(SIMPLE%20AUTO%20CASH).lua" },
    [130850206307448] = { name = "Blox Flipper", status = "Ready", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-BloxFlipper/main/BloxFlipper.lua" },
    [6677985923] = { name = "Millonaire Empire Tycoon", status = "Ready", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-Millonaire-Empire-Tycoon/main/Millonaire%20Empire%20Tycoon.lua" },
    [120390407164140] = { name = "+$1 Every Correct Glass", status = "Ready", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB--1-000-Every-Collect-Glass/main/EveryCorrectGlass.lua" }
}

AP6:Loading(function()
    AP6:CheckKey("Ap6S", function()
        AP6:Notify("AUTHENTICATED", "Bienvenido al AP6 Terminator Hub", 2.8)

        local Hub = Instance.new("ScreenGui", AP6.PlayerGui)
        Hub.Name = "AP6UniversalHub"
        Hub.IgnoreGuiInset = true
        Hub.ResetOnSpawn = false

        -- Shadow
        local Shadow = Instance.new("Frame", Hub)
        Shadow.Size = UDim2.new(0, 500, 0, 460)
        Shadow.Position = UDim2.new(0.5, -250, 0.5, -230)
        Shadow.BackgroundColor3 = Color3.new(0,0,0)
        Shadow.BackgroundTransparency = 0.65
        Instance.new("UICorner", Shadow).CornerRadius = UDim.new(0, 20)
        local shadowBlur = Instance.new("UIStroke", Shadow)
        shadowBlur.Color = Color3.new(0,0,0)
        shadowBlur.Thickness = 25
        shadowBlur.Transparency = 0.85

        local Main = Instance.new("Frame", Hub)
        Main.Size = UDim2.new(0, 480, 0, 440)
        Main.Position = UDim2.new(0.5, -240, 0.5, -220)
        Main.BackgroundColor3 = AP6.Theme.Background
        Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 18)
        local mainStroke = Instance.new("UIStroke", Main)
        mainStroke.Color = AP6.Theme.Stroke
        mainStroke.Thickness = 1.5

        -- Topbar
        local Topbar = Instance.new("Frame", Main)
        Topbar.Size = UDim2.new(1, 0, 0, 60)
        Topbar.BackgroundColor3 = AP6.Theme.Topbar
        Instance.new("UICorner", Topbar).CornerRadius = UDim.new(0, 18)
        local title = Instance.new("TextLabel", Topbar)
        title.Size = UDim2.new(1, -20, 1, 0)
        title.Position = UDim2.new(0, 25, 0, 0)
        title.BackgroundTransparency = 1
        title.Text = 'AP6 <font color="#FF002D">TERMINATOR</font>'
        title.RichText = true
        title.Font = Enum.Font.GothamBlack
        title.TextSize = 24
        title.TextColor3 = AP6.Theme.Text
        title.TextXAlignment = Enum.TextXAlignment.Left

        local close = Instance.new("TextButton", Topbar)
        close.Size = UDim2.new(0, 40, 0, 40)
        close.Position = UDim2.new(1, -50, 0.5, -20)
        close.BackgroundTransparency = 1
        close.Text = "✕"
        close.TextColor3 = AP6.Theme.Primary
        close.Font = Enum.Font.GothamBold
        close.TextSize = 28
        close.MouseButton1Click:Connect(function()
            AP6:PlaySound(AP6.Sounds.Click)
            Hub:Destroy()
        end)

        -- Content
        local Content = Instance.new("ScrollingFrame", Main)
        Content.Size = UDim2.new(1, -40, 1, -100)
        Content.Position = UDim2.new(0, 20, 0, 80)
        Content.BackgroundTransparency = 1
        Content.ScrollBarThickness = 6
        Content.ScrollBarImageColor3 = AP6.Theme.Primary
        Content.ScrollBarImageTransparency = 0.3

        local Layout = Instance.new("UIListLayout", Content)
        Layout.Padding = UDim.new(0, 14)
        Layout.SortOrder = Enum.SortOrder.LayoutOrder

        local section = Instance.new("TextLabel", Content)
        section.Size = UDim2.new(1, 0, 0, 40)
        section.BackgroundTransparency = 1
        section.Text = "SUPPORTED GAMES"
        section.TextColor3 = AP6.Theme.Subtext
        section.Font = Enum.Font.GothamBold
        section.TextSize = 15
        section.TextXAlignment = Enum.TextXAlignment.Left

        local currentPlace = game.PlaceId

        for placeId, info in pairs(supportedGames) do
            local btnFrame = Instance.new("Frame", Content)
            btnFrame.Size = UDim2.new(1, 0, 0, 68)
            btnFrame.BackgroundColor3 = AP6.Theme.Element
            Instance.new("UICorner", btnFrame).CornerRadius = UDim.new(0, 14)
            local btnStroke = Instance.new("UIStroke", btnFrame)
            btnStroke.Color = AP6.Theme.Stroke
            btnStroke.Thickness = 1.8

            local accent = Instance.new("Frame", btnFrame)
            accent.Size = UDim2.new(0, 6, 1, 0)
            accent.BackgroundColor3 = (placeId == currentPlace) and AP6.Theme.Primary or AP6.Theme.Secondary
            Instance.new("UICorner", accent).CornerRadius = UDim.new(0, 3)

            local icon = Instance.new("TextLabel", btnFrame)
            icon.Size = UDim2.new(0, 50, 1, 0)
            icon.Position = UDim2.new(0, 20, 0, 0)
            icon.BackgroundTransparency = 1
            icon.Text = (placeId == currentPlace and info.status == "Ready") and AP6.Icons.Ready or AP6.Icons.NotInGame
            icon.TextSize = 36
            icon.Font = Enum.Font.GothamBold

            local name = Instance.new("TextLabel", btnFrame)
            name.Size = UDim2.new(1, -120, 1, 0)
            name.Position = UDim2.new(0, 80, 0, 0)
            name.BackgroundTransparency = 1
            name.Text = info.name
            name.TextColor3 = AP6.Theme.Text
            name.Font = Enum.Font.GothamBold
            name.TextSize = 19
            name.TextXAlignment = Enum.TextXAlignment.Left

            local statusLbl = Instance.new("TextLabel", btnFrame)
            statusLbl.Size = UDim2.new(0, 100, 0, 24)
            statusLbl.Position = UDim2.new(1, -110, 0.5, -12)
            statusLbl.BackgroundTransparency = 1
            statusLbl.Text = info.status
            statusLbl.TextColor3 = (placeId == currentPlace) and AP6.Theme.Primary or AP6.Theme.Subtext
            statusLbl.Font = Enum.Font.Gotham
            statusLbl.TextSize = 14

            -- Hover + Scale
            btnFrame.MouseEnter:Connect(function()
                AP6:PlaySound(AP6.Sounds.Hover)
                TweenService:Create(btnFrame, TweenInfo.new(0.25, Enum.EasingStyle.Exponential), {BackgroundColor3 = AP6.Theme.ElementHover, Size = UDim2.new(1, 4, 0, 72)}):Play()
                TweenService:Create(btnStroke, TweenInfo.new(0.25), {Color = AP6.Theme.Primary, Thickness = 2.5}):Play()
            end)
            btnFrame.MouseLeave:Connect(function()
                TweenService:Create(btnFrame, TweenInfo.new(0.25, Enum.EasingStyle.Exponential), {BackgroundColor3 = AP6.Theme.Element, Size = UDim2.new(1, 0, 0, 68)}):Play()
                TweenService:Create(btnStroke, TweenInfo.new(0.25), {Color = AP6.Theme.Stroke, Thickness = 1.8}):Play()
            end)

            btnFrame.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    AP6:PlaySound(AP6.Sounds.Click)
                    if placeId == currentPlace and info.status == "Ready" then
                        AP6:Notify("INJECTING", info.name, 3)
                        task.wait(1.4)
                        Hub:Destroy()
                        loadstring(game:HttpGet(info.url))()
                    else
                        AP6:Notify("DENIED", "No estás en este juego", 4)
                    end
                end
            end)
        end

        Content.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 60)

        AP6:MakeDraggable(Main)
        AP6:BindToggle(Main)
        AP6:FadeIn(Main, 0.9)
    end, function()
        AP6:Notify("ACCESS DENIED", "Llave inválida. Conexión terminada.", 6)
    end)
end)
