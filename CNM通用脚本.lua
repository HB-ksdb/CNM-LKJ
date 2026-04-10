local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- ================ 黑名单检查 ================
local blacklist = {
    "BadPlayer1",
    "Hacker123",
    "CheaterABC",
}

local function checkBlacklist()
    local username = game.Players.LocalPlayer.Name
    for _, blacklistedName in ipairs(blacklist) do
        if username == blacklistedName then
            game.Players.LocalPlayer:Kick("你已被加入黑名单！")
            return true
        end
    end
    return false
end

if checkBlacklist() then
    return
end

-- ================ 创建高级密码验证窗口 ================
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AdvancedPasswordGUI"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 背景遮罩（带模糊效果）
local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.7
overlay.Parent = gui

-- 主窗口
local passwordFrame = Instance.new("Frame")
passwordFrame.Size = UDim2.new(0, 420, 0, 320)
passwordFrame.Position = UDim2.new(0.5, -210, 0.5, -160)
passwordFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
passwordFrame.BackgroundTransparency = 0.1
passwordFrame.BorderSizePixel = 0
passwordFrame.ClipsDescendants = true
passwordFrame.Parent = gui

-- 圆角
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 20)
frameCorner.Parent = passwordFrame

-- 边框光效
local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 1
uiStroke.Color = Color3.fromRGB(100, 100, 150)
uiStroke.Transparency = 0.5
uiStroke.Parent = passwordFrame

-- 顶部渐变条
local gradientBar = Instance.new("Frame")
gradientBar.Size = UDim2.new(1, 0, 0, 5)
gradientBar.Position = UDim2.new(0, 0, 0, 0)
gradientBar.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
gradientBar.BorderSizePixel = 0
gradientBar.Parent = passwordFrame

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 20)
topCorner.Parent = gradientBar

-- 渐变效果（只切顶部两个角）
local gradientCorner = Instance.new("UICorner")
gradientCorner.CornerRadius = UDim.new(0, 20)
gradientCorner.Parent = gradientBar

-- 标题区域
local titleFrame = Instance.new("Frame")
titleFrame.Size = UDim2.new(1, 0, 0, 60)
titleFrame.Position = UDim2.new(0, 0, 0, 5)
titleFrame.BackgroundTransparency = 1
titleFrame.Parent = passwordFrame


-- 图标
local iconLabel = Instance.new("TextLabel")
iconLabel.Size = UDim2.new(0, 40, 0, 40)
iconLabel.Position = UDim2.new(0, 20, 0, 10)
iconLabel.BackgroundTransparency = 1
iconLabel.Text = "🔐"
iconLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
iconLabel.TextSize = 32
iconLabel.Font = Enum.Font.GothamBold
iconLabel.Parent = titleFrame

-- 标题文字
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -80, 0, 30)
titleLabel.Position = UDim2.new(0, 70, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "身份验证"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 24
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleFrame

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, -80, 0, 20)
subtitleLabel.Position = UDim2.new(0, 70, 0, 38)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "请输入密码以继续"
subtitleLabel.TextColor3 = Color3.fromRGB(150, 150, 170)
subtitleLabel.TextSize = 14
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = titleFrame

-- 分割线
local divider = Instance.new("Frame")
divider.Size = UDim2.new(0.9, 0, 0, 1)
divider.Position = UDim2.new(0.05, 0, 0, 75)
divider.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
divider.BorderSizePixel = 0
divider.Parent = passwordFrame

-- 密码输入框容器
local inputContainer = Instance.new("Frame")
inputContainer.Size = UDim2.new(0.8, 0, 0, 50)
inputContainer.Position = UDim2.new(0.1, 0, 0, 100)
inputContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
inputContainer.BackgroundTransparency = 0.5
inputContainer.BorderSizePixel = 0
inputContainer.Parent = passwordFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 12)
inputCorner.Parent = inputContainer

local inputStroke = Instance.new("UIStroke")
inputStroke.Thickness = 1
inputStroke.Color = Color3.fromRGB(80, 80, 100)
inputStroke.Transparency = 0.5
inputStroke.Parent = inputContainer

-- 输入框图标
local inputIcon = Instance.new("TextLabel")
inputIcon.Size = UDim2.new(0, 40, 1, 0)
inputIcon.Position = UDim2.new(0, 5, 0, 0)
inputIcon.BackgroundTransparency = 1
inputIcon.Text = "🔑"
inputIcon.TextColor3 = Color3.fromRGB(150, 150, 170)
inputIcon.TextSize = 20
inputIcon.Font = Enum.Font.Gotham
inputIcon.Parent = inputContainer

