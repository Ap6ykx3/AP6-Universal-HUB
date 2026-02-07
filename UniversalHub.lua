local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local supportedGames = {
    [73904017172892] = {
        name = "Roll In A Cart",
        status = "Ready",
        url = "https://raw.githubusercontent.com/Ap6ykx3/AP6-HUB/main/RollInACart.lua"
    },
    [222222222] = {name = "AnotherGame", status = "Developing.."},
    [333333333] = {name = "CoolAdventure", status = "Developing.."},
    [444444444] = {name = "EpicQuest", status = "Developing.."},
    [555555555] = {name = "BattleArena", status = "Developing.."},
    [666666666] = {name = "MysticWorld", status = "Developing.."},
    [777777777] = {name = "SkyLegends", status = "Developing.."},
    [888888888] = {name = "DungeonRun", status = "Developing.."},
    [999999999] = {name = "SurvivalIsland", status = "Developing.."},
    [123123123] = {name = "GalaxyRaiders", status = "Developing.."},
    [234234234] = {name = "ZombieEscape", status = "Developing.."},
    [345345345] = {name = "TowerDefenseX", status = "Developing.."},
    [456456456] = {name = "SpeedRace", status = "Developing.."},
    [567567567] = {name = "PirateWars", status = "Developing.."},
    [678678678] = {name = "RoyalBattle", status = "Developing.."}
}

local currentGame = game.PlaceId
local gameInfo = supportedGames[currentGame]

local Window = Rayfield:CreateWindow({
    Name = "AP6 Universal Hub",
    LoadingTitle = "AP6 Loader",
    LoadingSubtitle = "Game detection system"
})

local GamesTab = Window:CreateTab("Games")

if gameInfo then
    local Section = GamesTab:CreateSection("Game detected: " .. gameInfo.name .. " (ID: " .. currentGame .. ")")
    Section:CreateButton({
        Name = "Load " .. gameInfo.name .. " Script",
        Callback = function()
            if gameInfo.status == "Ready" and gameInfo.url then
                loadstring(game:HttpGet(gameInfo.url))()
            else
                Rayfield:Notify({
                    Title = "AP6 Universal Hub",
                    Content = gameInfo.name .. " is currently " .. gameInfo.status,
                    Duration = 5
                })
            end
        end
    })
else
    Rayfield:Notify({
        Title = "AP6 Universal Hub",
        Content = "Game not detected",
        Duration = 5
    })
end
