$ErrorActionPreference = "Stop"

$marketplaceSource = "DUSK1NG/cost-efficient-agent-tree"
$marketplaceName = "cost-efficient-agent-tree-local"
$pluginSelector = "cost-efficient-agent-tree@$marketplaceName"

if (-not (Get-Command codex -ErrorAction SilentlyContinue)) {
    throw "未找到 codex 命令。请先安装或更新 Codex CLI。"
}

$marketplaceList = & codex plugin marketplace list --json
if ($LASTEXITCODE -ne 0) {
    throw "无法读取 Codex Marketplace 列表。"
}

$marketplaces = $marketplaceList | ConvertFrom-Json
if ($marketplaces.marketplaces.name -contains $marketplaceName) {
    & codex plugin marketplace upgrade $marketplaceName
} else {
    & codex plugin marketplace add $marketplaceSource
}

if ($LASTEXITCODE -ne 0) {
    throw "添加或更新 Marketplace 失败。"
}

& codex plugin add $pluginSelector
if ($LASTEXITCODE -ne 0) {
    throw "安装插件失败。"
}

Write-Host "安装完成。请重启 Codex 并新建对话，然后明确使用 `$cost-efficient-agent-tree。"
