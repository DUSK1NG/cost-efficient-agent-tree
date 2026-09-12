# Cost Efficient Agent Tree 本地插件包

这是可复制到其他电脑的 Codex 本地 Marketplace 包，包含 `cost-efficient-agent-tree` Skill。

## 行为

- 默认关闭隐式调用。
- 只有在提示词中明确写 `$cost-efficient-agent-tree` 时才调用该 Skill。
- Skill 负责在复杂、多文件、需要研究或可并行的任务中选择最少且有实际价值的子 Agent。

## 安装

先将整个目录复制或解压到目标电脑，然后在该目录的上一级或当前目录执行：

```powershell
codex plugin marketplace add "C:\path\to\cost-efficient-agent-tree-marketplace"
codex plugin add cost-efficient-agent-tree@cost-efficient-agent-tree-local
```

也可以直接从 GitHub 添加本仓库：

```powershell
codex plugin marketplace add DUSK1NG/cost-efficient-agent-tree
codex plugin add cost-efficient-agent-tree@cost-efficient-agent-tree-local
```

安装后重启 Codex，并在新对话中明确调用：

```text
使用 $cost-efficient-agent-tree 完成这个任务。
```

## 目录

```text
cost-efficient-agent-tree-marketplace/
├── marketplace.json
└── plugins/
    └── cost-efficient-agent-tree/
        ├── .codex-plugin/plugin.json
        └── skills/cost-efficient-agent-tree/
            ├── SKILL.md
            └── agents/openai.yaml
```
