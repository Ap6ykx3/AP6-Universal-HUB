local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ap6ykx3/AP6Library/refs/heads/main/AP6Library.lua"))()

local Database = {
    [73904017172892] = {
        name = "Roll In A Cart", 
        url = "https://raw.githubusercontent.com/Ap6ykx3/AP6-HUB/main/Roll%20In%20A%20Cart%20(SIMPLE%20AUTO%20CASH).lua"
    },
    [6677985923] = {
        name = "Millionaire Empire Tycoon", 
        url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-Millonaire-Empire-Tycoon/main/Millonaire%20Empire%20Tycoon.lua",
        onExecute = function()
            Library:Notify("SYSTEM", "Universal OS Injection Ready.", "Info", 3)
        end
    },
    [130850206307448] = {
        name = "Blox Flipper", 
        url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-BloxFlipper/main/BloxFlipper.lua",
        Maintenance = false
    }
}

Library:Boot(function()
    local Window = Library:Window("AP6 HUB // UNIVERSAL", "Cyber", Enum.KeyCode.RightControl)
    local Tab = Window:Tab("Game Selection")

    for id, data in pairs(Database) do
        local isCurrentGame = (game.PlaceId == id)
        local buttonText = isCurrentGame and ">> EXECUTE: " .. data.name or data.name .. " [NOT DETECTED]"

        Tab:Button(buttonText, function()
            if isCurrentGame then
                if data.url then 
                    loadstring(game:HttpGet(data.url))() 
                end
                
                if data.onExecute then 
                    data.onExecute() 
                end
                
                Library:Notify("SUCCESS", "Module injected: " .. data.name, "Success", 3)
            else
                Library:Notify("ACCESS DENIED", "Please join the correct game.", "Error", 3)
            end
        end)
    end

    local Settings = Window:Tab("Settings")
    Settings:Button("Destroy UI", function()
        for _, gui in pairs(game.CoreGui:GetChildren()) do
            if gui.Name:find("AP6") then
                gui:Destroy()
            end
        end
    end)
end)
