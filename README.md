# Claude Flow 極簡設定

> 本計劃 100% 由 Claude 開發，感謝它的辛苦。

## 💡 這是什麼

ClaudeFlow 很強大，推薦所有 ClaudeCode 使用者使用，但它複雜，本專案讓 ClaudeFlow 專案傻瓜化快速啓動，又加上一些開發時發現需要的功能，基本是我個人的懶人設定。

### 🎯 為什麼及是什麼

#### 為什麼做這個

開發中的痛點：

- **太複雜**：ClaudeFlow 功能太多，設定複雜，所以指令也非常多，實際上光要看懂它能做什麼就不容易了。
- **不通知**：ClaudeCode 在終端機運作，要人類許可時會停工等你，卻不提醒，如果你切到別的畫面，常常很久後才發現它什麼都沒做在等你。
- **太深奧**：Kiro 寫的需求易懂，ClaudeFlow 的文件專業難懂。

#### Claude-Flow-Setting 是什麼

它是一個**極簡化的 Claude Flow 開發環境設定工具**，讓您一鍵完成：

- ✅ **自動化通知**：使用 Claude Code 官方 hooks，需要您時自動彈出（不受上下文壓縮影響）
- ✅ **需求驅動開發**：自動創建 `rfp/` 目錄存放需求文件
- ✅ **開發指南**：自動生成 `CLAUDE.md` 指導 Claude 的開發流程
- ✅ **零額外依賴**：使用系統原生通知工具

#### ClaudeFlow 是什麼

就我粗淺的瞭解，它是「工業化 AI Agent」，這是類比於只能簡單開發的「手工業化 AI Agent」，當然功能強大且複雜。

- ClaudeCode 是 AI Agent，而 ClaudeFlow 是建築在它之上的 Multi-Agents。
- 它彌補 ClaudeCode 的不足，可以說是以開發為業者自己的「工廠」。
- 類比現成服務如 Lovable 或 Manus 這種代理，但更強大，因它用強大的 Claude 模型，整合 74 個 MCP Server 的功能，就是擁有自己的 Lovable/ Manus。
- 它是開源專案，你可以自行修改符合你的需求。
---

## ⚡ 快速開始（2 步驟）

### 第一次使用（只需一次）

打開終端機，把這些檔案下載到家目錄，或你喜歡的目錄（改後面的 `~/path/to/claude-flow-setting`）。

```bash
git clone https://github.com/richblack/claude-flow-setting.git ~/claude-flow-setting
```

### 已經下載過？更新到最新版本

```bash
cd ~/claude-flow-setting
git pull origin main
```

> **重要**：更新後，**現有專案**需要重新執行 `init` 才能獲得 `/vibe-coding` 指令！

**為現有專案安裝新功能：**
```bash
# 進入你的專案
cd your-existing-project

# 重新執行 init（會自動偵測已存在的檔案，不會覆蓋）
~/claude-flow-setting/init
```

這會安裝 `/vibe-coding` 指令到你的專案中。

### 以後任何專案

新專案設定

```bash
mkdir my-project && cd my-project
~/claude-flow-setting/init
```

現有專案設定

```bash
cd existing-project
~/claude-flow-setting/init
```
新舊專案指令都一樣，它會自己分辨。

就這樣！✨

**設定完成後**，你會得到一個完整的 Vibe Coding 開發環境（見下方說明）。

---

## 📖 一天的開發故事

想像你是一位開發者，這是你使用 Claude Flow Setting 的一天...

### 🌅 早上 9:00 - 繼續昨天的專案

```bash
# 打開昨天的專案
cd my-shop-project

# 恢復記憶，讓 Claude 知道昨天做了什麼
claude-flow memory export && cat memory-export-*.json
```

在 Claude Code 中說：「請閱讀 rfp/ 繼續昨天的工作」

Claude 讀取 **Spec 文件**（`rfp/requirements.md`、`rfp/design.md`），理解需求後繼續開發購物車功能。

### 🚀 早上 10:30 - 老闆要你開新專案

老闆要你做一個部落格系統，你立刻：

```bash
# 建立新專案並快速設定
mkdir blog-system && cd blog-system
~/claude-flow-setting/init
```

30 秒後專案設定完成！你用自然語言在 `rfp/requirements.md` 寫下想法：

```markdown
我要做一個部落格系統，使用者可以註冊、發文、留言...
```

告訴 Claude：「請用 `/vibe-coding` 處理需求」

Claude 啟動 **Spec Driven 工作流程**：
- 📋 產生 User Stories
- ✅ 寫出 EARS 驗收標準
- 🏗️ 設計系統架構
- 📝 分解成任務清單

5 分鐘後，完整的規格文件就在 `rfp/` 目錄裡了！

