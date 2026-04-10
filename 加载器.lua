-- 高级加载器弹窗（5秒流畅动画进度条）
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AdvancedLoader"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 背景遮罩
local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 1
overlay.Parent = gui

-- 弹窗容器（1:1 正方形，400x400）
local popup = Instance.new("Frame")
popup.Size = UDim2.new(0, 400, 0, 400)
popup.Position = UDim2.new(0.5, -200, -0.3, 0)
popup.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
popup.BackgroundTransparency = 0.1
popup.BorderSizePixel = 0
popup.ClipsDescendants = true
popup.Parent = gui

-- 弹窗圆角
local popupCorner = Instance.new("UICorner")
popupCorner.CornerRadius = UDim.new(0, 24)
popupCorner.Parent = popup

-- 边框光效
local popupStroke = Instance.new("UIStroke")
popupStroke.Thickness = 1.5
popupStroke.Color = Color3.fromRGB(100, 100, 150)
popupStroke.Transparency = 0.5
popupStroke.Parent = popup

-- 顶部渐变条（紫色渐变）
local gradientBar = Instance.new("Frame")
gradientBar.Size = UDim2.new(1, 0, 0, 6)
gradientBar.Position = UDim2.new(0, 0, 0, 0)
gradientBar.BackgroundColor3 = Color3.fromRGB(156, 39, 176)
gradientBar.BorderSizePixel = 0
gradientBar.Parent = popup

local gradientCorner = Instance.new("UICorner")
gradientCorner.CornerRadius = UDim.new(0, 24)
gradientCorner.Parent = gradientBar

-- 关闭按钮（X 带颜色）
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 34, 0, 34)
closeBtn.Position = UDim2.new(1, -44, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
closeBtn.BackgroundTransparency = 0.5
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 0
closeBtn.Parent = popup

-- 关闭按钮圆角
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 17)
closeCorner.Parent = closeBtn

-- 关闭按钮悬停效果
closeBtn.MouseEnter:Connect(function()
    closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    closeBtn.TextColor3 = Color3.fromRGB(255, 150, 150)
end)
closeBtn.MouseLeave:Connect(function()
    closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
end)

closeBtn.MouseButton1Click:Connect(function()
    local tween = game:GetService("TweenService")
    local closeAnim = tween:Create(popup, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -200, -0.3, 0)
    })
    local fadeAnim = tween:Create(overlay, TweenInfo.new(0.3), {
        BackgroundTransparency = 1
    })
    closeAnim:Play()
    fadeAnim:Play()
    task.wait(0.3)
    gui:Destroy()
end)

-- 图标区域（大图标）
local iconCircle = Instance.new("Frame")
iconCircle.Size = UDim2.new(0, 100, 0, 100)
iconCircle.Position = UDim2.new(0.5, -50, 0, 50)
iconCircle.BackgroundColor3 = Color3.fromRGB(156, 39, 176)
iconCircle.BackgroundTransparency = 0.2
iconCircle.BorderSizePixel = 0
iconCircle.Parent = popup

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = iconCircle

local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(1, 0, 1, 0)
icon.BackgroundTransparency = 1
icon.Text = "⚡"
icon.TextColor3 = Color3.fromRGB(156, 39, 176)
icon.TextSize = 50
icon.Font = Enum.Font.GothamBold
icon.Parent = iconCircle

-- 标题
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 0, 35)
titleLabel.Position = UDim2.new(0, 20, 0, 175)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "正在加载脚本"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 22
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.Parent = popup

-- 进度条背景
local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(0.7, 0, 0, 12)
progressBg.Position = UDim2.new(0.15, 0, 0, 235)
progressBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
progressBg.BorderSizePixel = 0
progressBg.Parent = popup

local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(0, 6)
bgCorner.Parent = progressBg

-- 进度条（紫色）
local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(156, 39, 176)
progressBar.BorderSizePixel = 0
progressBar.Parent = progressBg

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 6)
barCorner.Parent = progressBar

