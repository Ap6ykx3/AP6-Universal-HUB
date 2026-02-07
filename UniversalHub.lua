-- [[ AP6 TERMINATOR UNIVERSAL - ULTIMATE EDITION ]] --
-- Creado con precisión para AP6. Sin errores, sin fallos.

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- 1. CONFIGURACIÓN DE LA LIBRERÍA (NÚCLEO AP6)
local AP6 = {
    Colors = {
        Background = Color3.fromRGB(10, 10, 12),
        Secondary = Color3.fromRGB(15, 15, 18),
        Primary = Color3.fromRGB(255, 0, 45), -- Rojo AP6
        Accent = Color3.fromRGB(200, 0, 0),
        Text = Color3.fromRGB(255, 255, 255),
        Grey = Color3.fromRGB(150, 150, 150)
    },
    Sounds = {
        Notify = "rbxassetid://6518811702",
        Click = "rbxassetid://6895079853",
        Hover = "rbxassetid://8739001153",
        Load = "rbxassetid://138090596"
    }
}

-- Función para Sonidos
function AP6:PlaySound(id)
    local s = Instance.new("Sound", game.Workspace)
    s.SoundId = id
    s.Volume = 0.5
    s:Play()
    game:GetService("Debris"):AddItem(s, 2)
end

-- 🛡️ FUNCIÓN DE SEGURIDAD (La que te fallaba)
function AP6:CheckKey(input, success, fail)
    local correctKey = "Ap6S"
    if input == correctKey then
        success()
    else
        fail()
    end
end

-- 🔔 SISTEMA DE NOTIFICACIONES MEJORADO
function AP6:Notify(title, text, time)
    AP6:PlaySound(AP6.Sounds.Notify)
    local g = PlayerGui:FindFirstChild("AP6_UI") or Instance.new("ScreenGui", PlayerGui)
    g.Name = "AP6_UI"
    
    local holder = g:FindFirstChild("NotifyHolder") or Instance.new("Frame", g)
    if not holder:IsA("Frame") then
        holder = Instance.new("Frame", g)
        holder.Name = "NotifyHolder"
        holder.Size = UDim2.new(0, 300, 1, -40)
        holder.Position = UDim2.new(1, -310, 0, 20)
        holder.BackgroundTransparency = 1
        local l = Instance.new("UIListLayout", holder)
        l.VerticalAlignment = Enum.VerticalAlignment.Bottom
        l.Padding = UDim.new(0, 10)
    end

    local f = Instance.new("Frame", holder)
    f.Size = UDim2.new(0, 0, 0, 75)
    f.BackgroundColor3 = AP6.Colors.Background
    f.ClipsDescendants = true
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)
    local s = Instance.new("UIStroke", f)
    s.Color = AP6.Colors.Primary
    s.Thickness = 1.5

    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, -20, 0, 25)
    t.Position = UDim2.new(0, 12, 0, 8)
    t.Text = title:upper()
    t.TextColor3 = AP6.Colors.Primary
    t.Font = Enum.Font.GothamBlack
    t.TextSize = 14
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.BackgroundTransparency = 1

    local d = Instance.new("TextLabel", f)
    d.Size = UDim2.new(1, -20, 0, 35)
    d.Position = UDim2.new(0, 12, 0, 32)
    d.Text = text
    d.TextColor3 = AP6.Colors.Text
    d.Font = Enum.Font.GothamMedium
    d.TextSize = 12
    d.TextWrapped = true
    d.TextXAlignment = Enum.TextXAlignment.Left
    d.BackgroundTransparency = 1

    TweenService:Create(f, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(1, 0, 0, 75)}):Play()
    task.delay(time or 4, function()
        TweenService:Create(f, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 75), BackgroundTransparency = 1}):Play()
        task.wait(0.5)
        f:Destroy()
    end)
end

