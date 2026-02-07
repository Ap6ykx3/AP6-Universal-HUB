-- [ 1. CARGAR LA LIBRERÍA NUEVA ]
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ap6ykx3/AP6Library/refs/heads/main/AP6Library.lua"))()

-- [ 2. TU BASE DE DATOS (NO CAMBIA) ]
local Database = {
    [73904017172892] = {
        name = "Roll In A Cart", 
        url = "https://raw.githubusercontent.com/Ap6ykx3/AP6-HUB/main/Roll%20In%20A%20Cart%20(SIMPLE%20AUTO%20CASH).lua"
    },
    [6677985923] = {
        name = "Millionaire Empire Tycoon", 
        url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-Millonaire-Empire-Tycoon/main/Millonaire%20Empire%20Tycoon.lua",
        onExecute = function()
            -- Usamos la nueva función de notificación de la librería
            Library:Notification("SYSTEM", "Universal OS Injection Ready.")
        end
    },
    [130850206307448] = {
        name = "Blox Flipper", 
        url = "https://raw.githubusercontent.com/Ap6ykx3/APHUB-BloxFlipper/main/BloxFlipper.lua",
        Maintenance = false
    }
}

-- [ 3. CONSTRUCCIÓN AUTOMÁTICA DE LA INTERFAZ ]
-- Creamos la ventana principal
local Window = Library:Window("AP6 HUB // UNIVERSAL", Color3.fromRGB(0, 255, 255), Enum.KeyCode.RightControl)

-- Creamos la pestaña de juegos
local Tab = Window:Tab("Lista de Juegos")

-- [ 4. BUCLE INTELIGENTE ]
-- Esto recorre tu base de datos y crea los botones automáticamente
for id, data in pairs(Database) do
    local isCurrentGame = (game.PlaceId == id)
    local buttonText = data.name
    
    -- Cambia el texto si es el juego actual
    if isCurrentGame then
        buttonText = ">> EJECUTAR: " .. data.name
    else
        buttonText = data.name .. " [NO DETECTADO]"
    end

    Tab:Button(buttonText, function()
        if isCurrentGame then
            -- Si es el juego correcto, ejecuta el script
            if data.url then 
                loadstring(game:HttpGet(data.url))() 
            end
            
            -- Si tiene funciones extra (onExecute), las corre
            if data.onExecute then 
                data.onExecute() 
            end
            
            Library:Notification("EXITOSO", "Script inyectado para: " .. data.name)
        else
            -- Si no es el juego correcto, avisa
            Library:Notification("ERROR", "No estás dentro de este juego.")
        end
    end)
end

-- [ OPCIONAL ] Botón para cerrar la UI completamente
local Settings = Window:Tab("Ajustes")
Settings:Button("Destruir UI", function()
    game.CoreGui:FindFirstChild("AP6_UI"):Destroy()
end)
