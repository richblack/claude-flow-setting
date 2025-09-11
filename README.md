# Claude Flow 的極簡設定

## 🎯 這是什麼

Claude Flow 設置複雜，我做了一個超簡化 Claude Flow 設定，讓你：

- **記憶**：斷點續傳，不會忘記工作進度
- **研究**：先讀懂需求再開發
- **通知**：需要你時會發聲
- **一鍵設定**：新專案和現有專案都只需一個指令

---

## 🚀 立即開始

### 方法一：從 GitHub 安裝（需要公開儲存庫）

> ⚠️ **注意**：如果儲存庫是私有的，請使用方法二

#### 新專案 - 一個指令搞定

```bash
curl -sSL https://raw.githubusercontent.com/richblack/claude-flow-setting/main/install.sh | bash -s my_awesome_project
```

#### 現有專案 - 在專案目錄內執行

```bash
curl -sSL https://raw.githubusercontent.com/richblack/claude-flow-setting/main/install.sh | bash
```

### 方法二：克隆後本地安裝（適用於私有儲存庫）

#### 新專案

```bash
git clone https://github.com/richblack/claude-flow-setting.git temp-setup
cd temp-setup
./install.sh my_awesome_project
cd ../my_awesome_project
rm -rf ../temp-setup
```

#### 現有專案

```bash
git clone https://github.com/richblack/claude-flow-setting.git temp-setup
temp-setup/install.sh
rm -rf temp-setup
```

---

## ⚡ 只需記住 3 個核心指令

### 1️⃣ 開始工作 = 讀取記憶

```bash
claude-flow memory recall "*"  # Claude 會記起所有工作
```

### 2️⃣ 結束工作 = 保存記憶  

```bash
claude-flow memory store "progress" "今天完成了XXX功能"
```

### 3️⃣ 語音通知

```bash
python3 claude_notify.py "開始工作" "gentle"  # 語音通知
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

## 🗂 極簡專案結構

設定完成後，每個專案會有：

```txt
my_project/
├── rfp/requirements.md      # 你編輯需求（唯一需要編輯的）
├── claude-code-voice/       # 完整語音通知系統
│   ├── claude_notify.py     # 主要腳本
│   └── ...                  # 其他功能文件
├── claude_notify.py         # 便捷腳本
└── (Claude 建立的其他檔案)
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

## 📌 核心概念：讓 Claude 主導

你只需要：

1. 寫好需求在 `rfp/`
2. 告訴 Claude：「請閱讀 rfp/ 開始開發」
3. Claude 會自己規劃、研究、開發、測試
4. 需要你時會發聲通知

## 重點記住

不用管細節，Claude Flow 會處理一切

---

## 🔊 語音通知系統

使用完整的 [Claude Code Voice](https://github.com/richblack/Claude-Code-Voice) 系統，包含：

### 🎯 核心功能

- **Mac 通知中心顯示** - 視覺 + 語音雙重通知
- **靜音模式** - 只有通知沒有語音
- **藍牙耳機偵測** - 自動切換語音模式
- **AI 自由發言** - Claude 可以說任何想說的話

### 📱 通知模式

- `urgent` - 緊急事件 (快來看看！)
- `gentle` - 一般通知 (嗨，打擾一下，)
- `excited` - 正面消息 (太棒了！)
- `worried` - 問題警告 (糟糕，)
- `thinking` - 需要思考 (嗯...讓我想想，)

```bash
python3 claude_notify.py "訊息內容" "情緒類型"
```

### 🎧 智慧偵測

- 自動偵測藍牙或有線耳機
- 連上耳機時自動啟用語音
- 拔掉耳機時切換到靜音 + 通知模式

---

## 🤖 SPARC 開發模式

Claude Flow 使用 SPARC (Systematic Programming, Architecture, Research, and Coordination) 開發系統：

### 架構與設計

- `claude-flow sparc run architect "設計系統架構"`
- `claude-flow sparc run ui-ux "設計用戶介面"`
- `claude-flow sparc run database "設計資料庫結構"`

### 開發實作

- `claude-flow sparc run coder "實作用戶認證"`
- `claude-flow sparc run api "建立 REST API"`
- `claude-flow sparc run mobile "開發行動應用"`

### 測試與品質

- `claude-flow sparc run tdd "建立測試套件"`
- `claude-flow sparc run qa "品質保證測試"`

---

## 🧠 記憶系統

Claude Flow 具備持久記憶系統：

```bash
# 儲存專案資訊
claude-flow memory store "requirements" "用戶認證使用 JWT"
claude-flow memory store "architecture" "微服務設計模式"

# 查詢記憶
claude-flow memory query "auth"
claude-flow memory recall "architecture/*"
```

---

## 📈 監控與分析

```bash
# 系統狀態監控
claude-flow status

# 啟動 Web UI 監控面板
claude-flow start --ui --port 3000
```

---

## 🔗 相關資源

- **Claude Flow**: <https://github.com/ruvnet/claude-flow>
- **語音通知**: <https://github.com/richblack/Claude-Code-Voice>
- **此專案**: <https://github.com/richblack/claude-flow-setting>

---

**就這麼簡單！不用記複雜指令，Claude Flow 會處理一切** 🎉
