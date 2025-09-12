# CLAUDE.md - Claude Flow SPARC Configuration

## 🌊 Claude Flow SPARC Development System

此專案已配置 Claude Flow v2.0.0 Alpha 的 SPARC (Systematic Programming, Architecture, Research, and Coordination) 開發系統。

## 🔊 語音通知系統 (小西) - 全域版本

### ⚠️ 重要：必須主動使用語音通知！

**當需要用戶注意或互動時，請立即使用語音通知。**

### 🚨 何時必須使用語音通知

#### 1. 需要用戶確認時（最重要！）
```bash
# 需要用戶確認操作時
python3 ~/Documents/claude-code-voice/claude_notify.py "需要您確認是否執行這個操作" "urgent"

# 詢問用戶選擇時  
python3 ~/Documents/claude-code-voice/claude_notify.py "請問您希望如何處理這個問題" "thinking"

# 需要用戶輸入時
python3 ~/Documents/claude-code-voice/claude_notify.py "請提供您的設定選項" "gentle"
```

#### 2. 遇到錯誤或問題時
```bash
# 程式錯誤需要檢查
python3 ~/Documents/claude-code-voice/claude_notify.py "遇到錯誤需要您檢查" "urgent"

# 測試失敗
python3 ~/Documents/claude-code-voice/claude_notify.py "測試失敗，請檢視錯誤" "worried"

# 建置失敗
python3 ~/Documents/claude-code-voice/claude_notify.py "建置失敗，需要修正" "urgent"
```

#### 3. 任務完成需要檢視時
```bash
# 任務完成
python3 ~/Documents/claude-code-voice/claude_notify.py "任務完成，請檢視結果" "excited"

# 程式碼分析完成
python3 ~/Documents/claude-code-voice/claude_notify.py "程式碼分析完成，發現問題" "gentle"
```

#### 4. 長時間執行需要等待時
```bash
# 正在執行耗時任務
python3 ~/Documents/claude-code-voice/claude_notify.py "任務執行中，預計需要幾分鐘" "thinking"

# 下載或安裝進行中
python3 ~/Documents/claude-code-voice/claude_notify.py "正在下載套件，請稍候" "gentle"
```

## 🎭 情緒類型說明

- `urgent` - 緊急事件，需要立即注意
- `gentle` - 一般通知，溫和提醒
- `excited` - 正面消息，完成通知
- `worried` - 問題警告，需要檢查
- `thinking` - 思考等待，正在處理

## 💡 使用提醒

- **主動性**：不要等用戶問，有需要就立即通知
- **及時性**：在關鍵時刻通知，避免用戶等待
- **情境化**：根據情況選擇適當的情緒類型

### 🤖 SPARC 開發模式

使用以下模式進行專業化開發：

#### 架構與設計
- `./claude-flow sparc run architect "設計系統架構"`
- `./claude-flow sparc run ui-ux "設計用戶介面"`
- `./claude-flow sparc run database "設計資料庫結構"`

#### 開發實作
- `./claude-flow sparc run coder "實作用戶認證"`
- `./claude-flow sparc run api "建立 REST API"`
- `./claude-flow sparc run mobile "開發行動應用"`

#### 測試與品質
- `./claude-flow sparc run tdd "建立測試套件"`
- `./claude-flow sparc run qa "品質保證測試"`
- `./claude-flow sparc run performance "效能優化"`

#### 安全與部署
- `./claude-flow sparc run security-review "安全稽核"`
- `./claude-flow sparc run devops "CI/CD 部署"`
- `./claude-flow sparc run cloud "雲端架構"`

#### 特殊領域
- `./claude-flow sparc run ml "機器學習模型"`
- `./claude-flow sparc run data "資料工程"`
- `./claude-flow sparc run research "技術研究"`

### 🧠 Hive-Mind 協調

Claude Flow 使用 Hive-Mind 智能協調系統：

```bash
# 初始化蜂群
./claude-flow hive init --topology mesh --agents 5

# 檢查蜂群狀態
./claude-flow hive status

# 執行複雜任務協調
./claude-flow swarm "建立電商平台" \
  --strategy development \
  --max-agents 5 \
  --parallel \
  --monitor
```

### 📊 BatchTool 並行執行

使用 BatchTool 進行高效並行開發：

```bash
batchtool run --parallel \
  "./claude-flow sparc run architect '設計用戶認證架構'" \
  "./claude-flow sparc run coder '實作登入 API'" \
  "./claude-flow sparc run tdd '建立認證測試'" \
  "./claude-flow sparc run security-review '稽核認證流程'"
```

### 💾 記憶系統

Claude Flow 具備持久記憶系統：

```bash
# 儲存專案資訊
./claude-flow memory store "requirements" "用戶認證使用 JWT"
./claude-flow memory store "architecture" "微服務設計模式"

# 查詢記憶
./claude-flow memory query "auth"
./claude-flow memory recall "architecture/*"
```

### 🔧 MCP 工具整合

Claude Flow 包含 87 個 MCP 工具：

```bash
# 查看所有工具
./claude-flow mcp tools list

# 檢查 MCP 狀態
./claude-flow mcp status

# 執行特定工具
./claude-flow mcp execute neural_train --pattern_type coordination
```

### 📈 監控與分析

```bash
# 系統狀態監控
./claude-flow status

# 啟動 Web UI 監控面板
./claude-flow start --ui --port 3000

# 效能分析
./claude-flow analytics insights --timerange 7d
```

### 🔗 與 Supabase 整合

本專案支援與 Supabase 的安全連接：

- 使用受限角色進行資料庫操作
- 環境變數配置在 `.env` 檔案中
- 支援 RLS (Row Level Security) 政策

### 📋 開發工作流程

1. **初始化**: `./claude-flow sparc run architect "專案架構設計"`
2. **資料庫**: `./claude-flow sparc run database "設計資料結構"`
3. **後端**: `./claude-flow sparc run api "建立 API 端點"`
4. **前端**: `./claude-flow sparc run ui-ux "用戶介面開發"`
5. **測試**: `./claude-flow sparc run tdd "全面測試覆蓋"`
6. **安全**: `./claude-flow sparc run security-review "安全檢查"`
7. **部署**: `./claude-flow sparc run devops "自動化部署"`

### 🚨 重要提醒

- **並行執行**: 盡可能使用 `--parallel` 進行並行開發
- **記憶儲存**: 每個階段完成後儲存關鍵資訊到記憶系統
- **語音通知**: 需要協助時主動使用語音通知
- **批次操作**: 使用 BatchTool 提高開發效率

### 📚 說明文件

- 完整文件: https://github.com/ruvnet/claude-flow/wiki
- SPARC 方法論: https://github.com/ruvnet/claude-flow/wiki/SPARC-Methodology
- 開發模式: https://github.com/ruvnet/claude-flow/wiki/Development-Patterns

---

**版本**: Claude Flow v2.0.0 Alpha  
**配置**: SPARC Enhanced  
**功能**: Hive-Mind + 87 MCP Tools + 17 Development Modes  
