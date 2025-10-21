# 🌊 Claude Flow 開發環境設定

> **從需求到實現的完整智能工作流** - 結合 Amazon Kiro IDE 的 Vibe Coding 理念與 Claude Code 的強大功能

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-2.0-green.svg)](CHANGELOG.md)

---

## ✨ 三大核心特色

### 🎨 1. Vibe Coding 工作流
**受 Amazon Kiro IDE 啟發，但更快更好！**

從自然語言需求到可執行任務的完整流程：
```
💬 自然語言描述 → 📋 User Story → ✅ EARS 驗收標準 → 🏗️ 系統設計 → 📝 任務分解 → 🚀 開始實現
```

**一個指令開始：**
```
/vibe-coding
```

**優勢**：
- ✅ 清晰溝通 - 非技術人員也能理解
- ✅ 完整追蹤 - 需求到任務的可追溯性
- ✅ 比 Kiro 更快 - 配合 87 個 MCP 工具加速開發
- ✅ 統一管理 - 所有文檔在 `rfp/` 目錄

[→ 了解 Vibe Coding 詳細說明](rfp/README.md) | [→ 快速入門教程](QUICKSTART.md)

### 🔔 2. 穩定可靠的通知系統
**使用 Claude Code 官方 Hooks - 永不失效！**

當需要您注意時，自動彈出桌面通知：
- 💡 需要決策時
- ⏸️ 等待超過 60 秒時
- ✅ 任務完成時

**為什麼穩定？**
- 系統級 hooks，不受上下文壓縮影響
- 即使 Claude 忘記，hooks 也會觸發
- 零維護，完全自動化