### ☕ 上午 11:00 - 去喝咖啡，Claude 在工作

你告訴 Claude：「請用 `sparc run architect` 優化架構設計」

```bash
claude-flow sparc run architect "根據 rfp/design.md 優化系統架構"
```

你去泡咖啡。3 分鐘後，**桌面通知彈出** 🔔：「Claude Code 需要您的注意」

原來 Claude 在資料庫選擇上需要你決策。你快速回答後，繼續去喝咖啡。

### 🎯 下午 2:00 - 接手同事的爛攤子

同事離職，留下一個沒用 Claude Flow 的專案。你接手：

```bash
cd legacy-project
~/claude-flow-setting/init
```

設定完成後，你用 `/vibe-coding` 反向工程：
- 讓 Claude 分析現有程式碼
- 產生缺失的 Spec 文件
- 建立任務清單補完功能

現在這個專案也變得井井有條了！

### 🏗️ 下午 3:30 - 複雜功能用 Swarm 加速

部落格的「推薦系統」很複雜，你決定用 **Swarm** 多 Agent 並行處理：

```bash
claude-flow swarm "實作部落格推薦系統" \
  --strategy development \
  --max-agents 3 \
  --parallel
```

三個 AI Agents 同時工作：
- Agent 1: 設計推薦演算法
- Agent 2: 實作資料收集
- Agent 3: 建立測試

速度快了 3 倍！中間需要你確認時，**通知會自動彈出** 🔔

### 🌆 傍晚 6:00 - 存檔下班

```bash
# 保存今天的所有進度
claude-flow memory store "progress" "$(date): 完成購物車、建立部落格 Spec、接手舊專案、實作推薦系統"

# 提交程式碼
git add . && git commit -m "今日進度" && git push
```

明天來，只要 `claude-flow memory export && cat memory-export-*.json`，就能無縫接續！

---

## 💡 故事中的三個關鍵

### 1️⃣ Claude Flow 快速設定

- **任何專案**：`~/claude-flow-setting/init` 就搞定
- **SPARC 模式**：單一功能用 `sparc run [role]`（如 architect、coder、tdd）
- **Swarm 模式**：複雜任務用 `swarm` 多 Agent 並行

