local AP6 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ap6ykx3/AP6Library/refs/heads/main/AP6Library.lua"))()

local GameDatabase = {
    [73904017172892] = {
        name = "Roll In A Cart", 
        url = "https://raw.githubusercontent.com/Ap6ykx3/AP6-HUB/main/Roll%20In%20A%20Cart%20(SIMPLE%20AUTO%20CASH).lua",
        Maintenance = false
    },
    [6677985923] = {
        name = "Millionaire Empire Tycoon", 
        url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-Millonaire-Empire-Tycoon/main/Millonaire%20Empire%20Tycoon.lua",
        onExecute = function()
            AP6:Notify("ENGINE", "Script Inyectado Correctamente!", 5)
        end
    },
    [130850206307448] = {
        name = "Blox Flipper", 
        url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-BloxFlipper/main/BloxFlipper.lua",
        Maintenance = true -- Este saldrá naranja
    }
}

AP6:Init(GameDatabase)
