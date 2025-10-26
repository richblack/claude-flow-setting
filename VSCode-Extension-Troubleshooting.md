# Claude Extension 偵錯指南

## VSCode Extension 設定步驟

### 1. 打開 VSCode 設定
- `Cmd + ,` (macOS) 或 `Ctrl + ,` (Windows/Linux)
- 搜索 "claude"

### 2. 設定以下選項：
```json
{
  "claude.commandsPath": ".claude/commands",
  "claude.configPath": ".claude",
  "claude.enableSlashCommands": true,
  "claude.workspaceRoot": "${workspaceFolder}"
}
```

### 3. 重新加載 VSCode
- Command Palette: "Developer: Reload Window"

### 4. 如果仍不工作，檢查：
- VSCode 工作區是否指向正確的目錄
- Extension 是否為最新版本
- 是否有權限問題

## 替代方案

如果 VSCode Extension 持續有問題，可以：

1. **使用 Terminal 版本進行開發**
   ```bash
   cd /Users/youlinhsieh/Documents/claude-flow-setting
   claude-code
   ```

2. **在 VSCode 中使用 Terminal**
   - 在 VSCode 中開啟 Terminal
   - 切換到正確目錄
   - 運行 `claude-code`

3. **符號連結方法**
   - 在任何專案中建立指向共享設定的符號連結
   ```bash
   ln -s /Users/youlinhsieh/Documents/claude-flow-setting/.claude .claude
   ```

## 官方已知問題

這種環境差異確實是 Claude Code 的已知限制，主要原因：

1. **權限模型不同**：Terminal 有完整系統權限，VSCode Extension 受限於 VSCode 環境
2. **配置加載機制**：兩者的配置讀取順序和方式不同
3. **工作區概念**：VSCode 依賴工作區，Terminal 依賴當前目錄

## 建議的工作流程

基於這些限制，建議的工作流程：

1. **開發期間**：使用 Terminal 版本的 Claude Code
2. **整合期間**：使用 VSCode Extension 進行編輯和預覽
3. **配置管理**：統一在 `claude-flow-setting` 目錄維護配置

這樣可以充分利用兩個環境的優勢，避開各自的限制。
