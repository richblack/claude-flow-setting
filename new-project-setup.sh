#!/bin/bash

# Leo 的 Claude Flow 極簡專案設置
# 一個指令搞定所有設定

PROJECT_NAME=${1:-""}

if [[ -z "$PROJECT_NAME" ]]; then
    echo "使用方式: $0 <project_name>"
    echo "例如: $0 my_project"
    exit 1
fi

echo "🚀 創建 Claude Flow 專案: $PROJECT_NAME"

# 創建專案
mkdir -p "$PROJECT_NAME/rfp"
cd "$PROJECT_NAME"

# 需求範本
cat > rfp/requirements.md << EOF
# $PROJECT_NAME 需求

## 我要做什麼
[寫你的需求]

## 技術細節（選填）
- 語言：
- 框架：
EOF

# 初始化 Claude Flow
claude-flow init --sparc 2>/dev/null || true

# 語音通知（從 GitHub 取得）
curl -sSL https://raw.githubusercontent.com/richblack/Claude-Code-Voice/main/claude_notify.py -o claude_notify.py 2>/dev/null || echo "# 語音通知暫時無法下載" > claude_notify.py

# 簡單說明
cat > README.md << EOF
# $PROJECT_NAME

## 開始工作
1. 編輯 rfp/requirements.md
2. 告訴 Claude：「請閱讀 rfp/ 開始開發」

## 記憶管理
- 保存：claude-flow memory store "key" "value"
- 讀取：claude-flow memory recall "*"

## 語音通知
python3 claude_notify.py "訊息" "gentle"
EOF

echo ""
echo "✅ 完成！"
echo ""
echo "📁 專案位置: $(pwd)"
echo ""
echo "下一步："
echo "1. 編輯 rfp/requirements.md"
echo "2. 在 Claude Code 中開啟此目錄"
echo "3. 告訴 Claude：「請閱讀 rfp/ 開始開發」"