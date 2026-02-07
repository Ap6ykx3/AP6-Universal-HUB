local AP6Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ap6ykx3/AP6Library/refs/heads/main/AP6Library.lua"))()
local TweenService = game:GetService("TweenService")

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
    
    
    if PlayerGui:FindFirstChild("AP6UniversalHub") then 
        PlayerGui.AP6UniversalHub:Destroy() 
    end

    local Gui = Instance.new("ScreenGui", PlayerGui)
    Gui.Name = "AP6UniversalHub"
    Gui.ResetOnSpawn = false

    
    local Main = Instance.new("Frame", Gui)
    Main.Size = UDim2.new(0, 480, 0, 420)
    Main.Position = UDim2.new(0.5, -240, 0.5, -210)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true
    
    local MainCorner = Instance.new("UICorner", Main)
    MainCorner.CornerRadius = UDim.new(0, 10)
    
    local MainStroke = Instance.new("UIStroke", Main)
    MainStroke.Color = Color3.fromRGB(255, 0, 45)
    MainStroke.Thickness = 1.5
    MainStroke.Transparency = 0.4

    
    local Top = Instance.new("Frame", Main)
    Top.Size = UDim2.new(1, 0, 0, 50)
    Top.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    Top.BorderSizePixel = 0
    Instance.new("UICorner", Top).CornerRadius = UDim.new(0, 10)

    local Title = Instance.new("TextLabel", Top)
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "AP6 UNIVERSAL HUB <font color='#FF002D'>[PRO]</font>"
    Title.RichText = true
    Title.Font = Enum.Font.GothamBlack
    Title.TextSize = 18
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.TextXAlignment = Enum.TextXAlignment.Left

    
    local Close = Instance.new("TextButton", Top)
    Close.Size = UDim2.new(0, 32, 0, 32)
    Close.Position = UDim2.new(1, -42, 0.5, -16)
    Close.Text = "×"
    Close.Font = Enum.Font.GothamBold
    Close.TextSize = 24
    Close.TextColor3 = Color3.new(1, 1, 1)
    Close.BackgroundColor3 = Color3.fromRGB(255, 0, 45)
    Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 6)

    
    local Scroll = Instance.new("ScrollingFrame", Main)
    Scroll.Position = UDim2.new(0, 15, 0, 65)
    Scroll.Size = UDim2.new(1, -30, 1, -85)
    Scroll.BackgroundTransparency = 1
    Scroll.BorderSizePixel = 0
    Scroll.ScrollBarThickness = 3
    Scroll.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 45)
    Scroll.CanvasSize = UDim2.new(0, 0, 0, 0) 

    local UIList = Instance.new("UIListLayout", Scroll)
    UIList.Padding = UDim.new(0, 10)
    UIList.SortOrder = Enum.SortOrder.LayoutOrder

    
    for id, info in pairs(supportedGames) do
        local isCurrent = (id == currentGame)
        
        local btn = Instance.new("TextButton", Scroll)
        btn.Size = UDim2.new(1, -8, 0, 45)
        btn.BackgroundColor3 = isCurrent and Color3.fromRGB(20, 20, 25) or Color3.fromRGB(15, 15, 18)
        btn.Text = ""
        btn.AutoButtonColor = false
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
        
        local bStroke = Instance.new("UIStroke", btn)
        bStroke.Color = isCurrent and Color3.fromRGB(255, 0, 45) or Color3.fromRGB(40, 40, 45)
        bStroke.Thickness = 1

        local bLabel = Instance.new("TextLabel", btn)
        bLabel.Size = UDim2.new(1, -20, 1, 0)
        bLabel.Position = UDim2.new(0, 15, 0, 0)
        bLabel.Text = info.name:upper()
        bLabel.Font = Enum.Font.GothamBold
        bLabel.TextSize = 13
        bLabel.TextColor3 = isCurrent and Color3.new(1,1,1) or Color3.fromRGB(150, 150, 150)
        bLabel.TextXAlignment = Enum.TextXAlignment.Left
        bLabel.BackgroundTransparency = 1

        local statusTag = Instance.new("TextLabel", btn)
        statusTag.Size = UDim2.new(0, 80, 0, 22)
        statusTag.Position = UDim2.new(1, -90, 0.5, -11)
        statusTag.BackgroundColor3 = info.status == "Ready" and Color3.fromRGB(0, 180, 80) or Color3.fromRGB(180, 0, 40)
        statusTag.Text = info.status:upper()
        statusTag.Font = Enum.Font.GothamBold
        statusTag.TextSize = 10
        statusTag.TextColor3 = Color3.new(1,1,1)
        Instance.new("UICorner", statusTag).CornerRadius = UDim.new(0, 4)

        
        btn.MouseEnter:Connect(function()
            TweenService:Create(bStroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(255, 0, 45), Thickness = 1.5}):Play()
            TweenService:Create(bLabel, TweenInfo.new(0.3), {TextColor3 = Color3.new(1,1,1)}):Play()
        end)
        btn.MouseLeave:Connect(function()
            if not isCurrent then
                TweenService:Create(bStroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(40, 40, 45), Thickness = 1}):Play()
                TweenService:Create(bLabel, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
            end
        end)

        
        btn.MouseButton1Click:Connect(function()
            if isCurrent then
                AP6Lib:Notify("SYSTEM", "Injecting script for " .. info.name, 3)
                Gui:Destroy()
                loadstring(game:HttpGet(info.url))()
            else
                AP6Lib:Notify("ACCESS DENIED", "This script is for another game world.", 4)
            end
        end)
        
        Scroll.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y + 20)
    end

    
    Close.MouseButton1Click:Connect(function()
        AP6Lib:Confirm("SYSTEM EXIT", "Are you sure you want to terminate the Hub?", function()
            TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 480, 0, 0),
                BackgroundTransparency = 1
            }):Play()
            task.wait(0.4)
            Gui:Destroy()
        end)
    end)

    AP6Lib:Notify("HUB LOADED", "Welcome back, AP6. All systems online.", 5)

end, function()
    AP6Lib:Notify("SECURITY ERROR", "Unauthorized key detected. Access blocked.", 5)
end)
