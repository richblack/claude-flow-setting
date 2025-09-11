#!/bin/bash

# 為現有專案添加 Claude Flow 支援
# 使用方式: 在專案目錄內執行這個腳本

PROJECT_PATH="."
PROJECT_NAME=$(basename "$(pwd)")

echo "🔍 偵測到專案: $PROJECT_NAME"
echo "📁 目前位置: $(pwd)"

echo "🔧 為現有專案 $PROJECT_NAME 添加 Claude Flow 支援..."

# 創建 rfp/ 如果不存在
if [[ ! -d "rfp" ]]; then
    echo "📁 創建 rfp/ 目錄..."
    mkdir -p rfp
    
    # 創建需求範本
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
else
    echo "✅ rfp/ 目錄已存在"
fi

# 初始化 Claude Flow（如果尚未初始化）
if [[ ! -f ".roomodes" ]]; then
    echo "🌊 初始化 Claude Flow..."
    claude-flow init --sparc 2>/dev/null || true
else
    echo "✅ Claude Flow 已初始化"
fi

# 下載語音通知（如果不存在）
if [[ ! -f "claude_notify.py" ]]; then
    echo "🔊 設置語音通知..."
    curl -sSL https://raw.githubusercontent.com/richblack/Claude-Code-Voice/main/claude_notify.py -o claude_notify.py 2>/dev/null || echo "# 語音通知暫時無法下載" > claude_notify.py
fi

# 創建簡單說明（如果不存在）
if [[ ! -f "CLAUDE_FLOW.md" ]]; then
    cat > CLAUDE_FLOW.md << EOF
# $PROJECT_NAME - Claude Flow 已設置

## 開始工作
1. 編輯 rfp/requirements.md 描述你的需求
2. 告訴 Claude：「請閱讀 rfp/ 開始工作」

## 記憶管理
- 保存：claude-flow memory store "key" "value"
- 讀取：claude-flow memory recall "*"

## 語音通知
python3 claude_notify.py "訊息" "gentle"
EOF
fi

echo ""
echo "✅ 現有專案已設置完成！"
echo ""
echo "📁 專案位置: $(pwd)"
echo ""
echo "下一步："
echo "1. 編輯 rfp/requirements.md 描述你的需求"
echo "2. 告訴 Claude：「請閱讀 rfp/ 開始工作」"
echo ""
echo "💡 提示："
echo "  此腳本已複製到專案目錄，可直接使用："
echo "  curl -sSL https://raw.githubusercontent.com/youlinhsieh/claude-flow/main/setup-existing.sh | bash"