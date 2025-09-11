#!/bin/bash

# Claude Flow Setting 快速安裝
# 使用方式：curl -sSL https://raw.githubusercontent.com/richblack/claude-flow-setting/main/install.sh | bash -s [project_name]
# 新專案：curl -sSL https://raw.githubusercontent.com/richblack/claude-flow-setting/main/install.sh | bash -s my_project
# 現有專案：在專案目錄內執行 curl -sSL https://raw.githubusercontent.com/richblack/claude-flow-setting/main/install.sh | bash

PROJECT_NAME=${1:-""}
CURRENT_DIR=$(basename "$(pwd)")
REPO_URL="https://raw.githubusercontent.com/richblack/claude-flow-setting/main"

echo "🌊 Claude Flow Setting 快速安裝"
echo ""

# 如果有專案名稱，創建新專案
if [[ -n "$PROJECT_NAME" ]]; then
    echo "🚀 創建新專案: $PROJECT_NAME"
    
    mkdir -p "$PROJECT_NAME/rfp"
    cd "$PROJECT_NAME"
    
    # 下載需求範本
    cat > rfp/requirements.md << EOF
# $PROJECT_NAME 需求

## 我要做什麼
[寫你的需求]

## 技術細節（選填）
- 語言：
- 框架：
EOF

    # 初始化 Claude Flow
    claude-flow init --sparc 2>/dev/null || echo "⚠️ 請確認 claude-flow 已安裝"
    
    # 下載完整的 claude-code-voice 系統
    echo "📥 下載 Claude Code Voice 系統..."
    if command -v git >/dev/null 2>&1; then
        git clone https://github.com/richblack/Claude-Code-Voice.git claude-code-voice 2>/dev/null || \
        echo "⚠️ 無法下載 Claude Code Voice，將使用簡化版本"
    else
        # 如果沒有 git，下載主要文件
        mkdir -p claude-code-voice
        curl -sSL https://raw.githubusercontent.com/richblack/Claude-Code-Voice/main/claude_notify.py -o claude-code-voice/claude_notify.py 2>/dev/null
        curl -sSL https://raw.githubusercontent.com/richblack/Claude-Code-Voice/main/requirements.txt -o claude-code-voice/requirements.txt 2>/dev/null
        curl -sSL https://raw.githubusercontent.com/richblack/Claude-Code-Voice/main/README.md -o claude-code-voice/README.md 2>/dev/null
    fi
    
    # 創建便捷的語音通知腳本
    cat > claude_notify.py << 'EOF'
#!/usr/bin/env python3
# Claude Code Voice 便捷腳本
import sys
import os
import subprocess

# 嘗試使用完整的 claude-code-voice
claude_voice_path = os.path.join(os.path.dirname(__file__), 'claude-code-voice', 'claude_notify.py')
if os.path.exists(claude_voice_path):
    subprocess.run([sys.executable, claude_voice_path] + sys.argv[1:])
else:
    # 回退到簡單版本
    import platform
    
    def speak(message, emotion="gentle"):
        prefixes = {
            "gentle": "嗨，打擾一下，",
            "urgent": "快來看看！",
            "excited": "太棒了！",
            "worried": "糟糕，",
            "thinking": "嗯...讓我想想，"
        }
        full_message = prefixes.get(emotion, "") + message
        
        if platform.system() == "Darwin":
            try:
                subprocess.run(["say", full_message], check=True)
            except:
                print(f"🔊 {full_message}")
        else:
            print(f"🔊 {full_message}")
    
    if len(sys.argv) >= 2:
        message = sys.argv[1]
        emotion = sys.argv[2] if len(sys.argv) > 2 else "gentle"
        speak(message, emotion)
EOF
    
    chmod +x claude_notify.py 2>/dev/null
    
    
    echo ""
    echo "✅ 新專案 $PROJECT_NAME 創建完成！"
    echo ""
    echo "📁 專案位置: $(pwd)"
    echo ""
    echo "下一步："
    echo "1. 編輯 rfp/requirements.md"
    echo "2. 在 Claude Code 中開啟此目錄"
    echo "3. 告訴 Claude：「請閱讀 rfp/ 開始開發」"
    
else
    # 在現有專案中設定
    echo "🔧 在現有專案 '$CURRENT_DIR' 中設定 Claude Flow..."
    
    # 創建 rfp/ 如果不存在
    if [[ ! -d "rfp" ]]; then
        mkdir -p rfp
        cat > rfp/requirements.md << EOF
# $CURRENT_DIR 專案需求

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
    
    # 下載完整的 claude-code-voice 系統
    if [[ ! -d "claude-code-voice" ]]; then
        echo "📥 下載 Claude Code Voice 系統..."
        if command -v git >/dev/null 2>&1; then
            git clone https://github.com/richblack/Claude-Code-Voice.git claude-code-voice 2>/dev/null || \
            echo "⚠️ 無法下載 Claude Code Voice，將使用簡化版本"
        else
            # 如果沒有 git，下載主要文件
            mkdir -p claude-code-voice
            curl -sSL https://raw.githubusercontent.com/richblack/Claude-Code-Voice/main/claude_notify.py -o claude-code-voice/claude_notify.py 2>/dev/null
            curl -sSL https://raw.githubusercontent.com/richblack/Claude-Code-Voice/main/requirements.txt -o claude-code-voice/requirements.txt 2>/dev/null
            curl -sSL https://raw.githubusercontent.com/richblack/Claude-Code-Voice/main/README.md -o claude-code-voice/README.md 2>/dev/null
        fi
    fi
    
    # 創建便捷的語音通知腳本
    if [[ ! -f "claude_notify.py" ]]; then
        cat > claude_notify.py << 'EOF'
#!/usr/bin/env python3
# Claude Code Voice 便捷腳本
import sys
import os
import subprocess

# 嘗試使用完整的 claude-code-voice
claude_voice_path = os.path.join(os.path.dirname(__file__), 'claude-code-voice', 'claude_notify.py')
if os.path.exists(claude_voice_path):
    subprocess.run([sys.executable, claude_voice_path] + sys.argv[1:])
else:
    # 回退到簡單版本
    import platform
    
    def speak(message, emotion="gentle"):
        prefixes = {
            "gentle": "嗨，打擾一下，",
            "urgent": "快來看看！",
            "excited": "太棒了！",
            "worried": "糟糕，",
            "thinking": "嗯...讓我想想，"
        }
        full_message = prefixes.get(emotion, "") + message
        
        if platform.system() == "Darwin":
            try:
                subprocess.run(["say", full_message], check=True)
            except:
                print(f"🔊 {full_message}")
        else:
            print(f"🔊 {full_message}")
    
    if len(sys.argv) >= 2:
        message = sys.argv[1]
        emotion = sys.argv[2] if len(sys.argv) > 2 else "gentle"
        speak(message, emotion)
EOF
        chmod +x claude_notify.py
    fi
    
    
    echo ""
    echo "✅ 現有專案設定完成！"
    echo ""
    echo "下一步："
    echo "1. 編輯 rfp/requirements.md"  
    echo "2. 告訴 Claude：「請閱讀 rfp/ 開始工作」"
fi

echo ""
echo "🔗 更多資訊: https://github.com/richblack/claude-flow-setting"
echo "📖 完整指南: curl -sSL https://raw.githubusercontent.com/richblack/claude-flow-setting/main/README.md"