# Leo 的 Claude Flow 工作流程

## 🎯 這是什麼

一個超簡化的 Claude Flow 設定，讓你：
- 一個指令創建新專案
- 一個指令設定現有專案  
- Claude 自動記憶工作進度
- 需要你時會語音通知

## 🚀 立即開始

### 新專案
```bash
cd ~/Documents/claude-flow
./new-project-setup.sh my_awesome_project
```

### 現有專案（在專案目錄內執行）
```bash
cp ~/Documents/claude-flow/setup.sh . && ./setup.sh
```

## 📋 日常使用

```bash
# 早上開始工作
cd my_project
claude-flow memory recall "*"  # Claude 記起所有進度

# 告訴 Claude 開始工作
"請閱讀 rfp/ 開始開發"

# 晚上結束
claude-flow memory store "daily" "今天完成登入功能"
```

## 🔧 核心檔案

- `new-project-setup.sh` - 創建新專案
- `setup-existing.sh` - 設定現有專案
- `quick_guide.md` - 詳細使用指南

## 📁 專案結構

每個專案會有：
```txt
my_project/
├── rfp/requirements.md    # 你編輯需求
├── claude_notify.py       # 語音通知
├── CLAUDE_FLOW.md        # 使用說明
└── (Claude 建立的其他檔案)
```

## 💡 核心概念

1. **寫需求在 rfp/**：告訴 Claude 你要什麼
2. **讓 Claude 主導**：研究、規劃、開發、測試都交給它
3. **自動記憶**：斷點續傳，不會忘記進度
4. **語音通知**：需要你時會發聲

## 🆘 遇到問題

```bash
# Claude 忘記了？
claude-flow memory recall "*"

# 需要 Claude 注意？
python3 claude_notify.py "需要幫助" "urgent"

# 想知道 Claude 在做什麼？
claude-flow status
```

---

**就這麼簡單！不用記複雜指令，Claude Flow 會處理一切** 🎉