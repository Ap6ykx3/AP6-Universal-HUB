-- EJECUTA ESTE SCRIPT (el único que corres)
local AP6 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ap6ykx3/AP6Library/refs/heads/main/AP6Library.lua"))()

local supportedGames = {
    [73904017172892] = {name = "Roll In A Cart", url = "https://raw.githubusercontent.com/Ap6ykx3/AP6-HUB/main/Roll%20In%20A%20Cart%20(SIMPLE%20AUTO%20CASH).lua"},
    [130850206307448] = {name = "Blox Flipper", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-BloxFlipper/main/BloxFlipper.lua"},
    [6677985923] = {name = "Millonaire Empire Tycoon", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-Millonaire-Empire-Tycoon/main/Millonaire%20Empire%20Tycoon.lua"},
    [120390407164140] = {name = "+$1 Every Correct Glass", url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB--1-000-Every-Collect-Glass/main/EveryCorrectGlass.lua"}
}

AP6:Init(supportedGames)
