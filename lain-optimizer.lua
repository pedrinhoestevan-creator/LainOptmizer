-- ==============================================
-- 🌙 LAIN OPTIMIZER — Otimizador de Desempenho
-- ==============================================
-- ⚡ Aumenta FPS reduzindo gráficos e efeitos visuais
-- 📱 Ideal para celulares e PCs fracos

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local GuiService = game:GetService("GuiService")

-- ==============================================
-- 🎛️ CONFIGURAÇÕES
-- ==============================================
local Settings = {
    UltraLowGraphics = false,
    TextureReducer = false,
    GrassRemover = false,
    SkyOptimizer = false,
    ShadowRemover = false,
    ParticleRemover = false,
    EffectsRemover = false,
    WaterOptimizer = false,
    LightingOptimizer = false,
    MaterialOptimizer = false,
    ReflectionRemover = false,
    DecalRemover = false,
}

local Original = {}

-- ==============================================
-- 🖥️ INTERFACE DO MENU
-- ==============================================
local Gui = Instance.new("ScreenGui")
Gui.Name = "LAIN_OPTIMIZER"
Gui.Parent = game:GetService("CoreGui")
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MenuFrame = Instance.new("Frame")
MenuFrame.Size = UDim2.new(0, 340, 0, 560)
MenuFrame.Position = UDim2.new(0.02, 0, 0.05, 0)
MenuFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MenuFrame.Active = true
MenuFrame.Draggable = true
MenuFrame.Parent = Gui
Instance.new("UICorner", MenuFrame).CornerRadius = UDim.new(0, 14)
Instance.new("UIStroke", MenuFrame).Color = Color3.fromRGB(100, 140, 255)

-- Título
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
TitleBar.Parent = MenuFrame
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 14)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "🌙 LAIN OPTIMIZER"
Title.TextColor3 = Color3.fromRGB(180, 200, 255)
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -38, 0, 10)
MinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
MinBtn.Text = "_"
MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 14
MinBtn.Parent = TitleBar
Instance.new("UICorner", MinBtn)

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, -20, 1, -65)
ScrollFrame.Position = UDim2.new(0, 10, 0, 55)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 4
ScrollFrame.ScrollBarColor3 = Color3.fromRGB(80, 100, 160)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 780)
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollFrame.Parent = MenuFrame

local ButtonContainer = Instance.new("Frame")
ButtonContainer.Size = UDim2.new(1, 0, 0, 780)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = ScrollFrame
local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 10)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.Parent = ButtonContainer

-- Botão Abrir/Fechar Menu
local OpenBtn = Instance.new("TextButton")
OpenBtn.Size = UDim2.new(0, 60, 0, 60)
OpenBtn.Position = UDim2.new(0, 10, 0, 10)
OpenBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
OpenBtn.Text = "LAIN"
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextColor3 = Color3.new(1, 1, 1)
OpenBtn.TextSize = 13
OpenBtn.Parent = Gui
Instance.new("UICorner", OpenBtn)

MenuFrame.Visible = false
MinBtn.MouseButton1Click:Connect(function() MenuFrame.Visible = false; OpenBtn.Visible = true end)
OpenBtn.MouseButton1Click:Connect(function() MenuFrame.Visible = true; OpenBtn.Visible = false end)

-- ==============================================
-- 🔧 FUNÇÕES DE OTIMIZAÇÃO
-- ==============================================
local Optimizers = {}

function Optimizers.UltraLowGraphics(enable)
    if enable then
        Original.RenderStepping = Workspace.RenderStepping
        Original.Resolution = GuiService.ResolutionScale
        Workspace.RenderStepping = Enum.RenderStepping.Fixed
        GuiService.ResolutionScale = 0.6
    else
        if Original.RenderStepping then Workspace.RenderStepping = Original.RenderStepping end
        if Original.Resolution then GuiService.ResolutionScale = Original.Resolution end
    end
end

function Optimizers.TextureReducer(enable)
    if enable then
        Original.TextureQuality = settings():GetFFlag("TextureQuality")
    end
end

function Optimizers.GrassRemover(enable)
    for _, v in ipairs(Workspace:GetDescendants()) do
        local n = v.Name:lower()
        if n:find("grass") or n:find("grama") or n:find("foliage") or n:find("bush") then
            if v:IsA("BasePart") then
                if enable then v:SetAttribute("_trans", v.Transparency); v.Transparency = 1
                else v.Transparency = v:GetAttribute("_trans") or 0 end
            elseif v:IsA("ParticleEmitter") then
                if enable then v:SetAttribute("_en", v.Enabled); v.Enabled = false
                else v.Enabled = v:GetAttribute("_en") or true end
            end
        end
    end
end

function Optimizers.SkyOptimizer(enable)
    if enable then
        Original.Sky = Lighting.Sky
        Original.Ambient = Lighting.Ambient
        Lighting.Sky = nil
        Lighting.Ambient = Color3.fromRGB(140, 140, 150)
    else
        Lighting.Sky = Original.Sky
        Lighting.Ambient = Original.Ambient
    end
