-- 高级卡密验证 + 脚本加载器 UI（1:1 正方形）
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "KeyAuthSystem"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 背景遮罩
local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.6
overlay.Parent = gui

-- ================ 主窗口（1:1 正方形 450x450） ================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 450)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
mainFrame.BackgroundTransparency = 0.08
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = gui

-- 圆角
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 28)
mainCorner.Parent = mainFrame

-- 边框光效
local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 1.5
mainStroke.Color = Color3.fromRGB(100, 100, 160)
mainStroke.Transparency = 0.5
mainStroke.Parent = mainFrame

-- 顶部渐变条
local gradientBar = Instance.new("Frame")
gradientBar.Size = UDim2.new(1, 0, 0, 6)
gradientBar.Position = UDim2.new(0, 0, 0, 0)
gradientBar.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
gradientBar.BorderSizePixel = 0
gradientBar.Parent = mainFrame

local gradientCorner = Instance.new("UICorner")
gradientCorner.CornerRadius = UDim.new(0, 28)
gradientCorner.Parent = gradientBar

-- 关闭按钮
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 34, 0, 34)
closeBtn.Position = UDim2.new(1, -44, 0, 12)
closeBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 0
closeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 17)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- 图标区域（圆形）
local iconCircle = Instance.new("Frame")
iconCircle.Size = UDim2.new(0, 85, 0, 85)
iconCircle.Position = UDim2.new(0.5, -42.5, 0, 45)
iconCircle.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
iconCircle.BackgroundTransparency = 0.15
iconCircle.BorderSizePixel = 0
iconCircle.Parent = mainFrame

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = iconCircle

local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(1, 0, 1, 0)
icon.BackgroundTransparency = 1
icon.Text = "🔐"
icon.TextColor3 = Color3.fromRGB(0, 150, 255)
icon.TextSize = 45
icon.Font = Enum.Font.GothamBold
icon.Parent = iconCircle

-- 标题
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 0, 35)
titleLabel.Position = UDim2.new(0, 20, 0, 150)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "卡密验证"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 24
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.Parent = mainFrame

-- 副标题
local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, -40, 0, 25)
subtitleLabel.Position = UDim2.new(0, 20, 0, 188)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "请输入您的卡密以继续"
subtitleLabel.TextColor3 = Color3.fromRGB(150, 150, 180)
subtitleLabel.TextSize = 14
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Center
subtitleLabel.Parent = mainFrame

-- 卡密输入框容器
local inputContainer = Instance.new("Frame")
inputContainer.Size = UDim2.new(0.75, 0, 0, 50)
inputContainer.Position = UDim2.new(0.125, 0, 0, 230)
inputContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
inputContainer.BackgroundTransparency = 0.5
inputContainer.BorderSizePixel = 0
inputContainer.Parent = mainFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 12)
inputCorner.Parent = inputContainer

local inputStroke = Instance.new("UIStroke")
inputStroke.Thickness = 1
inputStroke.Color = Color3.fromRGB(70, 70, 100)
inputStroke.Transparency = 0.5
inputStroke.Parent = inputContainer

-- 输入框图标
local inputIcon = Instance.new("TextLabel")
inputIcon.Size = UDim2.new(0, 45, 1, 0)
inputIcon.Position = UDim2.new(0, 5, 0, 0)
inputIcon.BackgroundTransparency = 1
inputIcon.Text = "🔑"
inputIcon.TextColor3 = Color3.fromRGB(0, 150, 255)
inputIcon.TextSize = 22
inputIcon.Font = Enum.Font.Gotham
inputIcon.Parent = inputContainer

-- 卡密输入框
local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -55, 1, 0)
keyInput.Position = UDim2.new(0, 50, 0, 0)
keyInput.BackgroundTransparency = 1
keyInput.PlaceholderText = "请输入卡密..."
keyInput.Text = ""
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 16
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.PlaceholderColor3 = Color3.fromRGB(120, 120, 145)
keyInput.ClearTextOnFocus = false
keyInput.Parent = inputContainer

-- 状态标签
local statusFrame = Instance.new("Frame")
statusFrame.Size = UDim2.new(0.75, 0, 0, 30)
statusFrame.Position = UDim2.new(0.125, 0, 0, 295)
statusFrame.BackgroundTransparency = 1
statusFrame.Parent = mainFrame

