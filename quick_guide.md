# Leo 的 Claude Flow 極簡指南

## 🎯 核心概念

Claude Flow 幫你：

1. **記憶**：斷點續傳，不會忘記工作進度
2. **研究**：先讀懂需求再開發
3. **通知**：需要你時會發聲

---

## ⚡ 只需記住 3 個指令

### 1️⃣ 新專案 = 一個指令

```bash
cd ~/Documents/claude-flow
./new-project-setup.sh my_project
```

**現有專案**（在專案目錄內）：
```bash
# 複製設定腳本到專案並執行
cp ~/Documents/claude-flow/setup.sh . && ./setup.sh
```

然後編輯 `rfp/` 裡的需求文件就好

### 2️⃣ 開始工作 = 讀取記憶

```bash
claude-flow memory recall "*"  # Claude 會記起所有工作
```

### 3️⃣ 結束工作 = 保存記憶  

```bash
claude-flow memory store "progress" "今天完成了XXX功能"
```

---

## 💡 實際工作流程

### 早上開始工作

```bash
cd my_project
claude-flow memory recall "*"           # 叫醒記憶
python3 claude_notify.py "開始工作" "gentle"  # 語音通知
```

### 開發中 (讓 Claude 主導)

```bash
# 研究需求 (Claude 會自己讀 rfp/)
claude-flow sparc run research "請仔細閱讀 rfp/ 需求"

# 開發 (Claude 會根據需求自動規劃)
claude-flow sparc run architect "根據需求設計架構"
claude-flow sparc run coder "開始實作"
```

### 晚上結束

```bash
claude-flow memory store "daily" "今日進度：完成登入功能"
python3 claude_notify.py "明天見" "excited"
```

---

## 🔄 當機或重啟後

```bash
# 就這一個指令
claude-flow memory recall "*"
# Claude 會自己恢復狀態繼續工作
```

---

## 🗂 極簡檔案結構

```txt
claude-flow/                    # 你的工作目錄
├── new-project-setup.sh       # 新專案腳本
├── setup-existing.sh          # 現有專案腳本
├── quick_guide.md             # 這個指南
└── my_project/                # 你的專案
    ├── rfp/                   # 你的需求 (唯一需要編輯的)
    └── (其他 Claude 自己會建立)
```

---

## 🆘 遇到問題？

### Claude 忘記了？

```bash
claude-flow memory recall "*"
```

### 需要 Claude 注意你？

```bash
python3 claude_notify.py "需要幫助" "urgent"
```

### 想知道 Claude 在做什麼？

```bash
claude-flow status
```

---

## 📌 記住：讓 Claude 主導

你只需要：

1. 寫好需求在 `rfp/`
2. 告訴 Claude：「請閱讀 rfp/ 開始開發」
3. Claude 會自己規劃、研究、開發、測試
4. 需要你時會發聲通知

**不用管細節，Claude Flow 會處理一切**