end

function Optimizers.ShadowRemover(enable)
    if enable then
        Original.GlobalShadows = Workspace.GlobalShadows
        Original.ShadowQuality = Lighting.ShadowQuality
        Workspace.GlobalShadows = false
        Lighting.ShadowQuality = Enum.ShadowQuality.Off
    else
        Workspace.GlobalShadows = Original.GlobalShadows
        Lighting.ShadowQuality = Original.ShadowQuality
    end
end

function Optimizers.ParticleRemover(enable)
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("SmokeEmitter") then
            if enable then v:SetAttribute("_en", v.Enabled); v.Enabled = false
            else v.Enabled = v:GetAttribute("_en") or true end
        end
    end
end

function Optimizers.EffectsRemover(enable)
    if enable then
        Original.Brightness = Lighting.Brightness
        Original.ColorShiftTop = Lighting.ColorShiftTop
        Original.ColorShiftBottom = Lighting.ColorShiftBottom
        Lighting.Brightness = 1
        Lighting.ColorShiftTop = Color3.fromRGB(200, 200, 200)
        Lighting.ColorShiftBottom = Color3.fromRGB(180, 180, 180)
    else
        Lighting.Brightness = Original.Brightness or 2
        Lighting.ColorShiftTop = Original.ColorShiftTop or Color3.fromRGB(200, 220, 255)
        Lighting.ColorShiftBottom = Original.ColorShiftBottom or Color3.fromRGB(180, 200, 230)
    end
end

function Optimizers.WaterOptimizer(enable)
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") and (v.Name:lower():find("water") or v.Name:lower():find("água")) then
            if enable then
                v:SetAttribute("_mat", v.Material.Name)
                v.Material = Enum.Material.SmoothPlastic
                v.CastShadow = false
                v.Reflectance = 0
            else
                local m = v:GetAttribute("_mat")
                if m then v.Material = Enum.Material[m] end
            end
        end
    end
end

function Optimizers.LightingOptimizer(enable)
    if enable then
        Original.EnvSpec = Lighting.EnvironmentSpecularScale
        Original.EnvDiff = Lighting.EnvironmentDiffuseScale
        Original.GlobalShadows2 = Lighting.GlobalShadows
        Lighting.EnvironmentSpecularScale = 0
        Lighting.EnvironmentDiffuseScale = 0.5
        Lighting.GlobalShadows = false
    else
        Lighting.EnvironmentSpecularScale = Original.EnvSpec or 0.3
        Lighting.EnvironmentDiffuseScale = Original.EnvDiff or 1
        Lighting.GlobalShadows = Original.GlobalShadows2 or true
    end
end

function Optimizers.MaterialOptimizer(enable)
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            if enable then
                v:SetAttribute("_mat", v.Material.Name)
                v.Material = Enum.Material.SmoothPlastic
            else
                local m = v:GetAttribute("_mat")
                if m then v.Material = Enum.Material[m] end
            end
        end
    end
end

function Optimizers.ReflectionRemover(enable)
    if enable then
        Original.ReflectionQuality = Lighting.ReflectionQuality
        Lighting.ReflectionQuality = Enum.ReflectionQuality.Off
    else
        Lighting.ReflectionQuality = Original.ReflectionQuality or Enum.ReflectionQuality.Medium
    end
end

function Optimizers.DecalRemover(enable)
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("Decal") or v:IsA("Texture") then
            if enable then
                v:SetAttribute("_trans", v.Transparency)
                v.Transparency = 1
            else
                v.Transparency = v:GetAttribute("_trans") or 0
            end
        end
    end
end

-- ==============================================
-- 📋 CRIAR BOTÕES DO MENU
-- ==============================================
local Options = {
    {"UltraLowGraphics", "Ultra Low Graphics", "Simplifica gráficos"},
    {"TextureReducer", "Texture Reducer", "Simplifica texturas"},
    {"GrassRemover", "Grass Remover", "Remove grama e vegetação"},
    {"SkyOptimizer", "Sky Optimizer", "Simplifica o céu"},
    {"ShadowRemover", "Shadow Remover", "Desativa sombras"},
    {"ParticleRemover", "Particle Remover", "Remove partículas"},
    {"EffectsRemover", "Effects Remover", "Reduz efeitos visuais"},
    {"WaterOptimizer", "Water Optimizer", "Simplifica a água"},
    {"LightingOptimizer", "Lighting Optimizer", "Otimiza iluminação"},
    {"MaterialOptimizer", "Material Optimizer", "Simplifica materiais"},
    {"ReflectionRemover", "Reflection Remover", "Remove reflexos"},
    {"DecalRemover", "Decal Remover", "Oculta decais"},
}

local Buttons = {}

