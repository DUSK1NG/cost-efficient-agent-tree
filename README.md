# Cost Efficient Agent Tree

将成本优先的 Agent 路由思路适配为可安装的 Codex 插件，包含显式调用的 `cost-efficient-agent-tree` Skill。

![Cost Efficient Agent Tree](plugins/cost-efficient-agent-tree/assets/cost-efficient-agent-tree.png)

## 来源与声明

原始构想与图示作者：[Voxyz（@Voxyz_ai）](https://x.com/Voxyz_ai)。

本仓库由 DUSK1NG 面向 Codex 进行非官方适配和打包，与原作者不存在隶属或背书关系。为匹配插件实际行为，重绘图示时移除了固定模型和推理档位，并补充了显式调用、简单任务直接执行、按需委派及高风险审查规则。

## 特性

- 默认关闭隐式调用。
- 只有在提示词中明确写 `$cost-efficient-agent-tree` 时才调用该 Skill。
- Skill 负责在复杂、多文件、需要研究或可并行的任务中选择最少且有实际价值的子 Agent。

## 一键安装

Windows PowerShell：

```powershell
irm https://raw.githubusercontent.com/DUSK1NG/cost-efficient-agent-tree/main/install.ps1 | iex
```

macOS / Linux：

```bash
curl -fsSL https://raw.githubusercontent.com/DUSK1NG/cost-efficient-agent-tree/main/install.sh | sh
```

脚本会检查 `codex` 命令，添加或更新本仓库 Marketplace，然后安装插件。建议执行前先查看 [install.ps1](install.ps1) 或 [install.sh](install.sh)。

## 手动安装

直接从 GitHub 添加：

```powershell
codex plugin marketplace add DUSK1NG/cost-efficient-agent-tree
codex plugin add cost-efficient-agent-tree@cost-efficient-agent-tree-local
```

也可以下载并解压安装包，再添加本地目录：

```powershell
codex plugin marketplace add "C:\path\to\cost-efficient-agent-tree"
codex plugin add cost-efficient-agent-tree@cost-efficient-agent-tree-local
```

## 下载后交给自己的 Codex

1. 从 [Releases](https://github.com/DUSK1NG/cost-efficient-agent-tree/releases/latest) 下载 `cost-efficient-agent-tree-v0.1.0.zip`。
2. 将 ZIP 作为附件发送给 Codex。
3. 发送下面的提示词：

```text
请安装附件中的 cost-efficient-agent-tree 插件。先检查包内 README 和清单，添加其中的 Marketplace 并安装插件；不要修改其他插件或无关配置。完成后验证 policy.allow_implicit_invocation 为 false，并告诉我是否需要新建对话。
```

安装后重启 Codex，并在新对话中明确调用：

```text
使用 $cost-efficient-agent-tree 完成这个任务。
```

## 目录

```text
cost-efficient-agent-tree/
├── .agents/plugins/marketplace.json
├── marketplace.json
├── install.ps1
├── install.sh
└── plugins/
    └── cost-efficient-agent-tree/
        ├── .codex-plugin/plugin.json
        ├── assets/cost-efficient-agent-tree.png
        └── skills/cost-efficient-agent-tree/
            ├── SKILL.md
            └── agents/openai.yaml
```
