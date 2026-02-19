local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ap6ykx3/AP6Library/refs/heads/main/AP6Library.lua"))()

local Games = {
    [73904017172892] = {
        name = "Roll In A Cart",
        url = "https://raw.githubusercontent.com/Ap6ykx3/AP6-HUB/main/Roll%20In%20A%20Cart%20(SIMPLE%20AUTO%20CASH).lua"
    },
    [6677985923] = {
        name = "Millionaire Empire Tycoon",
        url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-Millonaire-Empire-Tycoon/main/Millonaire%20Empire%20Tycoon.lua"
    },
    [130850206307448] = {
        name = "Blox Flipper",
        url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-BloxFlipper/main/BloxFlipper.lua"
    }
}

Library:Boot(function()
    local Window = Library:Window("AP6 HUB // UNIVERSAL", "Cyber")
    
    local MainTab = Window:Tab("Games")
    
    for id, data in pairs(Games) do
        local isCurrent = game.PlaceId == id
        local btnText = isCurrent and "▶ EXECUTE: " .. data.name or "🔒 " .. data.name
        
        MainTab:Button(btnText, function()
            if isCurrent then
                Window:Notify("Loading", "Injecting " .. data.name .. "...", "Info", 2)
                loadstring(game:HttpGet(data.url))()
                Window:Notify("Success", data.name .. " loaded!", "Success", 3)
            else
                Window:Notify("Error", "Join the correct game to use this", "Error", 3)
            end
        end)
    end
    
    local SettingsTab = Window:Tab("Settings")
    
    SettingsTab:Button("Rejoin Server", function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
    
    SettingsTab:Button("Copy JobId", function()
        setclipboard(game.JobId)
        Window:Notify("Copied", "JobId copied to clipboard", "Success", 2)
    end)
    
    SettingsTab:Toggle("Blur Effects", true, function(val)
        -- Implementar lógica de blur
    end)
    
    local CreditsTab = Window:Tab("Credits")
    CreditsTab:Label("AP6 HUB Premium v3.0")
    CreditsTab:Label("Developed by AP6 Team")
    CreditsTab:Label("Status: Operational")
end)
