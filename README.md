# 新人入职 Landing 系统

> AE供应链-供应链商家规则&体验部 · 新人入职指引系统

## 访问链接

部署到 GitHub Pages 后，通过以下链接访问：

- **主管配置端**：`https://你的用户名.github.io/仓库名/`
- **新人学习端**：`https://你的用户名.github.io/仓库名/newbie.html`

## 部署到 GitHub Pages 步骤

### 方式一：网页上传（最简单，无需命令行）

1. 打开 [github.com/new](https://github.com/new) 创建一个新仓库
2. 仓库名称填写 `newbie-onboarding`（或任意名称）
3. 选择 **Public**（GitHub Pages 必须公开仓库才能免费使用）
4. 点击 **Create repository**
5. 在新仓库页面，点击 **uploading an existing file**
6. 将本文件夹中的 `index.html` 和 `newbie.html` 两个文件拖拽上传
7. 点击 **Commit changes**
8. 进入仓库的 **Settings** → 左侧 **Pages**
9. Source 选择 **Deploy from a branch**，Branch 选择 **main** / **root**，点击 **Save**
10. 等待 1-2 分钟，访问 `https://你的用户名.github.io/仓库名/` 即可

### 方式二：命令行推送

```bash
# 1. 在 GitHub 创建空仓库（不要勾选 README）
# 2. 进入本文件夹执行以下命令

git remote add origin https://github.com/你的用户名/仓库名.git
git branch -M main
git push -u origin main

# 3. 进入仓库 Settings → Pages → 选择 main 分支 → Save
# 4. 等待 1-2 分钟即可访问
```

## 系统说明

### 主管配置端（index.html）
- 部门学习资料配置
- 归档路径设置
- 业务模块及 Owner 管理
- 任务列表与进度跟进
- 新人学习进展概览

### 新人学习端（newbie.html）
- 四阶段学习路径（第1周 / 第3-4周 / 第5-8周 / 第9-12周）
- 模块学习与完成标记
- Q&A 问答系统
- 组织架构图查看
- 交付物提交追踪

## 技术栈

- React 18（UMD，通过 CDN 加载）
- Babel Standalone（浏览器内编译 JSX）
- Tailwind CSS CDN
- FontAwesome 图标

纯前端实现，无需后端服务。
