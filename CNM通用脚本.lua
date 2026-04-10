
-- ================ 黑名单 ================
-- 名字用户（别人用不了脚本）
local blacklist = {
    "BadPlayer1",
    "Hacker123",
    "CheaterABC",
    "",
    "要拉黑的用户名2"
-- ================ 添加要拉黑的用户名 ================
}

-- ================ 检查当前玩家是否在黑名单中 ================
local function checkBlacklist()
    local localPlayer = game.Players.LocalPlayer
    local username = localPlayer.Name
    
-- ================ 遍历黑名单检查 ================
    for _, blacklistedName in ipairs(blacklist) do
        if username == blacklistedName then
-- ================ 如果在黑名单中，执行踢出代码 ================
            game.Players.LocalPlayer:Kick("你已被HB FXM脚本加入至黑名单，我让你惹HB FXM现在好了吧？你活该！")
            return true
        end
    end
    return false
end

-- ================ 立即执行检查 ================
if checkBlacklist() then
    return  -- = 如果在黑名单中，停止执行后续代码 =
end
-- ================ 彩虹字符 ================
-- ================ 支持服务器 ================
-- ================ 1.执行UI加载器…… ================
-- ================  ================
function Antihook()
    return "Hook"
end

hookfunction(Antihook, function()
    return "No Hook"
end)

hookfunction(game.HttpGet, print)

if not isfunctionhooked(Antihook) or not isfunctionhooked(game.HttpGet) then
    game:shutdown("别搞我")
    while true do end
end

restorefunction(game.HttpGet)

if isfunctionhooked(game.HttpGet) or isfunctionhooked(request) or isfunctionhooked(tostring) then
    game:shutdown("666")
    while true do end
end

-- ================  ================
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "鹤pro"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("HB FXM:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S")).."秒"
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

            -- ================ 加载 WindUI 主功能窗口 ================
            local MainWindow = WindUI:CreateWindow({
                Title = "<font color='#00AAFF'>CNM脚本通用</font>",
                Icon = "rbxassetid://4483362748",
                Author = "CNM Script",
                Size = UDim2.fromOffset(400, 400),
                Transparent = true,        -- 开启透明模式
                Acrylic = true,
            })

            MainWindow:EditOpenButton({
                Title = "CNM 脚本",
                Icon = "crown",
                CornerRadius = UDim.new(0, 16),
                StrokeThickness = 2,
                Draggable = true
            })

            -- 添加标签
            MainWindow:Tag({ Title = "已解锁", Color = Color3.fromHex("#00FF66") })
            MainWindow:Tag({ Title = "CNM", Color = Color3.fromHex("#FFAA00") })
            MainWindow:Tag({ Title = "1.0", Color = Color3.fromHex("#FFAA00") })

            local MainSection = Window:Section({
             Title = "信息",
                })

                -- About Tab
                local AboutTab = MainSection:Tab({
                    Title = "更新说明",
                    Desc = "Information & Details",
                    Icon = "solar:info-square-bold",
                    IconColor = Color3.fromHex("#83889E"),
                    IconShape = "Square",
                    Border = true,
                })

                -- Moved this block UP / BEFORE the long description section
                local AboutSection = AboutTab:Section({
                    Title = "1.0版本更新",
                })

                AboutSection:Section({
                    Title = "HB脚本改成CNM脚本",
                    TextSize = 24,
                    FontWeight = Enum.FontWeight.SemiBold,
                })

                -- Long description comes AFTER the headers
                AboutSection:Section({
                    Title = 
                        "由于HB停更后就再也没有更新了之后今天2026年4月10号正是回归.\n\n" ..
                        "本次脚本是缝合不会自制.\n\n" ..
                        "具体脚本更新了什么:\n\n" ..
                        "• 1.除了更新了UI优化功能\n" ..
                        "• \n" ..
                        "• \n" ..
                        "• \n" ..
                        ".\n\n" ..
                        ".\n\n" ..
                        ".",

                    TextSize = 18,
                    TextTransparency = 0.35,
                    FontWeight = Enum.FontWeight.Medium,

                    TextXAlignment = "Left",
                    Box = false,
                    BoxBorder = true,
                    Opened = true,
                })

                AboutTab:Divider()

                AboutTab:Space({ Columns = 4 })


                local MainSection = Window:Section({
    Title = "Main",
})

local HomeTab = MainSection:Tab({
    Title = "最坚强战场",
    Icon = "home",
})

-- Tạo một Section duy nhất có Khung và Viền
local MainSection = HomeTab:Section({
    Title = "最坚强战场",
    Desc = "大战场",
    Box = true, -- Bật khung
    BoxBorder = true, -- Bật viền (Cực đẹp)
    Opened = true
})

-- Tạo một Group nằm NGAY TRONG Section để chứa các nút chọn
local SelectionGroup = MainSection:Group({})

-- Biến để chứa các thành phần chức năng (để Destroy khi chuyển tab)
local FunctionElements = {}

-- Hàm dọn dẹp các chức năng cũ
local function ClearFunctions()
    for _, element in pairs(FunctionElements) do
        if element then element:Destroy() end
    end
    FunctionElements = {}
end

-- --- CHỨC NĂNG 1: AIM ---
local function LoadAim()
    ClearFunctions()
    
    local s1 = MainSection:Button({ Title = "自动侧闪『推荐』", Callback = function() loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/54d6b993fe3a4c1f5c3e375eba35e5ec.lua"))() end })
    local t1 = MainSection:Button({ Title = "自动侧闪", Callback = function() loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/23bcf4264b586dc93b16a9b054eddae259938b7421ac5096353079b2e9d74e24.lua"))() end })
        
    -- Lưu lại để xóa sau này
    table.insert(FunctionElements, s1)
    table.insert(FunctionElements, t1)
end

-- --- CHỨC NĂNG 2: TEAM ---
local function LoadTeam()
    ClearFunctions()
    
    local b1 = MainSection:Button({ Title = "自动上钩.1", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/dinhthanhtuankiet1762009-sudo/Js/refs/heads/main/aca40cf1f24c92f1.lua.txt"))() end })
    local b2 = MainSection:Button({ Title = "自动上钩.2", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/letuankiet09812345-cmyk/Testkiba/refs/heads/main/4cbcd9b905ee3e41.lua.txt"))() end })
    
    table.insert(FunctionElements, b1)
    table.insert(FunctionElements, b2)
end

-- --- BỎ NÚT CHỌN VÀO GROUP (Nằm trong Section) ---
SelectionGroup:Button({ 
    Title = "最坚强战场侧闪", 
    Icon = "settings",
    Callback = function() LoadAim() end 
})

SelectionGroup:Button({ 
    Title = "最坚强战场自动上钩", 
    Icon = "users",
    Callback = function() LoadTeam() end 
})

MainSection:Divider()
-- Chạy mặc định
LoadAim()

local MainSection = HomeTab:Button({
    Title = "无头断腿『支持r6』",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-tsb-client-sided-headless-and-korblox-74593"))()
    end
})

local MainSection = HomeTab:Button({
    Title = "改索尼克角色脚本",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/SIONELTNAMATLASIA.lua"))()
    end
})

local MainSection = HomeTab:Button({
    Title = "改帧率",
    Locked = false,
    Callback = function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\56\115\119\116\102\114\69\51\34\41\41\40\41")()
    end
})

