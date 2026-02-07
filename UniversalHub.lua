local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local supportedGames = {
    [73904017172892] = {
        name = "Roll In A Cart",
        status = "Ready",
        url = "https://raw.githubusercontent.com/Ap6ykx3/AP6-HUB/main/Roll%20In%20A%20Cart%20(SIMPLE%20AUTO%20CASH).lua"
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