-- 密码输入框
local passwordBox = Instance.new("TextBox")
passwordBox.Size = UDim2.new(1, -50, 1, 0)
passwordBox.Position = UDim2.new(0, 45, 0, 0)
passwordBox.BackgroundTransparency = 1
passwordBox.PlaceholderText = "输入密码"
passwordBox.Text = ""
passwordBox.Font = Enum.Font.Gotham
passwordBox.TextSize = 16
passwordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
passwordBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
passwordBox.ClearTextOnFocus = false
passwordBox.Parent = inputContainer

-- 状态标签（带图标）
local statusFrame = Instance.new("Frame")
statusFrame.Size = UDim2.new(0.8, 0, 0, 30)
statusFrame.Position = UDim2.new(0.1, 0, 0, 165)
statusFrame.BackgroundTransparency = 1
statusFrame.Parent = passwordFrame

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
statusLabel.Text = "等待输入密码"
statusLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
statusLabel.TextSize = 14
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = statusFrame

-- 按钮容器
local buttonFrame = Instance.new("Frame")
buttonFrame.Size = UDim2.new(0.8, 0, 0, 45)
buttonFrame.Position = UDim2.new(0.1, 0, 0, 215)
buttonFrame.BackgroundTransparency = 1
buttonFrame.Parent = passwordFrame

-- 确认按钮（渐变）
local confirmBtn = Instance.new("TextButton")
confirmBtn.Size = UDim2.new(0.6, 0, 1, 0)
confirmBtn.Position = UDim2.new(0.2, 0, 0, 0)
confirmBtn.Text = "验证并解锁"
confirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmBtn.TextSize = 16
confirmBtn.Font = Enum.Font.GothamBold
confirmBtn.BorderSizePixel = 0
confirmBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
confirmBtn.Parent = buttonFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 25)
btnCorner.Parent = confirmBtn

-- 按钮光晕效果
local btnGlow = Instance.new("Frame")
btnGlow.Size = UDim2.new(1, 0, 1, 0)
btnGlow.Position = UDim2.new(0, 0, 0, 0)
btnGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
btnGlow.BackgroundTransparency = 0.9
btnGlow.BorderSizePixel = 0
btnGlow.Parent = confirmBtn

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 25)
glowCorner.Parent = btnGlow

-- 底部提示
local footerLabel = Instance.new("TextLabel")
footerLabel.Size = UDim2.new(1, 0, 0, 20)
footerLabel.Position = UDim2.new(0, 0, 0, 285)
footerLabel.BackgroundTransparency = 1
footerLabel.Text = "© HB Script | 仅供授权用户使用"
footerLabel.TextColor3 = Color3.fromRGB(100, 100, 120)
footerLabel.TextSize = 11
footerLabel.Font = Enum.Font.Gotham
footerLabel.Parent = passwordFrame

-- 动画：窗口淡入
passwordFrame.BackgroundTransparency = 0.15
passwordFrame:TweenSize(UDim2.new(0, 420, 0, 320), "Out", "Back", 0.3, true)

-- 按钮悬停效果
confirmBtn.MouseEnter:Connect(function()
    confirmBtn:TweenSize(UDim2.new(0.64, 0, 1, 0), "Out", "Quad", 0.1, true)
    confirmBtn.Position = UDim2.new(0.18, 0, 0, 0)
    confirmBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    btnGlow.BackgroundTransparency = 0.85
end)

confirmBtn.MouseLeave:Connect(function()
    confirmBtn:TweenSize(UDim2.new(0.6, 0, 1, 0), "Out", "Quad", 0.1, true)
    confirmBtn.Position = UDim2.new(0.2, 0, 0, 0)
    confirmBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
    btnGlow.BackgroundTransparency = 0.9
end)

-- 输入框获得焦点效果
passwordBox.Focused:Connect(function()
    inputContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    inputStroke.Color = Color3.fromRGB(0, 120, 255)
    inputStroke.Transparency = 0.3
    inputIcon.TextColor3 = Color3.fromRGB(0, 150, 255)
end)

