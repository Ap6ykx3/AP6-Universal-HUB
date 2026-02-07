local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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
    },
    [222222222] = {name = "???", status = "Developing.."},
    [333333333] = {name = "???", status = "Developing.."},
    [444444444] = {name = "???", status = "Developing.."},
    [555555555] = {name = "???", status = "Developing.."},
    [666666666] = {name = "???", status = "Developing.."},
    [777777777] = {name = "???", status = "Developing.."},
    [888888888] = {name = "???", status = "Developing.."},
    [999999999] = {name = "???", status = "Developing.."},
    [123123123] = {name = "???", status = "Developing.."},
    [234234234] = {name = "???", status = "Developing.."},
    [345345345] = {name = "???", status = "Developing.."},
    [456456456] = {name = "???", status = "Developing.."},
    [567567567] = {name = "???", status = "Developing.."},
    [678678678] = {name = "???", status = "Developing.."}
}

local currentGame = game.PlaceId

local Window = Rayfield:CreateWindow({
    Name = "AP6 Universal Hub",
    LoadingTitle = "AP6 Loader",
    LoadingSubtitle = "Game detection system"
})

local GamesTab = Window:CreateTab("Games")

for id, info in pairs(supportedGames) do
    local statusIcon = "🔘"
    local displayName = info.name .. " - " .. info.status

    if id == currentGame then
        statusIcon = "🟢"
        displayName = info.name .. " - Detected"
    end

    GamesTab:CreateButton({
        Name = statusIcon .. " " .. displayName,
        Callback = function()
            if id == currentGame and info.status == "Ready" and info.url then
                Rayfield:Destroy()
                loadstring(game:HttpGet(info.url))()
            else
                Rayfield:Notify({
                    Title = "AP6 Universal Hub",
                    Content = info.name .. " is currently " .. info.status,
                    Duration = 5
                })
            end
        end
    })
end

if not supportedGames[currentGame] then
    Rayfield:Notify({
        Title = "AP6 Universal Hub",
        Content = "Game not detected",
        Duration = 5
    })
end

local CreditsTab = Window:CreateTab("Credits")
CreditsTab:CreateSection("Developed by Ap6ykx3")