local statusIcon = Instance.new("TextLabel")
statusIcon.Size = UDim2.new(0, 25, 1, 0)
statusIcon.Position = UDim2.new(0, 0, 0, 0)
statusIcon.BackgroundTransparency = 1
statusIcon.Text = "⏳"
statusIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
statusIcon.TextSize = 16
statusIcon.Font = Enum.Font.Gotham
statusIcon.TextXAlignment = Enum.TextXAlignment.Center
statusIcon.Parent = statusFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -30, 1, 0)
statusLabel.Position = UDim2.new(0, 30, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "等待输入卡密"
statusLabel.TextColor3 = Color3.fromRGB(180, 180, 210)
statusLabel.TextSize = 14
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = statusFrame

-- 验证按钮
local verifyBtn = Instance.new("TextButton")
verifyBtn.Size = UDim2.new(0.5, 0, 0, 48)
verifyBtn.Position = UDim2.new(0.25, 0, 0, 345)
verifyBtn.Text = "验证并加载"
verifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
verifyBtn.TextSize = 16
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.BorderSizePixel = 0
verifyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 220)
verifyBtn.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 25)
btnCorner.Parent = verifyBtn

-- 按钮悬停效果
verifyBtn.MouseEnter:Connect(function()
    verifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
end)
verifyBtn.MouseLeave:Connect(function()
    verifyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 220)
end)

-- 底部提示
local footerLabel = Instance.new("TextLabel")
footerLabel.Size = UDim2.new(1, 0, 0, 25)
footerLabel.Position = UDim2.new(0, 0, 0, 415)
footerLabel.BackgroundTransparency = 1
footerLabel.Text = "© 授权系统 | 仅供授权用户使用"
footerLabel.TextColor3 = Color3.fromRGB(100, 100, 130)
footerLabel.TextSize = 11
footerLabel.Font = Enum.Font.Gotham
footerLabel.Parent = mainFrame

-- ================ 正确的卡密列表 ================
local validKeys = {
    ["VIP123-45678-ABCDE"] = true,
    ["FREE-ABCD-1234"] = true,
    ["TEST-KEY-99999"] = true,
}

-- 更新状态函数
local function updateStatus(text, iconChar, color)
    statusLabel.Text = text
    statusIcon.Text = iconChar
    statusLabel.TextColor3 = color
    statusIcon.TextColor3 = color
end