passwordBox.FocusLost:Connect(function()
    inputContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    inputStroke.Color = Color3.fromRGB(80, 80, 100)
    inputStroke.Transparency = 0.5
    inputIcon.TextColor3 = Color3.fromRGB(150, 150, 170)
end)

-- 正确密码
local CORRECT_PASSWORD = "123456"
local unlocked = false

-- 更新状态函数
local function updateStatus(text, icon, color)
    statusLabel.Text = text
    statusIcon.Text = icon
    statusLabel.TextColor3 = color
    statusIcon.TextColor3 = color
end

-- 确认按钮点击事件
confirmBtn.MouseButton1Click:Connect(function()
    local inputPassword = passwordBox.Text
    
    if inputPassword == CORRECT_PASSWORD then
        updateStatus("验证成功！正在加载功能...", "✅", Color3.fromRGB(0, 255, 100))
        
        -- 按钮成功动画
        confirmBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        confirmBtn.Text = "✓ 验证成功"
        
        if not unlocked then
            unlocked = true
            
            -- 延迟加载主界面
            task.wait(0.8)
            
            -- 销毁密码窗口（带动画）
            passwordFrame:TweenSize(UDim2.new(0, 400, 0, 300), "In", "Quad", 0.2, true)
            task.wait(0.2)
            gui:Destroy()
            
            -- ================ 加载 WindUI 主功能窗口 ================
            local MainWindow = WindUI:CreateWindow({
                Title = "<font color='#00AAFF'>HB 高级面板</font>",
                Icon = "rbxassetid://4483362748",
                Author = "HB Script",
                Size = UDim2.fromOffset(500, 400),
                SideBarWidth = 160,
                Acrylic = true,
            })

            MainWindow:EditOpenButton({
                Title = "HB 脚本",
                Icon = "crown",
                CornerRadius = UDim.new(0, 16),
                StrokeThickness = 2,
                Draggable = true
            })

            -- 添加标签
            MainWindow:Tag({ Title = "已解锁", Color = Color3.fromHex("#00FF66") })
            MainWindow:Tag({ Title = "VIP", Color = Color3.fromHex("#FFAA00") })

            -- 主功能标签页
            local MainSection = MainWindow:Section({ Title = "功能列表", Opened = true })
            local FuncTab = MainSection:Tab({ Title = "功能", Icon = "bolt" })

            -- 功能按钮
            FuncTab:Button({
                Title = "示例功能1",
                Desc = "点击执行示例功能",
                Callback = function()
                    print("功能1执行了")
                    WindUI:Notify({
                        Title = "提示",
                        Content = "示例功能1已执行",
                        Duration = 2,
                        Icon = "check"
                    })
                end
            })

            FuncTab:Button({
                Title = "示例功能2",
                Desc = "点击执行示例功能",
                Callback = function()
                    print("功能2执行了")
                    WindUI:Notify({
                        Title = "提示",
                        Content = "示例功能2已执行",
                        Duration = 2,
                        Icon = "check"
                    })
                end
            })

            FuncTab:Divider()

            FuncTab:Button({
                Title = "示例功能3",
                Desc = "点击执行示例功能",
                Callback = function()
                    print("功能3执行了")
                    WindUI:Notify({
                        Title = "提示",
                        Content = "示例功能3已执行",
                        Duration = 2,
                        Icon = "check"
                    })
                end
            })
            
            -- 显示启动通知
            WindUI:Notify({
                Title = "HB 高级脚本",
                Content = "验证成功！欢迎使用",
                Duration = 3,
                Icon = "crown"
            })
        end
    else
        -- 错误动画效果
        updateStatus("密码错误，请重试", "❌", Color3.fromRGB(255, 80, 80))
        confirmBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
        confirmBtn.Text = "✗ 验证失败"
        
        -- 抖动效果
        local originalPos = passwordFrame.Position
        for i = 1, 3 do
            passwordFrame.Position = UDim2.new(0.5, -210 + (i % 2 == 0 and -5 or 5), 0.5, -160)
            task.wait(0.03)
        end
        passwordFrame.Position = originalPos
        
        -- 清空输入框
        passwordBox.Text = ""
        
        -- 恢复按钮
        task.wait(1)
        if not unlocked then
            updateStatus("等待输入密码", "⏳", Color3.fromRGB(180, 180, 200))
            confirmBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
            confirmBtn.Text = "验证并解锁"
        end
    end
end)

-- 回车键验证
passwordBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        confirmBtn.MouseButton1Click:Fire()
    end
end)            