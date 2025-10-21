# RFP (Request for Proposal) 目录

这个目录用于存储项目的需求文件、设计文档和实现计划。

## 🌟 Vibe Coding 工作流

受 Amazon Kiro IDE 启发，我们实现了一个**从自然语言需求到可执行任务**的完整工作流。

### 什么是 Vibe Coding？

Vibe Coding 是一个交互式工作流，帮助您将模糊的想法转换为清晰的实现计划：

```
自然语言需求
  ↓
User Story Mapping
  ↓
EARS 验收标准
  ↓
系统设计
  ↓
任务分解
  ↓
开始实现
```

### 如何使用？

#### 方法 1: 使用 Slash Command（推荐）

在 Claude Code 中运行：

```
/vibe-coding
```

然后按照提示逐步完成 5 个阶段。

#### 方法 2: 手动创建需求文件

1. 在 `rfp/` 目录创建 `initial-requirements.md`
2. 用自然语言描述您的需求
3. 运行 `/vibe-coding`，AI 会读取您的需求文件

### 工作流阶段

#### 阶段 1: 理解需求
- AI 与您对话，理解您的需求
- 总结关键点并请您确认
- 保存到 `rfp/initial-requirements.md`

#### 阶段 2: User Story Mapping
- AI 生成用户故事映射
- 使用标准格式："作为[角色]，我希望[功能]，以便[价值]"
- 您可以调整和完善

#### 阶段 3: EARS 验收标准
- 为每个用户故事添加详细的验收标准
- 使用 EARS 格式："当[条件]时，系统应[行为]"
- 生成 `rfp/requirements.md`

#### 阶段 4: 系统设计
- AI 设计系统架构和组件
- 包含接口定义、数据模型、错误处理等
- 生成 `rfp/design.md`

#### 阶段 5: 任务分解
- 将设计分解为可执行的任务列表
- 每个任务包含描述、工作内容、需求追踪
- 生成 `rfp/tasks.md`

### 生成的文件

完成工作流后，您将得到：

```
rfp/
├── initial-requirements.md    # 原始需求
├── requirements.md            # User Stories + EARS
├── design.md                  # 系统设计
└── tasks.md                   # 任务列表
```

### 开始实现

有了这些文档后，您可以：

1. **使用 Claude Flow 开始开发**：
   ```bash
   claude-flow sparc run coder "实现 tasks.md 中的第一个任务"
   ```

2. **使用 Claude Code 直接实现**：
   - 让 AI 读取 `tasks.md`
   - 逐个完成任务
   - 使用 TodoWrite 追踪进度

3. **团队协作**：
   - 将这些文档分享给团队成员
   - 每个人都能理解需求和设计
   - 按照任务列表分工

## 📁 目录结构

```
rfp/
├── README.md                        # 本文件
├── templates/                       # 文档模板
│   ├── requirements-template.md
│   ├── design-template.md
│   └── tasks-template.md
├── initial-requirements.md          # 原始需求（由 vibe-coding 生成）
├── requirements.md                  # 需求文档（由 vibe-coding 生成）
├── design.md                        # 设计文档（由 vibe-coding 生成）
└── tasks.md                         # 任务列表（由 vibe-coding 生成）
```

## 💡 最佳实践

### 1. 详细描述需求
在阶段 1 中，越详细越好：
- 描述用户场景
- 说明期望的功能
- 提供示例或参考

### 2. 积极互动
每个阶段都要：
- 仔细审查 AI 的输出
- 提供反馈和调整
- 确认后再进入下一阶段

### 3. 灵活调整
如果某个阶段的输出不满意：
- 要求 AI 重新生成
- 提供更多上下文
- 自己编辑文档

### 4. 保持更新
在开发过程中：
- 需求变更时更新 `requirements.md`
- 设计调整时更新 `design.md`
- 完成任务时在 `tasks.md` 中打勾

## 🔄 与 Claude Flow 集成

Vibe Coding 完美集成 Claude Flow：

1. **使用记忆系统**：
   ```bash
   claude-flow memory store "project-requirements" "$(cat rfp/requirements.md)"
   ```

2. **使用 SPARC 模式**：
   ```bash
   claude-flow sparc run architect "基于 rfp/design.md 优化架构"
   ```

3. **使用 Hive-Mind 协作**：
   ```bash
   claude-flow hive init --topology mesh --agents 3
   # 多个 agent 并行处理不同的任务
   ```

## 📚 示例

查看 `templates/` 目录中的模板文件，了解每个文档的标准格式。

## 🆘 需要帮助？

- 运行 `/vibe-coding` 开始工作流
- AI 会在每个阶段提供详细指导
- 遇到问题时，随时询问 AI

---

**Happy Vibe Coding! 🚀**