詳細說明 → [Claude Flow 開發指令](#-claudeflow-開發指令)

### 2️⃣ Spec Driven 開發

- 用**自然語言**寫需求在 `rfp/requirements.md`
- 執行 `/vibe-coding` 自動產生完整 Spec
- 得到：User Stories + EARS 標準 + 系統設計 + 任務清單

詳細說明 → [Vibe Coding 詳解](#-vibe-coding-詳解)

### 3️⃣ 智能通知系統

- 使用 Claude Code **官方 hooks**
- 需要你時**自動彈出桌面通知** 🔔
- **不受上下文壓縮影響**，永遠可靠

詳細說明 → [通知系統運作原理](#-通知系統運作原理)

---

## 📚 Claude Flow 開發指令

### 記憶系統

Claude Flow 支援記憶功能，善用它來保存進度：

```bash
# 開始工作時 - 恢復記憶
claude-flow memory export && cat memory-export-*.json

# 重要決策記錄
claude-flow memory store "architecture" "使用微服務架構"

# 保存進度
claude-flow memory store "progress" "完成用戶認證模組"

# 結束工作時 - 查看記憶統計
claude-flow memory stats
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

**何時使用 SPARC？**
- 單一、專注的開發任務
- 需要特定角色專業知識（architect、coder、tdd、security 等）
- 已有明確的任務定義

### Swarm 模式

多個 AI Agents 並行處理複雜任務：

```bash
# 基本使用
claude-flow swarm "建立完整的用戶認證系統" \
  --strategy development \
  --max-agents 3 \
  --parallel

# 監控進度
claude-flow swarm status
```

**何時使用 Swarm？**
- 複雜、多面向的大型任務
- 可以分解成多個並行子任務
- 需要快速完成（多 Agent 並行）

---

## 🌟 Vibe Coding 詳解

受 Amazon Kiro IDE 啟發，實現**從自然語言需求到可執行任務**的完整工作流程。

### 什麼是 Vibe Coding？

就像和朋友聊天一樣描述你的想法，AI 會幫你轉換成清晰的開發計畫：

```
💬 自然語言需求（隨意描述你的想法）
  ↓
📋 User Story Mapping（理解用戶故事）
  ↓
✅ EARS 驗收標準（明確功能要求）
  ↓
🏗️ 系統設計（技術架構規劃）
  ↓
📝 任務分解（可執行的開發清單）
  ↓
🚀 開始開發
```

### 如何使用？

> ⚠️ **重要提醒 (2025-01-26)**：VSCode Extension 2.0.27 目前存在 bug，無法載入自定義 slash commands。
>
> **暫時解決方案**：請使用 Terminal 中的 Claude CLI
> ```bash
> # 在專案目錄中執行
> claude
> # 然後輸入 /vibe-coding
> ```
>
> **症狀判斷**：如果你在 VSCode Extension 中輸入 `/` 只看到 10 個內建指令（如 /compact, /context, /cost 等），但看不到 `/vibe-coding`，就是遇到這個 bug。
>
> **好消息**：Terminal CLI 版本 (2.0.26) 完全正常，所有自定義指令都能使用！

#### 方法 1: 使用 Slash Command（推薦 - Terminal CLI）

在 VSCode 的 Terminal 中執行：

```bash
claude
```

然後在 Claude CLI 中輸入：

```
/vibe-coding
```

按照提示逐步完成 5 個階段。

#### 方法 2: 手動建立需求文件

1. 在 `rfp/requirements.md` 用自然語言描述需求
2. 告訴 Claude：「請閱讀 rfp/ 開始開發」
3. AI 會理解需求、設計架構、分解任務

### 你會得到什麼？

完整的專案文檔：
- `rfp/initial-requirements.md` - 原始需求
- `rfp/requirements.md` - User Stories + EARS 驗收標準
- `rfp/design.md` - 系統設計文件
- `rfp/tasks.md` - 任務清單（可追蹤進度）

更多詳細說明請參考 [rfp/README.md](rfp/README.md)

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

## 🔧 安裝前置需求

> **重要說明**：Claude Flow Setting 本身不需要安裝，只是一個設定腳本。
> 但它需要依賴以下系統來運作，請確保這些系統已正確安裝。

### ✅ 必需安裝（沒有就無法使用）

#### 1. Claude Code

**檢查是否已安裝：**
```bash
claude --version
```

**如果沒有安裝：**
- 官方網站：https://claude.ai/download
- 說明文件：https://docs.claude.com/en/docs/claude-code

---

#### 2. Git

**檢查是否已安裝：**
```bash
git --version
```

**如果沒有安裝：**
- macOS: `brew install git` 或從 https://git-scm.com/download/mac 下載
- Linux: `sudo apt-get install git` (Ubuntu/Debian) 或 `sudo yum install git` (CentOS/RHEL)
- Windows: https://git-scm.com/download/win

---

#### 3. Claude Flow

**檢查是否已安裝：**
```bash
claude-flow --version
# 或
which claude-flow
```

**如果沒有安裝：**
- GitHub：https://github.com/ruvnet/claude-flow
- 安裝說明：https://github.com/ruvnet/claude-flow#installation

---

### 🔔 建議安裝（通知功能）

通知工具**不是必需的**，但強烈建議安裝以獲得最佳體驗。

#### macOS - terminal-notifier

**檢查是否已安裝：**
```bash
which terminal-notifier
```

**安裝方式：**
```bash
brew install terminal-notifier
```

**測試通知：**
```bash
terminal-notifier -message "測試通知" -title "Claude Code"
```

---

#### Linux - libnotify

**檢查是否已安裝：**
```bash
which notify-send
```

**安裝方式：**
```bash
# Ubuntu/Debian
sudo apt-get install libnotify-bin

# CentOS/RHEL
sudo yum install libnotify
```

**測試通知：**
```bash
notify-send "Claude Code" "測試通知"
```

---

### 📋 快速檢查清單

執行以下指令檢查所有必需元件：

```bash
echo "=== 檢查必需元件 ==="
echo -n "Claude Code: " && claude --version 2>/dev/null || echo "❌ 未安裝"
echo -n "Git: " && git --version 2>/dev/null || echo "❌ 未安裝"
echo -n "Claude Flow: " && claude-flow --version 2>/dev/null || echo "❌ 未安裝"

echo ""
echo "=== 檢查通知工具（可選）==="
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -n "terminal-notifier: " && which terminal-notifier 2>/dev/null || echo "⚠️  未安裝（建議安裝）"
else
    echo -n "notify-send: " && which notify-send 2>/dev/null || echo "⚠️  未安裝（建議安裝）"
fi
```

---

### 💡 沒有通知工具會怎樣？

如果不安裝通知工具：
- ✅ 所有功能仍可正常運作
- ⚠️  通知會退化為終端文字訊息
- ⚠️  切換到其他視窗時不會收到提醒

**建議**：花 1 分鐘安裝通知工具，體驗會好很多！

---

### 🎨 進階選項

如果你想要更豐富的通知體驗（智能音效、自動 emoji 等）：

- [cat-ccnotify-hook](https://github.com/nkygit/cat-ccnotify-hook) - 進階通知系統

**但基本版本已經很好用了！**

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