-- 进度百分比文字
local progressPercent = Instance.new("TextLabel")
progressPercent.Size = UDim2.new(0.7, 0, 0, 30)
progressPercent.Position = UDim2.new(0.15, 0, 0, 255)
progressPercent.BackgroundTransparency = 1
progressPercent.Text = "0%"
progressPercent.TextColor3 = Color3.fromRGB(156, 39, 176)
progressPercent.Font = Enum.Font.GothamBold
progressPercent.TextSize = 18
progressPercent.TextXAlignment = Enum.TextXAlignment.Center
progressPercent.Parent = popup

-- 状态文字
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(0.7, 0, 0, 25)
statusText.Position = UDim2.new(0.15, 0, 0, 290)
statusText.BackgroundTransparency = 1
statusText.Text = "准备就绪"
statusText.TextColor3 = Color3.fromRGB(150, 150, 170)
statusText.Font = Enum.Font.Gotham
statusText.TextSize = 14
statusText.TextXAlignment = Enum.TextXAlignment.Center
statusText.Parent = popup

-- 底部装饰线
local bottomLine = Instance.new("Frame")
bottomLine.Size = UDim2.new(0.5, 0, 0, 2)
bottomLine.Position = UDim2.new(0.25, 0, 0, 350)
bottomLine.BackgroundColor3 = Color3.fromRGB(156, 39, 176)
bottomLine.BackgroundTransparency = 0.5
bottomLine.BorderSizePixel = 0
bottomLine.Parent = popup

local lineCorner = Instance.new("UICorner")
lineCorner.CornerRadius = UDim.new(0, 1)
lineCorner.Parent = bottomLine

-- 动画服务
local tween = game:GetService("TweenService")

-- 关闭弹窗函数（加载完成后直接关闭）
local function closePopup()
    local closeDown = tween:Create(popup, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -200, 1.2, 0)
    })
    local fadeOut = tween:Create(overlay, TweenInfo.new(0.3), { BackgroundTransparency = 1 })
    closeDown:Play()
    fadeOut:Play()
    task.wait(0.4)
    gui:Destroy()
    
-- 执行你的脚本
local function executeYourScript()
    -- ========== 在这里放你的 loadstring ==========
    -- 取消下面代码的注释即可使用
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/CNM-LKJ/main/CNM%E9%80%9A%E7%94%A8%E8%84%9A%E6%9C%AC.lua"))()
    -- ============================================
    print("脚本已执行")
end

-- 进度条动画（5秒填满）
local function startProgressAnimation()
    -- 进度条宽度动画：从 0 到 1（填满父容器）
    local progressTween = tween:Create(progressBar, TweenInfo.new(5, Enum.EasingStyle.Linear), {
        Size = UDim2.new(1, 0, 1, 0)
    })
    
    -- 百分比数字动画
    local startTime = tick()
    local function updatePercent()
        local elapsed = tick() - startTime
        local percent = math.min(100, math.floor((elapsed / 5) * 100))
        progressPercent.Text = percent .. "%"
        
        -- 改变状态文字
        if percent < 20 then
            statusText.Text = "正在初始化..."
        elseif percent < 40 then
            statusText.Text = "正在连接服务器..."
        elseif percent < 60 then
            statusText.Text = "正在下载脚本..."
        elseif percent < 80 then
            statusText.Text = "正在验证脚本..."
        elseif percent < 100 then
            statusText.Text = "正在准备执行..."
        end
        
        if percent < 100 then
            task.wait(0.05)
            updatePercent()
        else
            statusText.Text = "加载完成！"
            progressPercent.Text = "100%"
            -- 完成时改变颜色
            progressBar.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
            statusText.TextColor3 = Color3.fromRGB(76, 175, 80)
            titleLabel.Text = "✅ 加载完成"
            icon.Text = "✅"
            icon.TextColor3 = Color3.fromRGB(76, 175, 80)
            bottomLine.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
            
            -- 动画完成后直接关闭弹窗（不等待）
            closePopup()
        end
    end
    
    progressTween:Play()
    updatePercent()
end

-- 动画：背景淡入 + 弹窗下滑
local fadeIn = tween:Create(overlay, TweenInfo.new(0.3), { BackgroundTransparency = 0.5 })
local slideDown = tween:Create(popup, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -200, 0.5, -200)
})

fadeIn:Play()
slideDown:Play()

-- 等待弹窗动画完成后开始进度条
task.wait(0.6)
startProgressAnimation()