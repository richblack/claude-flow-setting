# RFP (Request for Proposal) 目錄

這個目錄用於存放專案的需求文件、設計文件和實作計畫。

## 🌟 Vibe Coding 工作流程

受 Amazon Kiro IDE 啟發，我們實現了一個**從自然語言需求到可執行任務**的完整工作流程。

### 什麼是 Vibe Coding？

Vibe Coding 是一個互動式工作流程，幫助您將模糊的想法轉換為清晰的實作計畫：

```
自然語言需求
  ↓
User Story Mapping
  ↓
EARS 驗收標準
  ↓
系統設計
  ↓
任務分解
  ↓
開始實作
```

### 如何使用？

#### 方法 1: 使用 Slash Command（推薦）

在 Claude Code 中執行：

```
/vibe-coding
```

然後按照提示逐步完成 5 個階段。

#### 方法 2: 手動建立需求文件

1. 在 `rfp/` 目錄建立 `initial-requirements.md`
2. 用自然語言描述您的需求
3. 執行 `/vibe-coding`，AI 會讀取您的需求文件

### 工作流程階段

#### 階段 1: 理解需求
- AI 與您對話，理解您的需求
- 總結關鍵點並請您確認
- 儲存到 `rfp/initial-requirements.md`

#### 階段 2: User Story Mapping
- AI 產生使用者故事映射
- 使用標準格式：「作為[角色]，我希望[功能]，以便[價值]」
- 您可以調整和完善

#### 階段 3: EARS 驗收標準
- 為每個使用者故事新增詳細的驗收標準
- 使用 EARS 格式：「當[條件]時，系統應[行為]」
- 產生 `rfp/requirements.md`

#### 階段 4: 系統設計
- AI 設計系統架構和元件
- 包含介面定義、資料模型、錯誤處理等
- 產生 `rfp/design.md`

#### 階段 5: 任務分解
- 將設計分解為可執行的任務清單
- 每個任務包含描述、工作內容、需求追蹤
- 產生 `rfp/tasks.md`

### 產生的文件

完成工作流程後，您將得到：

```
rfp/
├── initial-requirements.md    # 原始需求
├── requirements.md            # User Stories + EARS
├── design.md                  # 系統設計
└── tasks.md                   # 任務清單
```

### 開始實作

有了這些文件後，您可以：

1. **使用 Claude Flow 開始開發**：
   ```bash
   claude-flow sparc run coder "實作 tasks.md 中的第一個任務"
   ```

2. **使用 Claude Code 直接實作**：
   - 讓 AI 讀取 `tasks.md`
   - 逐個完成任務
   - 使用 TodoWrite 追蹤進度

3. **團隊協作**：
   - 將這些文件分享給團隊成員
   - 每個人都能理解需求和設計
   - 按照任務清單分工

## 📁 目錄結構

```
rfp/
├── README.md                        # 本文件
├── templates/                       # 文件範本
│   ├── requirements-template.md
│   ├── design-template.md
│   └── tasks-template.md
├── initial-requirements.md          # 原始需求（由 vibe-coding 產生）
├── requirements.md                  # 需求文件（由 vibe-coding 產生）
├── design.md                        # 設計文件（由 vibe-coding 產生）
└── tasks.md                         # 任務清單（由 vibe-coding 產生）
```

## 💡 最佳實踐

### 1. 詳細描述需求
在階段 1 中，越詳細越好：
- 描述使用者情境
- 說明期望的功能
- 提供範例或參考

### 2. 積極互動
每個階段都要：
- 仔細審查 AI 的輸出
- 提供回饋和調整
- 確認後再進入下一階段

### 3. 彈性調整
如果某個階段的輸出不滿意：
- 要求 AI 重新產生
- 提供更多情境說明
- 自己編輯文件

### 4. 保持更新
在開發過程中：
- 需求變更時更新 `requirements.md`
- 設計調整時更新 `design.md`
- 完成任務時在 `tasks.md` 中打勾

## 🔄 與 Claude Flow 整合

Vibe Coding 完美整合 Claude Flow：

1. **使用記憶系統**：
   ```bash
   claude-flow memory store "project-requirements" "$(cat rfp/requirements.md)"
   ```

2. **使用 SPARC 模式**：
   ```bash
   claude-flow sparc run architect "基於 rfp/design.md 最佳化架構"
   ```

3. **使用 Hive-Mind 協作**：
   ```bash
   claude-flow hive init --topology mesh --agents 3
   # 多個 agent 並行處理不同的任務
   ```

## 📚 範例

查看 `templates/` 目錄中的範本文件，了解每個文件的標準格式。

## 🆘 需要協助？

- 執行 `/vibe-coding` 開始工作流程
- AI 會在每個階段提供詳細指導
- 遇到問題時，隨時詢問 AI

---

**Happy Vibe Coding! 🚀**
