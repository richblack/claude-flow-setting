#!/bin/bash

# Claude Flow 快速設定腳本
# 在任何專案目錄內執行即可

PROJECT_NAME=$(basename "$(pwd)")

echo "🚀 為 $PROJECT_NAME 添加 Claude Flow 支援..."

# 創建 rfp/ 如果不存在
if [[ ! -d "rfp" ]]; then
    mkdir -p rfp
    cat > rfp/requirements.md << EOF
# $PROJECT_NAME 專案需求

## 現有專案狀況
[描述目前專案的狀態]

## 我想要改進/添加什麼
[寫你的新需求]

## 技術細節
- 語言：
- 框架：
- 現有架構：
EOF
    echo "✅ 已創建 rfp/requirements.md"
fi

# 初始化 Claude Flow
if [[ ! -f ".roomodes" ]]; then
    claude-flow init --sparc 2>/dev/null || echo "⚠️ 請確認 claude-flow 已安裝"
fi

# 複製語音通知腳本
if [[ ! -f "claude_notify.py" ]]; then
    if [[ -f "~/Documents/claude-flow/claude_notify.py" ]]; then
        cp ~/Documents/claude-flow/claude_notify.py .
    else
        # 創建簡單的語音通知
        cat > claude_notify.py << 'EOF'
#!/usr/bin/env python3
import sys
import subprocess
import platform

def speak(message, emotion="gentle"):
    prefixes = {
        "gentle": "嗨，打擾一下，",
        "urgent": "快來看看！",
        "excited": "太棒了！"
    }
    full_message = prefixes.get(emotion, "") + message
    
    if platform.system() == "Darwin":  # macOS
        subprocess.run(["say", full_message])
    else:
        print(f"🔊 {full_message}")

if __name__ == "__main__":
    if len(sys.argv) >= 2:
        message = sys.argv[1]
        emotion = sys.argv[2] if len(sys.argv) > 2 else "gentle"
        speak(message, emotion)
EOF
    fi
    chmod +x claude_notify.py
fi

echo ""
echo "✅ 設定完成！"
echo ""
echo "下一步："
echo "1. 編輯 rfp/requirements.md"  
echo "2. 告訴 Claude：「請閱讀 rfp/ 開始工作」"