# Cost Efficient Agent Tree
Codex 插件，为复杂任务提供按需分配子代理的工作规则，用于减少重复调查和无必要的模型调用。

## 快速开始

准备可用的 Codex CLI，在终端执行：

```powershell
codex plugin marketplace add DUSK1NG/cost-efficient-agent-tree
codex plugin add cost-efficient-agent-tree@cost-efficient-agent-tree-local
```

安装输出包含：

```text
Added marketplace `cost-efficient-agent-tree-local` from https://github.com/DUSK1NG/cost-efficient-agent-tree.git.
Added plugin `cost-efficient-agent-tree` from marketplace `cost-efficient-agent-tree-local`.
```

## 使用

重启 Codex 并新建对话，在提示中明确写：

```text
使用 $cost-efficient-agent-tree 完成这个任务。
```

简单明确的任务直接执行；有独立工作时才分配子代理。具体规则见 [Skill](plugins/cost-efficient-agent-tree/skills/cost-efficient-agent-tree/SKILL.md)。

## 配置

[策略文件](plugins/cost-efficient-agent-tree/skills/cost-efficient-agent-tree/agents/openai.yaml)设置 `allow_implicit_invocation: false`，需要显式调用。

## 开发

脚本安装、本地目录安装与包内清单见[安装说明](docs/installation.md)。原始构想与图示作者为 [Voxyz（@Voxyz_ai）](https://x.com/Voxyz_ai)，本仓库由 DUSK1NG 非官方适配和打包，与原作者无隶属或背书关系。
