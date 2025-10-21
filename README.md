# Claude Flow 極簡設定

> 本計劃 100% 由 Claude 開發，感謝它。

## ⚡ 快速開始（兩步驟）

### 第一次使用（只需一次）

```bash
# 下載到家目錄
git clone https://github.com/richblack/claude-flow-setting.git ~/claude-flow-setting
```

### 以後任何專案

```bash
# 新專案
mkdir my-project && cd my-project
~/claude-flow-setting/init

# 現有專案
cd existing-project
~/claude-flow-setting/init
```

就這樣！✨

---

## 💡 這是什麼

ClaudeFlow 很強大，ClaudeCode 使用者推薦，但操作複雜，這個 Claude-Flow-Setting 讓專案傻瓜化快速啓動，加一些開發時發現需要的功能，就是我個人的懶人設定。

你不用是程式開發高手（那就不用這種極簡設定了），但不能害怕設定，對系統開發有些理解。

## 🎯 為什麼及是什麼

### 為什麼做這個

開發中的痛點：

- **太複雜**：ClaudeFlow 功能太多，設定複雜，所以指令也非常多，實際上光要看懂它能做什麼就不容易了。
- **不通知**：ClaudeCode 在終端機運作，要人類許可時會停工等你，卻不提醒，如果你切到別的畫面，常常很久後才發現它什麼都沒做在等你。
- **太深奧**：Kiro 寫的需求易懂，ClaudeFlow 的文件專業難懂。

### Claude-Flow-Setting 是什麼

它是一個**極簡化的 Claude Flow 開發環境設定工具**，讓您一鍵完成：

- ✅ **自動化通知**：使用 Claude Code 官方 hooks，需要您時自動彈出（不受上下文壓縮影響）
- ✅ **需求驅動開發**：自動創建 `rfp/` 目錄存放需求文件
- ✅ **開發指南**：自動生成 `CLAUDE.md` 指導 Claude 的開發流程
- ✅ **零額外依賴**：使用系統原生通知工具

### ClaudeFlow 是什麼

就我粗淺的瞭解，它是「工業化 AI Agent」，這是類比於只能簡單開發的「手工業化 AI Agent」，當然功能強大且複雜。

- ClaudeCode 是 AI Agent，而 ClaudeFlow 是建築在它之上的 Multi-Agents。
- 它彌補 ClaudeCode 的不足，可以說是以開發為業者自己的「工廠」。
- 類比現成服務如 Lovable 或 Manus 這種代理，但更強大，因它用強大的 Claude 模型，整合 74 個 MCP Server 的功能，就是擁有自己的 Lovable/ Manus。
- 它是開源專案，你可以自行修改符合你的需求。


## 📦 設定完成後您會得到

```
your-project/
├── rfp/
│   └── requirements.md      # 📝 需求文件（您編輯這個）
├── CLAUDE.md                # 🤖 Claude 開發指南
├── .claude/
│   └── settings.json        # ⚙️  通知 hooks 配置
├── .gitignore               # 🚫 Git 忽略規則
└── README.md                # 📖 專案說明
```

---

## 💡 使用流程

### 1. 編輯需求

```bash
# 在 rfp/requirements.md 中描述您的需求
vim rfp/requirements.md
```

### 2. 開始開發

在 Claude Code 中開啟專案目錄，然後說：

```
請閱讀 rfp/ 開始開發
```

### 3. 自動通知

當 Claude 需要您的注意時，會**自動彈出桌面通知**：

- 🔔 需要您確認決策時
- ⏸️  等待超過 60 秒時
- ✅ 任務完成時

**重點**：這些通知使用 Claude Code 官方 hooks，**不會因上下文壓縮而失效**！

---

## 🔧 前置需求

### 必需

- Claude Code CLI 已安裝
- Git

### 可選（通知功能）

安裝系統通知工具以獲得最佳體驗：

```bash
# macOS
brew install terminal-notifier

# Linux (Ubuntu/Debian)
sudo apt-get install libnotify-bin
```

如果不安裝，通知會退化到終端訊息，功能仍可正常運作。

---

## 📋 開發最佳實踐

### 記憶系統

