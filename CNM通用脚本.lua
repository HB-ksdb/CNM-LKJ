-- 假设你已经加载了 WindUI 库（请根据你的实际加载方式修改）
local WindUI = require(game.ReplicatedStorage:WaitForChild("WindUI"))

-- 创建主窗口
local MainWindow = WindUI:CreateWindow({
    Title = "我的管理面板",           -- 窗口标题
    SubTitle = "WindUI 示例",        -- 副标题
    Author = "YourName",             -- 作者名
    Icon = "rbxassetid://123456789", -- 可选：图标资产ID
    Size = UDim2.new(0, 600, 0, 400),-- 窗口大小
    Resizable = true,                -- 是否可调整大小
    Acrylic = false                  -- 是否启用毛玻璃效果
})

-- 创建一个标签页（例如 "主页"）
local HomeTab = MainWindow:CreateTab("主页")

-- 在标签页下创建一个区块（Section）
local Section1 = HomeTab:CreateSection("基础设置")

-- 添加一个按钮
Section1:CreateButton({
    Text = "点击我",
    Callback = function()
        print("按钮被点击了！")
        -- 这里可以放你的功能代码
        game.Players.LocalPlayer.Character.Humanoid.Health = 100 -- 示例：回满血
    end
})

-- 添加一个滑动条（音量/数值调节）
Section1:CreateSlider({
    Text = "音量调节",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(Value)
        print("当前音量：" .. Value)
        -- 在这里应用音量值
    end
})

-- 添加一个复选框（Toggle）
Section1:CreateToggle({
    Text = "无敌模式",
    Default = false,
    Callback = function(State)
        if State then
            print("无敌模式 开启")
            -- 开启无敌逻辑
        else
            print("无敌模式 关闭")
        end
    end
})

-- 添加一个下拉菜单
Section1:CreateDropdown({
    Text = "选择武器",
    Options = {"AK-47", "M4A1", "狙击枪"},
    Default = "AK-47",
    Callback = function(Selected)
        print("选择了武器：" .. Selected)
    end
})

-- 创建第二个标签页（例如 "其他功能"）
local OtherTab = MainWindow:CreateTab("其他")
local Section2 = OtherTab:CreateSection("高级选项")

Section2:CreateButton({
    Text = "显示通知",
    Callback = function()
        WindUI:Notify({
            Title = "提示",
            Content = "这是一个通知消息！",
            Duration = 3
        })
    end
})