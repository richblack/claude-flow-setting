# CLAUDE.md - Claude Flow 開發指南

## 🌊 Claude Flow 極簡開發系統

此專案已配置 Claude Flow 的極簡開發環境，使用 Claude Code 官方 hooks 實現穩定的通知系統。

---

## 🔔 通知系統 - Claude Code 官方 Hooks

### ⚠️ 重要：通知完全自動化

**當需要用戶注意或互動時，系統會自動觸發通知。**

### 🎯 通知觸發時機（自動）

系統已配置 `.claude/settings.json` 的 hooks：

#### 1. Notification Hook（自動觸發）
- Claude 需要用戶許可時
- 閒置超過 60 秒時
- **完全自動**，不需手動調用

#### 2. Stop Hook（自動觸發）
- 任務完成時
- **完全自動**，不需手動調用

### ✅ 為什麼穩定可靠？

- **系統級別**：hooks 在 Claude Code 系統層運行
- **不受上下文影響**：即使上下文窗口被壓縮，仍會正常觸發
- **零維護**：無需在代碼中手動調用

---

## 🎨 Vibe Coding - 從需求到實現的智能工作流

### ✨ 什麼是 Vibe Coding？

受 Amazon Kiro IDE 啟發，Vibe Coding 是一個**交互式工作流**，將自然語言需求轉換為結構化的實現計劃：

```
自然語言需求 → User Story Mapping → EARS 驗收標準 → 系統設計 → 任務分解 → 開始實現
```

### 🚀 快速開始

在 Claude Code 中運行：

```
/vibe-coding
```

然後按照 AI 的引導，逐步完成 5 個階段。

### 📋 工作流階段

1. **理解需求** - AI 與您對話，理解並總結需求
2. **User Story Mapping** - 生成用戶故事映射
3. **EARS 驗收標準** - 添加詳細的驗收標準
4. **系統設計** - 創建架構、組件、接口設計
5. **任務分解** - 生成可執行的任務列表

### 📁 生成的文件

完成後，`rfp/` 目錄將包含：

- `initial-requirements.md` - 原始需求
- `requirements.md` - User Stories + EARS 驗收標準
- `design.md` - 系統設計文檔
- `tasks.md` - 任務分解列表

### 💡 為什麼使用 Vibe Coding？

✅ **清晰溝通** - 即使不懂程式的人也能理解
✅ **結構化** - 從需求到實現的完整追蹤
✅ **可追溯** - 每個任務都關聯到具體需求
✅ **高效** - 配合 Claude Flow 的 MCP 工具，比 Kiro 更快

### 🔗 與 Claude Flow 集成

```bash
# 使用記憶系統保存需求
claude-flow memory store "project-requirements" "$(cat rfp/requirements.md)"

# 基於設計優化架構
claude-flow sparc run architect "基於 rfp/design.md 優化架構"

# 使用 Hive-Mind 並行處理任務
claude-flow hive init --topology mesh --agents 3
```

詳細說明請參閱 `rfp/README.md`。

---

## 🤖 開發流程

### 1. 開始前必讀

- **使用 Vibe Coding 創建需求**：運行 `/vibe-coding` 生成結構化需求
- **永遠先閱讀 `rfp/` 目錄**：理解需求後再開始開發
- **使用記憶系統**：重要決策和進度都要記錄

### 2. 標準開發流程

```bash
# 啟動時 - 恢復記憶
claude-flow memory export && cat memory-export-*.json

# 閱讀需求
# 請仔細閱讀 rfp/ 目錄中的所有需求文件

# 規劃架構
claude-flow sparc run architect "根據 rfp/ 需求設計架構"

# 開始開發
claude-flow sparc run coder "實作功能"

# 測試
claude-flow sparc run tdd "建立測試"

# 結束時 - 保存記憶
claude-flow memory store "progress" "今日完成：XXX"
```

---

## 📋 開發準則

### 何時必須主動詢問用戶

1. **需要決策時**
   - 多種實作方案可選擇
   - 架構設計的重要決定
   - 技術棧選擇

2. **遇到阻礙時**
   - 錯誤無法自行解決
   - 需求不清楚
   - 測試失敗且原因不明

3. **完成階段性任務時**
   - 完成一個主要功能
   - 完成測試
   - 準備部署

### 通知方式

- ✅ **自動觸發**：系統會在適當時機自動彈出通知
- ✅ **穩定可靠**：不受上下文壓縮影響
- ✅ **無需手動**：不需要在代碼中調用通知

---

## 💡 最佳實踐

### Do ✅