Claude Flow 支援記憶功能，善用它來保存進度：

```bash
# 開始工作時 - 恢復記憶
claude-flow memory recall "*"

# 重要決策記錄
claude-flow memory store "architecture" "使用微服務架構"

# 保存進度
claude-flow memory store "progress" "完成用戶認證模組"

# 結束工作時 - 查看所有記憶
claude-flow memory query "*"
```

### SPARC 開發模式

使用專業化的開發代理：

```bash
# 架構設計
claude-flow sparc run architect "根據 rfp/ 設計系統架構"

# 開發實作
claude-flow sparc run coder "實作用戶認證功能"

# 測試驅動開發
claude-flow sparc run tdd "建立測試套件"

# 安全稽核
claude-flow sparc run security-review "檢查安全漏洞"
```

---

## 🔔 通知系統運作原理

### Claude Code 官方 Hooks

此專案使用 Claude Code 的官方 hooks 機制：

**配置檔案**: `.claude/settings.json`

```json
{
  "hooks": {
    "Notification": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "terminal-notifier -message \"Claude Code 需要您的注意\" ..."
          }
        ]
      }
    ],
    "Stop": [...]
  }
}
```

### 觸發時機

- **Notification Hook**: Claude 需要許可時，或閒置 60 秒時
- **Stop Hook**: 任務完成時

### 為什麼穩定可靠？

- ✅ 系統級別的 hook，不在 Claude 的上下文中
- ✅ 即使上下文窗口被壓縮，hooks 仍會觸發
- ✅ 不依賴 Claude 記得要發通知

---

## 🛠 故障排除

### 通知不出現？

1. **檢查通知工具是否安裝**
   ```bash
   # macOS
   which terminal-notifier

   # Linux
   which notify-send
   ```

2. **檢查系統通知權限**
   - macOS: 系統偏好設定 → 通知
   - Linux: 確認通知守護程式運行中

3. **測試通知**
   ```bash
   # macOS
   terminal-notifier -message "測試" -title "Claude Code"

   # Linux
   notify-send "Claude Code" "測試"
   ```

### Claude Flow 指令找不到？

確認 Claude Flow 已正確安裝：

```bash
which claude-flow

# 如果沒有，請安裝
# 參考: https://github.com/ruvnet/claude-flow
```

### 想要更豐富的通知？

如果您想要智能音效選擇、自動 emoji 等進階功能，可以考慮安裝：

- [cat-ccnotify-hook](https://github.com/nkygit/cat-ccnotify-hook) - 進階通知系統

但基本版本已經足夠穩定可靠！

---

## 🔗 相關資源

- **Claude Flow**: https://github.com/ruvnet/claude-flow
- **Claude Code 文檔**: https://docs.claude.com/en/docs/claude-code
- **此專案**: https://github.com/richblack/claude-flow-setting

---

## 📝 範例工作流程

### 早上開始工作

```bash
cd my_project

# 1. 恢復記憶
claude-flow memory recall "*"

# 2. 在 Claude Code 中開啟專案
# 3. 告訴 Claude: "請閱讀 rfp/ 繼續昨天的工作"
```

### 開發過程

Claude 會自動：
- 📖 閱讀 `rfp/requirements.md` 理解需求
- 🏗️ 規劃架構
- 💻 編寫程式碼
- 🧪 建立測試
- 🔔 需要您時自動通知

您只需要：
- ✅ 回應 Claude 的問題
- ✅ 檢視和確認變更
- ✅ 提供反饋

### 晚上結束

```bash
# 保存今日進度
claude-flow memory store "daily" "$(date): 完成用戶認證和資料庫設計"

# 提交變更
git add .
git commit -m "完成用戶認證功能"
git push
```

---

## ⚡ 核心理念

**讓 Claude 主導開發，您專注於決策**

1. 📝 您寫需求 (`rfp/requirements.md`)
2. 🤖 Claude 讀需求並開發
3. 🔔 需要您時自動通知
4. ✅ 您做決策和確認
5. 💾 自動保存記憶
6. 🔄 明天無縫繼續

---

**就這麼簡單！一個指令，開始開發** 🎉
