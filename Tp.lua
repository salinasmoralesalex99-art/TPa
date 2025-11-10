-- Variables
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local savedPosition = nil

-- Crear GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PositionGUI"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Frame principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 150)
frame.Position = UDim2.new(0.4, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true
frame.Draggable = true  -- Hace el frame movible
frame.Parent = screenGui

-- Botón para guardar posición
local guardarBtn = Instance.new("TextButton")
guardarBtn.Size = UDim2.new(0, 200, 0, 50)
guardarBtn.Position = UDim2.new(0.5, -100, 0.2, 0)
guardarBtn.Text = "📌 Guardar Posición"
guardarBtn.TextScaled = true
guardarBtn.Parent = frame

guardarBtn.MouseButton1Click:Connect(function()
    savedPosition = player.Character.HumanoidRootPart.Position
    guardarBtn.Text = "✅ Posición Guardada"
end)

-- Botón para ir a la posición
local irBtn = Instance.new("TextButton")
irBtn.Size = UDim2.new(0, 200, 0, 50)
irBtn.Position = UDim2.new(0.5, -100, 0.6, 0)
irBtn.Text = "🚀 Ir a Posición"
irBtn.TextScaled = true
irBtn.Parent = frame

irBtn.MouseButton1Click:Connect(function()
    if savedPosition then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(savedPosition)
        irBtn.Text = "🏁 Llegado!"
    else
        irBtn.Text = "⚠️ Guarda Primero"
    end
end)