for _, info in ipairs(Options) do
    local Key, Name, Desc = info[1], info[2], info[3]
    
    local Bg = Instance.new("Frame")
    Bg.Size = UDim2.new(0, 300, 0, 55)
    Bg.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    Bg.Parent = ButtonContainer
    Instance.new("UICorner", Bg).CornerRadius = UDim.new(0, 10)

    local LblName = Instance.new("TextLabel")
    LblName.Size = UDim2.new(0.7, 0, 0, 20)
    LblName.Position = UDim2.new(0, 12, 0, 6)
    LblName.BackgroundTransparency = 1
    LblName.Font = Enum.Font.GothamBold
    LblName.Text = Name
    LblName.TextColor3 = Color3.fromRGB(220, 220, 240)
    LblName.TextSize = 14
    LblName.TextXAlignment = Enum.TextXAlignment.Left
    LblName.Parent = Bg

    local LblDesc = Instance.new("TextLabel")
    LblDesc.Size = UDim2.new(0.7, 0, 0, 16)
    LblDesc.Position = UDim2.new(0, 12, 0, 34)
    LblDesc.BackgroundTransparency = 1
    LblDesc.Font = Enum.Font.Gotham
    LblDesc.Text = Desc
    LblDesc.TextColor3 = Color3.fromRGB(140, 140, 160)
    LblDesc.TextSize = 11
    LblDesc.TextXAlignment = Enum.TextXAlignment.Left
    LblDesc.Parent = Bg

    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.new(0, 75, 0, 32)
    Toggle.Position = UDim2.new(1, -87, 0.5, -16)
    Toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 85)
    Toggle.Font = Enum.Font.GothamBold
    Toggle.Text = "DESLIGADO"
    Toggle.TextColor3 = Color3.fromRGB(180, 180, 200)
    Toggle.TextSize = 11
    Toggle.Parent = Bg
    Instance.new("UICorner", Toggle)

    Buttons[Key] = Toggle

    Toggle.MouseButton1Click:Connect(function()
        Settings[Key] = not Settings[Key]
        local On = Settings[Key]
        Toggle.Text = On and "✅ LIGADO" or "❌ DESLIGADO"
        Toggle.BackgroundColor3 = On and Color3.fromRGB(60, 120, 255) or Color3.fromRGB(60, 60, 85)
        Toggle.TextColor3 = On and Color3.new(1, 1, 1) or Color3.fromRGB(180, 180, 200)
        if Optimizers[Key] then Optimizers[Key](On) end
    end)
end

-- Botões Gerais
local AllOn = Instance.new("TextButton")
AllOn.Size = UDim2.new(0, 300, 0, 45)
AllOn.BackgroundColor3 = Color3.fromRGB(50, 100, 220)
AllOn.Font = Enum.Font.GothamBold
AllOn.Text = "⚡ LIGAR TUDO"
AllOn.TextColor3 = Color3.new(1, 1, 1)
AllOn.TextSize = 15
AllOn.Parent = ButtonContainer
Instance.new("UICorner", AllOn)

local AllOff = Instance.new("TextButton")
AllOff.Size = UDim2.new(0, 300, 0, 45)
AllOff.BackgroundColor3 = Color3.fromRGB(90, 40, 40)
AllOff.Font = Enum.Font.GothamBold
AllOff.Text = "🔄 RESTAURAR TUDO"
AllOff.TextColor3 = Color3.new(1, 1, 1)
AllOff.TextSize = 15
AllOff.Parent = ButtonContainer
Instance.new("UICorner", AllOff)

AllOn.MouseButton1Click:Connect(function()
    for key, fnc in pairs(Optimizers) do
        Settings[key] = true
        if Buttons[key] then
            Buttons[key].Text = "✅ LIGADO"
            Buttons[key].BackgroundColor3 = Color3.fromRGB(60, 120, 255)
            Buttons[key].TextColor3 = Color3.new(1, 1, 1)
        end
        fnc(true)
    end
end)

AllOff.MouseButton1Click:Connect(function()
    for key, fnc in pairs(Optimizers) do
        Settings[key] = false
        if Buttons[key] then
            Buttons[key].Text = "❌ DESLIGADO"
            Buttons[key].BackgroundColor3 = Color3.fromRGB(60, 60, 85)
            Buttons[key].TextColor3 = Color3.fromRGB(180, 180, 200)
        end
        fnc(false)
    end
end)

-- Atualização contínua para objetos novos
RunService.Heartbeat:Connect(function()
    if Settings.GrassRemover then Optimizers.GrassRemover(true) end
    if Settings.ParticleRemover then Optimizers.ParticleRemover(true) end
    if Settings.DecalRemover then Optimizers.DecalRemover(true) end
    if Settings.MaterialOptimizer then Optimizers.MaterialOptimizer(true) end
end)

print("🌙 LAIN OPTIMIZER CARREGADO! Clique em LAIN para abrir o menu.")