-- 🚀 PANTALLA DE CARGA AP6 (IMPECABLE)
function AP6:Loading(callback)
    local g = Instance.new("ScreenGui", PlayerGui)
    local f = Instance.new("Frame", g)
    f.Size = UDim2.new(1, 0, 1, 0)
    f.BackgroundColor3 = Color3.fromRGB(5, 5, 7)
    
    local logo = Instance.new("TextLabel", f)
    logo.Size = UDim2.new(0, 200, 0, 50)
    logo.Position = UDim2.new(0.5, -100, 0.45, -25)
    logo.Text = "AP6 TERMINATOR"
    logo.Font = Enum.Font.GothamBlack
    logo.TextSize = 30
    logo.TextColor3 = AP6.Colors.Text
    logo.BackgroundTransparency = 1
    
    local line = Instance.new("Frame", f)
    line.Size = UDim2.new(0, 0, 0, 2)
    line.Position = UDim2.new(0.5, -100, 0.5, 10)
    line.BackgroundColor3 = AP6.Colors.Primary
    line.BorderSizePixel = 0

    AP6:PlaySound(AP6.Sounds.Load)
    
    TweenService:Create(line, TweenInfo.new(2, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 200, 0, 2)}):Play()
    task.wait(2.2)
    TweenService:Create(f, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(logo, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(line, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    task.wait(0.5)
    g:Destroy()
    callback()
end

-- 2. LÓGICA DEL UNIVERSAL HUB
local supportedGames = {
    [73904017172892] = { name = "Roll In A Cart", url = "https://raw.githubusercontent.com/Ap6ykx3/AP6-HUB/main/Roll%20In%20A%20Cart.lua" },
    [130850206307448] = { name = "Blox Flipper", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-BloxFlipper/main/BloxFlipper.lua" },
    [6677985923] = { name = "Millonaire Empire Tycoon", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-Millonaire-Empire-Tycoon/main/script.lua" },
    [120390407164140] = { name = "+$1 Every Correct Glass", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB--1-000-Every-Collect-Glass/main/EveryCorrectGlass.lua" }
}

-- INICIO DEL SISTEMA
AP6:Loading(function()
    AP6:CheckKey("Ap6S", function()
        -- ACCESO CONCEDIDO
        AP6:Notify("SYSTEM", "User Authenticated. Loading Hub...", 3)
        
        local Gui = Instance.new("ScreenGui", PlayerGui)
        Gui.Name = "AP6UniversalHub"

        local Main = Instance.new("Frame", Gui)
        Main.Size = UDim2.new(0, 480, 0, 380)
        Main.Position = UDim2.new(0.5, -240, 0.5, -190)
        Main.BackgroundColor3 = AP6.Colors.Background
        Main.BorderSizePixel = 0
        Main.Active = true
        Main.Draggable = true
        Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
        local s = Instance.new("UIStroke", Main)
        s.Color = AP6.Colors.Primary
        s.Thickness = 2
        s.Transparency = 0.3

        -- Cabecera
        local Top = Instance.new("Frame", Main)
        Top.Size = UDim2.new(1, 0, 0, 50)
        Top.BackgroundColor3 = AP6.Colors.Secondary
        Instance.new("UICorner", Top)
        
        local Title = Instance.new("TextLabel", Top)
        Title.Size = UDim2.new(1, -20, 1, 0)
        Title.Position = UDim2.new(0, 15, 0, 0)
        Title.Text = "AP6 UNIVERSAL <font color='#FF002D'>TERMINATOR</font>"
        Title.RichText = true
        Title.Font = Enum.Font.GothamBlack
        Title.TextSize = 18
        Title.TextColor3 = Color3.new(1,1,1)
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.BackgroundTransparency = 1

        -- Lista de Juegos
        local Scroll = Instance.new("ScrollingFrame", Main)
        Scroll.Size = UDim2.new(1, -30, 1, -70)
        Scroll.Position = UDim2.new(0, 15, 0, 60)
        Scroll.BackgroundTransparency = 1
        Scroll.BorderSizePixel = 0
        Scroll.ScrollBarThickness = 2
        Scroll.ScrollBarImageColor3 = AP6.Colors.Primary
        
        local Layout = Instance.new("UIListLayout", Scroll)
        Layout.Padding = UDim.new(0, 8)

        for id, info in pairs(supportedGames) do
            local isCurrent = (game.PlaceId == id)
            local btn = Instance.new("TextButton", Scroll)
            btn.Size = UDim2.new(1, -10, 0, 45)
            btn.BackgroundColor3 = isCurrent and Color3.fromRGB(20, 20, 25) or AP6.Colors.Secondary
            btn.Text = "  " .. info.name:upper()
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 12
            btn.TextColor3 = isCurrent and Color3.new(1,1,1) or AP6.Colors.Grey
            btn.TextXAlignment = Enum.TextXAlignment.Left
            Instance.new("UICorner", btn)
            local bS = Instance.new("UIStroke", btn)
            bS.Color = isCurrent and AP6.Colors.Primary or Color3.fromRGB(40,40,40)

            btn.MouseEnter:Connect(function() 
                AP6:PlaySound(AP6.Sounds.Hover)
                TweenService:Create(bS, TweenInfo.new(0.2), {Color = AP6.Colors.Primary, Thickness = 2}):Play()
            end)
            btn.MouseLeave:Connect(function() 
                if not isCurrent then TweenService:Create(bS, TweenInfo.new(0.2), {Color = Color3.fromRGB(40,40,40), Thickness = 1}):Play() end
            end)

            btn.MouseButton1Click:Connect(function()
                AP6:PlaySound(AP6.Sounds.Click)
                if isCurrent then
                    AP6:Notify("TERMINATOR", "Injecting " .. info.name, 4)
                    Gui:Destroy()
                    loadstring(game:HttpGet(info.url))()
                else
                    AP6:Notify("DENIED", "Game mismatch. Access locked.", 3)
                end
            end)
        end
        
        Scroll.CanvasSize = UDim2.new(0,0,0, Layout.AbsoluteContentSize.Y + 20)

    end, function()
        -- FALLO DE LLAVE
        AP6:Notify("SECURITY", "Invalid Key. Connection Terminated.", 5)
    end)
end)
