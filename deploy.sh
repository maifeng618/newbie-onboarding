#!/bin/bash
set -e

echo "=========================================="
echo "  新人入职 Landing 系统 - GitHub Pages 自动部署"
echo "=========================================="

# 检查 gh 是否可用
if ! command -v ~/.local/bin/gh &> /dev/null; then
    echo "错误：GitHub CLI (gh) 未找到"
    exit 1
fi

GH=~/.local/bin/gh

# 检查认证状态
echo ""
echo "步骤 1/4: 检查 GitHub 认证状态..."
if ! $GH auth status &> /dev/null; then
    echo "未检测到 GitHub 认证，请先运行以下命令完成登录："
    echo ""
    echo "    ~/.local/bin/gh auth login"
    echo ""
    echo "操作提示："
    echo "  - 选择 GitHub.com"
    echo "  - 选择 HTTPS"
    echo "  - 选择 Login with a web browser"
    echo "  - 按回车后浏览器会自动打开，点击 Authorize 即可"
    echo ""
    echo "认证完成后，请重新运行此脚本。"
    exit 1
fi

echo "✅ GitHub 认证已确认"

# 创建仓库
echo ""
echo "步骤 2/4: 创建 GitHub 仓库..."
REPO_URL=$($GH repo create newbie-onboarding --public --source=. --remote=origin --push 2>/dev/null || true)

if [ -z "$REPO_URL" ]; then
    # 仓库可能已存在，尝试直接推送
    echo "仓库可能已存在，尝试直接推送..."
    git push -u origin main || git push -u origin master
    REPO_URL="https://github.com/maifeng618/newbie-onboarding"
else
    echo "✅ 仓库创建成功: $REPO_URL"
fi

# 启用 GitHub Pages
echo ""
echo "步骤 3/4: 启用 GitHub Pages..."
$GH api repos/maifeng618/newbie-onboarding/pages \
    --method PUT \
    --input - <<EOF
{"source":{"branch":"main","path":"/"}}
EOF

echo "✅ GitHub Pages 已启用"

# 输出访问链接
echo ""
echo "=========================================="
echo "  🎉 部署完成！"
echo "=========================================="
echo ""
echo "请等待 1-2 分钟后访问以下链接："
echo ""
echo "  主管配置端: https://maifeng618.github.io/newbie-onboarding/"
echo "  新人学习端: https://maifeng618.github.io/newbie-onboarding/newbie.html"
echo ""
echo "如果链接无法打开，请去 GitHub 仓库 Settings → Pages 中确认已启用。"
echo ""