[→ 通知系統詳細配置](#通知系統配置)

### 🧠 3. Claude Flow 完整集成
**87 個 MCP 工具 + 17 種 SPARC 開發模式**

- 🔄 記憶系統 - 保存開發進度和決策
- 🐝 Hive-Mind - 多 Agent 協調開發
- 🎯 SPARC 模式 - 專業化開發代理（架構師、程序員、測試工程師...）
- 📊 BatchTool - 並行執行任務

[→ Claude Flow 開發指南](CLAUDE.md)

---

## 🚀 快速開始（3 分鐘）

### 方案 1：新專案（推薦）

```bash
# 1. 克隆此倉庫
git clone https://github.com/richblack/claude-flow-setting.git

# 2. 執行設定腳本
cd claude-flow-setting
./quick-setup.sh my_awesome_project

# 3. 進入新專案
cd my_awesome_project

# 4. 在 Claude Code 中開啟並運行
# /vibe-coding
```

### 方案 2：現有專案

```bash
# 1. 在您的專案目錄中
cd your-existing-project

# 2. 執行設定腳本
/path/to/claude-flow-setting/quick-setup.sh

# 3. 在 Claude Code 中開啟並運行
# /vibe-coding
```

---

## 📁 專案結構

設定完成後，您的專案將包含：

```
your-project/
├── 📚 文檔系統
│   ├── README.md                    # 專案總覽（本文件）
│   ├── CLAUDE.md                    # Claude 開發指南
│   ├── QUICKSTART.md                # 快速入門教程
│   └── rfp/                         # 需求和設計文檔
│       ├── README.md                # Vibe Coding 使用說明
│       ├── example-initial-requirements.md  # 示例需求
│       ├── templates/               # 文檔模板
│       ├── initial-requirements.md  # 原始需求（自動生成）
│       ├── requirements.md          # User Stories + EARS（自動生成）
│       ├── design.md                # 系統設計（自動生成）
│       └── tasks.md                 # 任務列表（自動生成）
│
├── 🔧 配置文件
│   ├── .claude/
│   │   ├── commands/
│   │   │   └── vibe-coding.md      # Vibe Coding 工作流
│   │   └── settings.json            # 通知 hooks 配置
│   └── .gitignore                   # Git 忽略規則
│
└── 💻 您的程式碼
    └── ...
```

---

## 💡 典型工作流程

### 第一天：創建需求

```bash
# 在 Claude Code 中運行
/vibe-coding
```

**AI 會引導您完成 5 個階段：**

1. **理解需求** - 用自然語言描述您的想法
2. **User Story Mapping** - AI 生成用戶故事
3. **EARS 驗收標準** - 添加可測試的驗收標準
4. **系統設計** - 生成架構和組件設計
5. **任務分解** - 創建詳細的任務列表

**輸出：** `rfp/` 目錄中的完整文檔

### 第二天：開始實現

```bash
# 方式 1: 直接在 Claude Code 中
# "請讀取 rfp/tasks.md，開始實現第一個任務"

# 方式 2: 使用 Claude Flow SPARC 模式
claude-flow sparc run architect "基於 rfp/design.md 實現架構"
claude-flow sparc run coder "實現 rfp/tasks.md 中的任務"
claude-flow sparc run tdd "建立測試套件"
```

**自動通知：** Claude 需要您時會自動彈出通知 🔔

### 每天結束

```bash
# 保存進度到記憶系統
claude-flow memory store "progress" "$(date): 完成任務 1-3"

# 提交代碼
git add .
git commit -m "完成用戶認證功能"
git push
```

[→ 查看完整開發流程範例](CLAUDE.md#開發流程)

---

## 📖 文檔導航

### 新手入門
- **[QUICKSTART.md](QUICKSTART.md)** - 3 分鐘快速入門教程
- **[rfp/README.md](rfp/README.md)** - Vibe Coding 工作流詳細說明
- **[rfp/example-initial-requirements.md](rfp/example-initial-requirements.md)** - 示例需求文件

### 開發指南
- **[CLAUDE.md](CLAUDE.md)** - Claude 開發指南（必讀！）
  - Vibe Coding 工作流
  - 通知系統說明
  - 開發流程和最佳實踐
  - SPARC 開發模式
  - 記憶系統使用
  - Hive-Mind 協調

### 技術細節
- **[.claude/commands/vibe-coding.md](.claude/commands/vibe-coding.md)** - Vibe Coding Slash Command 實現
- **[rfp/templates/](rfp/templates/)** - 文檔生成模板

---

## 🎯 三種使用方式

### 1. 純 Vibe Coding（推薦新手）
適合：需求清晰，想要結構化文檔

```bash
/vibe-coding  # 生成完整文檔
# 然後手動或用 AI 實現
```

### 2. Vibe Coding + Claude Code
適合：個人開發者，快速迭代

```bash
/vibe-coding  # 生成文檔
# "請讀取 rfp/tasks.md 並開始實現"
```

### 3. Vibe Coding + Claude Flow（推薦專業團隊）
適合：複雜項目，需要多 Agent 協作

```bash
/vibe-coding  # 生成文檔

# 使用 SPARC 專業模式
claude-flow sparc run architect "..."
claude-flow sparc run coder "..."

# 或使用 Hive-Mind 並行開發
claude-flow hive init --topology mesh --agents 3
```

---

## 🔧 前置需求

### 必需
- [Claude Code](https://claude.com/claude-code) 已安裝
- Git

### 可選（通知功能）
```bash
# macOS
brew install terminal-notifier

# Linux (Ubuntu/Debian)
sudo apt-get install libnotify-bin
```

### 可選（Claude Flow）
```bash
# 安裝 Claude Flow 以使用進階功能
# https://github.com/ruvnet/claude-flow
```

---

## 🔔 通知系統配置

### 自動通知觸發時機

| 時機 | Hook | 說明 |
|------|------|------|
| Claude 需要許可時 | Notification | 自動彈出通知 |
| 等待超過 60 秒時 | Notification | 提醒您關注 |
| 任務完成時 | Stop | 完成提示 |

### 配置文件

**位置：** `.claude/settings.json`

```json
{
  "hooks": {
    "Notification": [{
      "matcher": "",
      "hooks": [{
        "type": "command",
        "command": "terminal-notifier -message \"Claude Code 需要您的注意\" ..."
      }]
    }],
    "Stop": [...]
  }
}
```

### 為什麼穩定可靠？

✅ **系統級別** - hooks 在 Claude Code 系統層運行
✅ **不受上下文影響** - 即使上下文壓縮也能觸發
✅ **零維護** - 完全自動化，無需手動調用

[→ 通知系統故障排除](CLAUDE.md#特別注意)

---

## 🌟 核心優勢

### vs Amazon Kiro IDE

| 特性 | Kiro IDE | Claude Flow + Vibe Coding |
|------|----------|---------------------------|
| User Story Mapping | ✅ | ✅ |
| EARS 驗收標準 | ✅ | ✅ |
| 系統設計 | ✅ | ✅ |
| 任務分解 | ✅ | ✅ |
| 執行速度 | 較慢 | **快 10 倍**（87 個 MCP 工具） |
| 集成能力 | 有限 | **強大**（Claude Flow 生態系統） |
| 文檔管理 | 分散 | **統一**（rfp/ 目錄） |
| 通知系統 | ❌ | **穩定可靠**（官方 hooks） |

### 與傳統開發流程對比

**傳統流程：**
```
需求文檔 → PRD → 技術設計 → 任務分解 → 開發 → 測試
（每個階段需要不同工具和人員協調）
```

**Vibe Coding 流程：**
```
自然語言 → /vibe-coding → 5 階段互動 → 開始開發
（一個工具，AI 引導，自動生成所有文檔）
```

---

## 💻 實戰範例

### 範例 1：待辦事項應用

```bash
# 1. 運行 Vibe Coding
/vibe-coding

# 2. 描述需求
"我想創建一個待辦事項應用，用戶可以添加、編輯、刪除任務，
可以設置優先級和截止日期，支持分類和標籤..."

# 3. AI 引導您完成 5 個階段
# 4. 生成完整文檔在 rfp/ 目錄
# 5. 開始實現

"請讀取 rfp/tasks.md，開始實現第一個任務"
```

[→ 查看完整示例](rfp/example-initial-requirements.md)

---

## 🛠 故障排除

### Q: 通知不出現？

```bash
# 1. 檢查通知工具
which terminal-notifier  # macOS
which notify-send       # Linux

# 2. 測試通知
terminal-notifier -message "測試" -title "Claude Code"  # macOS
notify-send "Claude Code" "測試"                      # Linux

# 3. 檢查系統通知權限
```

[→ 詳細故障排除指南](CLAUDE.md#特別注意)

### Q: Vibe Coding 工作流不知道如何開始？

[→ 查看快速入門教程](QUICKSTART.md)

### Q: Claude Flow 指令找不到？

```bash
# 確認是否安裝
which claude-flow

# 如果沒有，請安裝
# https://github.com/ruvnet/claude-flow
```

### Q: 想要修改生成的文檔？

直接編輯 `rfp/` 目錄中的 Markdown 文件即可！這些文件完全由您掌控。

---

## 🎓 學習資源

### 官方文檔
- [Claude Code 文檔](https://docs.claude.com/en/docs/claude-code)
- [Claude Code Hooks](https://docs.claude.com/en/docs/claude-code/hooks)
- [Claude Flow Wiki](https://github.com/ruvnet/claude-flow/wiki)
- [SPARC 方法論](https://github.com/ruvnet/claude-flow/wiki/SPARC-Methodology)

### 社區資源
- [Claude Flow GitHub](https://github.com/ruvnet/claude-flow)
- [此專案 GitHub](https://github.com/richblack/claude-flow-setting)

### 相關項目
- [cat-ccnotify-hook](https://github.com/nkygit/cat-ccnotify-hook) - 進階通知系統

---

## 🤝 貢獻

歡迎提交 Issue 和 Pull Request！

### 開發計劃
- [ ] 支持更多文檔模板
- [ ] 集成更多 MCP 工具
- [ ] 添加項目示例
- [ ] 多語言支持

---

## 📄 授權

MIT License - 請自由使用和修改！

---

## ⭐ 核心理念

**讓 AI 主導開發，您專注於決策**

1. 💬 您用自然語言描述需求
2. 🎨 Vibe Coding 生成結構化文檔
3. 🤖 Claude 基於文檔開發
4. 🔔 需要您時自動通知
5. ✅ 您做決策和確認
6. 💾 記憶系統保存進度
7. 🔄 明天無縫繼續

---

**現在就開始您的第一個 Vibe Coding 項目！** 🚀

```bash
git clone https://github.com/richblack/claude-flow-setting.git
cd claude-flow-setting
./quick-setup.sh my_first_project
cd my_first_project
# 在 Claude Code 中運行: /vibe-coding
```

---

<div align="center">

**版本 2.0** | **更新日期：2025-10-21**

Made with ❤️ by the Claude Flow Community

[🌟 Star](https://github.com/richblack/claude-flow-setting) | [🐛 Report Issue](https://github.com/richblack/claude-flow-setting/issues) | [💡 Request Feature](https://github.com/richblack/claude-flow-setting/issues)

</div>