- 先讀 rfp/ 再動手
- 重要決策記錄到 memory
- 需要確認時主動詢問
- 階段完成後總結進度

### Don't ❌

- 不要假設需求，有疑問就問
- 不要跳過測試
- 不要在不確定時繼續開發
- 不要忘記保存記憶

---

## 💾 記憶系統使用

```bash
# 保存架構決策
claude-flow memory store "architecture" "使用微服務架構，API Gateway + 3個服務"

# 保存技術棧
claude-flow memory store "tech-stack" "Node.js + PostgreSQL + Redis"

# 保存進度
claude-flow memory store "progress" "完成用戶認證模組"

# 保存問題
claude-flow memory store "issues" "資料庫連線池需要優化"

# 查詢特定記憶
claude-flow memory query "architecture"

# 恢復所有記憶
claude-flow memory export && cat memory-export-*.json
```

---

## 🚨 特別注意

### 1. 上下文壓縮後的恢復

如果忘記之前的工作：
```bash
# 立即執行
claude-flow memory export && cat memory-export-*.json

# 重新閱讀需求
# 查看 rfp/requirements.md
```

### 2. 長時間執行的任務

- 定期報告進度
- 階段完成時總結
- 系統會在適當時機自動通知用戶

### 3. 需要用戶介入

- 系統會**自動觸發通知**
- 明確說明需要什麼決策或行動
- 等待用戶回應後再繼續

---

## 🛠 SPARC 開發模式

### 架構與設計

```bash
claude-flow sparc run architect "設計系統架構"
claude-flow sparc run ui-ux "設計用戶介面"
claude-flow sparc run database "設計資料庫結構"
```

### 開發實作

```bash
claude-flow sparc run coder "實作用戶認證"
claude-flow sparc run api "建立 REST API"
claude-flow sparc run mobile "開發行動應用"
```

### 測試與品質

```bash
claude-flow sparc run tdd "建立測試套件"
claude-flow sparc run qa "品質保證測試"
claude-flow sparc run performance "效能優化"
```

### 安全與部署

```bash
claude-flow sparc run security-review "安全稽核"
claude-flow sparc run devops "CI/CD 部署"
claude-flow sparc run cloud "雲端架構"
```

### 特殊領域

```bash
claude-flow sparc run ml "機器學習模型"
claude-flow sparc run data "資料工程"
claude-flow sparc run research "技術研究"
```

---

## 🧠 Hive-Mind 協調

Claude Flow 使用 Hive-Mind 智能協調系統：

```bash
# 初始化蜂群
claude-flow hive init --topology mesh --agents 5

# 檢查蜂群狀態
claude-flow hive status

# 執行複雜任務協調
claude-flow swarm "建立電商平台" \
  --strategy development \
  --max-agents 5 \
  --parallel \
  --monitor
```

---

## 📊 BatchTool 並行執行

使用 BatchTool 進行高效並行開發：

```bash
batchtool run --parallel \
  "claude-flow sparc run architect '設計用戶認證架構'" \
  "claude-flow sparc run coder '實作登入 API'" \
  "claude-flow sparc run tdd '建立認證測試'" \
  "claude-flow sparc run security-review '稽核認證流程'"
```

---

## 🔧 MCP 工具整合

Claude Flow 包含 87 個 MCP 工具：

```bash
# 查看所有工具
claude-flow mcp tools list

# 檢查 MCP 狀態
claude-flow mcp status

# 執行特定工具
claude-flow mcp execute neural_train --pattern_type coordination
```

---

## 📈 監控與分析

```bash
# 系統狀態監控
claude-flow status

# 啟動 Web UI 監控面板
claude-flow start --ui --port 3000

# 效能分析
claude-flow analytics insights --timerange 7d
```

---

## 📚 說明文件

- 完整文件: https://github.com/ruvnet/claude-flow/wiki
- SPARC 方法論: https://github.com/ruvnet/claude-flow/wiki/SPARC-Methodology
- 開發模式: https://github.com/ruvnet/claude-flow/wiki/Development-Patterns
- Claude Code Hooks: https://docs.claude.com/en/docs/claude-code/hooks

---

**版本**: Claude Flow Minimal Setup v2.0
**配置**: Official Hooks + SPARC Enhanced + Vibe Coding
**功能**: 自動通知 + 記憶系統 + 17 Development Modes + Vibe Coding 工作流

**重點**:
- 通知系統已透過 `.claude/settings.json` 的 hooks 配置，不受上下文壓縮影響，穩定可靠！
- 新增 Vibe Coding 工作流，從自然語言需求到可執行任務的完整流程！