-- 加载器弹窗函数
local function showLoaderAndExecute()
    -- 销毁验证窗口
    gui:Destroy()
    
    -- ================ 加载器弹窗 ================
    local loaderGui = Instance.new("ScreenGui")
    loaderGui.Name = "ScriptLoader"
    loaderGui.Parent = player:WaitForChild("PlayerGui")
    
    local loaderOverlay = Instance.new("Frame")
    loaderOverlay.Size = UDim2.new(1, 0, 1, 0)
    loaderOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    loaderOverlay.BackgroundTransparency = 0.5
    loaderOverlay.Parent = loaderGui
    
    local loaderFrame = Instance.new("Frame")
    loaderFrame.Size = UDim2.new(0, 400, 0, 400)
    loaderFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
    loaderFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    loaderFrame.BackgroundTransparency = 0.1
    loaderFrame.BorderSizePixel = 0
    loaderFrame.ClipsDescendants = true
    loaderFrame.Parent = loaderGui
    
    local loaderCorner = Instance.new("UICorner")
    loaderCorner.CornerRadius = UDim.new(0, 24)
    loaderCorner.Parent = loaderFrame
    
    local loaderIcon = Instance.new("TextLabel")
    loaderIcon.Size = UDim2.new(0, 80, 0, 80)
    loaderIcon.Position = UDim2.new(0.5, -40, 0, 50)
    loaderIcon.BackgroundTransparency = 1
    loaderIcon.Text = "⚡"
    loaderIcon.TextColor3 = Color3.fromRGB(0, 150, 255)
    loaderIcon.TextSize = 55
    loaderIcon.Font = Enum.Font.GothamBold
    loaderIcon.Parent = loaderFrame
    
    local loaderTitle = Instance.new("TextLabel")
    loaderTitle.Size = UDim2.new(1, -40, 0, 35)
    loaderTitle.Position = UDim2.new(0, 20, 0, 160)
    loaderTitle.BackgroundTransparency = 1
    loaderTitle.Text = "正在加载脚本"
    loaderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    loaderTitle.TextSize = 22
    loaderTitle.Font = Enum.Font.GothamBold
    loaderTitle.TextXAlignment = Enum.TextXAlignment.Center
    loaderTitle.Parent = loaderFrame
    
    -- 进度条
    local progressBg = Instance.new("Frame")
    progressBg.Size = UDim2.new(0.7, 0, 0, 10)
    progressBg.Position = UDim2.new(0.15, 0, 0, 220)
    progressBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    progressBg.BorderSizePixel = 0
    progressBg.Parent = loaderFrame
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 5)
    bgCorner.Parent = progressBg
    
    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(0, 0, 1, 0)
    progressBar.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    progressBar.BorderSizePixel = 0
    progressBar.Parent = progressBg
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(0, 5)
    barCorner.Parent = progressBar
    
    local percentLabel = Instance.new("TextLabel")
    percentLabel.Size = UDim2.new(0.7, 0, 0, 30)
    percentLabel.Position = UDim2.new(0.15, 0, 0, 240)
    percentLabel.BackgroundTransparency = 1
    percentLabel.Text = "0%"
    percentLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
    percentLabel.Font = Enum.Font.GothamBold
    percentLabel.TextSize = 18
    percentLabel.TextXAlignment = Enum.TextXAlignment.Center
    percentLabel.Parent = loaderFrame
    
    local statusText = Instance.new("TextLabel")
    statusText.Size = UDim2.new(0.7, 0, 0, 25)
    statusText.Position = UDim2.new(0.15, 0, 0, 275)
    statusText.BackgroundTransparency = 1
    statusText.Text = "准备就绪"
    statusText.TextColor3 = Color3.fromRGB(150, 150, 170)
    statusText.Font = Enum.Font.Gotham
    statusText.TextSize = 14
    statusText.TextXAlignment = Enum.TextXAlignment.Center
    statusText.Parent = loaderFrame
    
    -- 进度条动画
    local tween = game:GetService("TweenService")
    local progressTween = tween:Create(progressBar, TweenInfo.new(5, Enum.EasingStyle.Linear), {
        Size = UDim2.new(1, 0, 1, 0)
    })
    
    local startTime = tick()
    local function updateProgress()
        local elapsed = tick() - startTime
        local percent = math.min(100, math.floor((elapsed / 5) * 100))
        percentLabel.Text = percent .. "%"
        
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
            updateProgress()
        else
            statusText.Text = "加载完成！"
            percentLabel.Text = "100%"
            progressBar.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
            loaderTitle.Text = "✅ 加载完成"
            loaderIcon.Text = "✅"
            loaderIcon.TextColor3 = Color3.fromRGB(76, 175, 80)
            
            task.wait(0.5)
            
            -- 关闭加载器
            loaderGui:Destroy()
            
            -- ========== 在这里执行你的脚本 ==========
            print("卡密验证通过，脚本开始执行！")
            loadstring(game:HttpGet("https://github.com/HB-ksdb/CNM-LKJ/blob/main/CNM%E9%80%9A%E7%94%A8%E8%84%9A%E6%9C%AC.lua"))()
            -- ======================================
        end
    end
    
    progressTween:Play()
    updateProgress()
end

-- 验证按钮点击事件
verifyBtn.MouseButton1Click:Connect(function()
    local inputKey = keyInput.Text
    
    if validKeys[inputKey] then
        updateStatus("验证成功！正在加载...", "✅", Color3.fromRGB(0, 255, 100))
        verifyBtn.Text = "✓ 验证成功"
        verifyBtn.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
        
        task.wait(0.8)
        showLoaderAndExecute()
    else
        updateStatus("卡密错误，请重试", "❌", Color3.fromRGB(255, 80, 80))
        keyInput.Text = ""
        verifyBtn.Text = "验证失败"
        verifyBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        
        task.wait(1.5)
        if not gui then return end
        updateStatus("等待输入卡密", "⏳", Color3.fromRGB(180, 180, 210))
        verifyBtn.Text = "验证并加载"
        verifyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 220)
    end
end)

-- 回车键验证
keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        verifyBtn.MouseButton1Click:Fire()
    end
end)

-- 入场动画
local tween = game:GetService("TweenService")
local fadeIn = tween:Create(overlay, TweenInfo.new(0.3), { BackgroundTransparency = 0.5 })
local slideDown = tween:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -225, 0.5, -225)
})
fadeIn:Play()
slideDown:Play()