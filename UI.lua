<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fantasy UI</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            user-select: none;
        }

        body {
            background: linear-gradient(135deg, #0a0a1a 0%, #0f0f2a 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', 'Poppins', sans-serif;
        }

        .window {
            width: 380px;
            background: rgba(18, 18, 35, 0.85);
            backdrop-filter: blur(15px);
            border-radius: 24px;
            border: 1px solid rgba(0, 170, 255, 0.3);
            overflow: hidden;
        }

        .header {
            padding: 16px 20px;
            background: linear-gradient(135deg, rgba(0, 170, 255, 0.15), rgba(0, 100, 150, 0.1));
            border-bottom: 1px solid rgba(0, 170, 255, 0.3);
        }

        .title {
            font-size: 20px;
            font-weight: 700;
            background: linear-gradient(135deg, #00aaff, #00ffcc);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .version {
            font-size: 11px;
            color: #888;
            margin-top: 4px;
        }

        .search-bar {
            padding: 12px 16px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
        }

        .search-input {
            width: 100%;
            background: rgba(0, 0, 0, 0.4);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 10px 16px;
            color: white;
            font-size: 13px;
            outline: none;
        }

        .search-input:focus {
            border-color: #00aaff;
        }

        .search-input::placeholder {
            color: #555;
        }

        .tabs {
            display: flex;
            padding: 0 16px;
            gap: 8px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
            flex-wrap: wrap;
        }

        .tab {
            padding: 12px 16px;
            font-size: 13px;
            font-weight: 500;
            color: #888;
            cursor: pointer;
            border-bottom: 2px solid transparent;
        }

        .tab:hover {
            color: #ccc;
        }

        .tab.active {
            color: #00aaff;
            border-bottom-color: #00aaff;
        }

        .announcement {
            margin: 16px;
            padding: 12px 16px;
            background: linear-gradient(135deg, rgba(0, 170, 255, 0.1), rgba(0, 255, 204, 0.05));
            border-radius: 16px;
            border-left: 3px solid #00aaff;
        }

        .announcement-title {
            font-size: 13px;
            font-weight: 600;
            color: #00aaff;
            margin-bottom: 4px;
        }

        .announcement-text {
            font-size: 12px;
            color: #aaa;
        }

        .divine-badge {
            display: inline-block;
            background: linear-gradient(135deg, #ff6600, #ff3300);
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            color: white;
            margin: 12px 16px 0;
        }

        .content {
            padding: 8px 16px 20px;
            max-height: 350px;
            overflow-y: auto;
        }

        .section-title {
            font-size: 12px;
            font-weight: 600;
            color: #666;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin: 16px 0 12px 0;
            padding-left: 4px;
        }

        .switch-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .switch-info {
            flex: 1;
        }

        .switch-title {
            font-size: 14px;
            font-weight: 500;
            color: #e0e0e0;
            margin-bottom: 4px;
        }

        .switch-desc {
            font-size: 11px;
            color: #666;
        }

        .switch {
            position: relative;
            width: 44px;
            height: 24px;
            background: #2a2a3a;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .switch.active {
            background: linear-gradient(135deg, #00aaff, #00ffcc);
        }

        .switch .knob {
            position: absolute;
            width: 20px;
            height: 20px;
            background: white;
            border-radius: 50%;
            top: 2px;
            left: 2px;
            transition: all 0.3s;
        }

        .switch.active {
            background: linear-gradient(135deg, #00aaff, #00ffcc);
        }

        .switch .knob {
            position: absolute;
            width: 20px;
            height: 20px;
            background: white;
            border-radius: 50%;
            top: 2px;
            left: 2px;
            transition: all 0.3s;
        }

        .switch.active .knob {
            left: 22px;
        }

        .footer {
            padding: 12px 16px;
            background: rgba(0, 0, 0, 0.3);
            border-top: 1px solid rgba(255, 255, 255, 0.05);
            display: flex;
            justify-content: space-between;
            font-size: 11px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="window">
        <div class="header">
            <div class="title">Fantasy</div>
            <div class="version">version 1.9.1</div>
        </div>

        <div class="search-bar">
            <input type="text" class="search-input" placeholder="Search">
        </div>

        <div class="tabs">
            <div class="tab active" data-tab="home">Home</div>
            <div class="tab" data-tab="combat">Combat</div>
            <div class="tab" data-tab="anticheat">Anti-Cheat</div>
            <div class="tab" data-tab="movement">Movement</div>
            <div class="tab" data-tab="building">Building</div>
            <div class="tab" data-tab="debug">Debug</div>
        </div>

        <div class="announcement">
            <div class="announcement-title">Announcement</div>
            <div class="announcement-text">Welcome to Fantasy</div>
        </div>

        <div class="divine-badge">Divine Power</div>

        <div class="content" id="content">
            <div class="tab-content active" data-content="home">
                <div class="section-title">Features</div>
                <div class="switch-item">
                    <div class="switch-info">
                        <div class="switch-title">Feature Toggle</div>
                        <div class="switch-desc">This is a toggle switch</div>
                    </div>
                    <div class="switch" data-switch="switch1">
                        <div class="knob"></div>
                    </div>
                </div>
                <div class="switch-item">
                    <div class="switch-info">
                        <div class="switch-title">Feature Toggle</div>
                        <div class="switch-desc">This is a toggle switch</div>
                    </div>
                    <div class="switch" data-switch="switch2">
                        <div class="knob"></div>
                    </div>
                </div>
                <div class="switch-item">
                    <div class="switch-info">
                        <div class="switch-title">Feature Toggle</div>
                        <div class="switch-desc">This is a toggle switch</div>
                    </div>
                    <div class="switch" data-switch="switch3">
                        <div class="knob"></div>
                    </div>
                </div>
            </div>

            <div class="tab-content" data-content="combat">
                <div class="section-title">Combat</div>
                <div class="switch-item">
                    <div class="switch-info">
                        <div class="switch-title">Auto Combat</div>
                        <div class="switch-desc">Auto attack enemies</div>
                    </div>
                    <div class="switch" data-switch="autoCombat">
                        <div class="knob"></div>
                    </div>
                </div>
            </div>

            <div class="tab-content" data-content="anticheat">
                <div class="section-title">Anti-Cheat</div>
                <div class="switch-item">
                    <div class="switch-info">
                        <div class="switch-title">Bypass Detection</div>
                        <div class="switch-desc">Bypass anti-cheat</div>
                    </div>
                    <div class="switch" data-switch="bypass">
                        <div class="knob"></div>
                    </div>
                </div>
            </div>

            <div class="tab-content" data-content="movement">
                <div class="section-title">Movement</div>
                <div class="switch-item">
                    <div class="switch-info">
                        <div class="switch-title">Speed Boost</div>
                        <div class="switch-desc">Increase speed</div>
                    </div>
                    <div class="switch" data-switch="speed">
                        <div class="knob"></div>
                    </div>
                </div>
            </div>

            <div class="tab-content" data-content="building">
                <div class="section-title">Building</div>
                <div class="switch-item">
                    <div class="switch-info">
                        <div class="switch-title">Instant Build</div>
                        <div class="switch-desc">Instant construction</div>
                    </div>
                    <div class="switch" data-switch="instant">
                        <div class="knob"></div>
                    </div>
                </div>
            </div>

            <div class="tab-content" data-content="debug">
                <div class="section-title">Debug</div>
                <div class="switch-item">
                    <div class="switch-info">
                        <div class="switch-title">ESP</div>
                        <div class="switch-desc">Enable ESP</div>
                    </div>
                    <div class="switch" data-switch="esp">
                        <div class="knob"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <span>Fantasy UI</span>
            <span>v1.9.1</span>
        </div>
    </div>

    <script>
        const tabs = document.querySelectorAll('.tab');
        const contents = document.querySelectorAll('.tab-content');
        
        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                const tabId = tab.dataset.tab;
                tabs.forEach(t => t.classList.remove('active'));
                tab.classList.add('active');
                contents.forEach(content => {
                    content.classList.remove('active');
                    if(content.dataset.content === tabId) {
                        content.classList.add('active');
                    }
                });
            });
        });
        
        const switches = document.querySelectorAll('.switch');
        switches.forEach(switchEl => {
            switchEl.addEventListener('click', () => {
                switchEl.classList.toggle('active');
                console.log(switchEl.dataset.switch + ':', switchEl.classList.contains('active'));
            });
        });
    </script>
</body>
</html>