# Okayok Skills

[English](README.md) | 简体中文

开源、可复用的 AI 智能体 **skills**（技能）——以 `SKILL.md` 格式编写的分步操作手册，智能体（或人）照着做就能稳定地完成一项重复性工作。

每个 skill 都沉淀自实践中跑通的流程，并去除了所有个人信息，你可以直接放进自己的智能体环境里按需调整。

## Skills 一览

**第一次来？从 [`product-lifecycle-overview`](skills/product-lifecycle-overview/) 开始——它是把其他所有 skill 按顺序串起来的总地图**（命名 → 建站 → 部署 → SEO → 提交搜索引擎 → 数据分析 → 发版 → 增长）。

| Skill | 适用场景 |
| --- | --- |
| [产品全生命周期总览](skills/product-lifecycle-overview/) | 端到端上线或迁移一个软件产品，需要一张把各个 skill 串起来的全局流程图。**从这里开始。** |
| [品牌命名](skills/brand-naming/) | 为新软件产品或品牌起名：排查候选名的冲突，选出易于品牌化且利于 SEO 的名字。 |
| [基于共享模板搭建或迁移网站](skills/scaffold-or-migrate-site/) | 用共享模板搭建新的产品网站，或把已有网站迁移到统一模板上，包括替换所有名称和文案。 |
| [域名与部署](skills/domain-and-deploy/) | 把产品网站接到域名或子域名：DNS、托管、CI/CD、基于 tag 的生产发布以及部署令牌。 |
| [技术 SEO 配置](skills/technical-seo/) | 产品网站的页面与技术 SEO：标题、描述、canonical、唯一 H1、robots、sitemap、结构化数据、favicon 和 OG。 |
| [提交搜索引擎](skills/search-engine-submission/) | 在 Google Search Console 和 Bing Webmaster Tools 验证网站、提交 sitemap，并配置 IndexNow。 |
| [网站数据分析配置](skills/web-analytics/) | 为产品网站接入 GA4 数据流和会话分析工具，统一到一个媒体资源下，并验证数据实时上报。 |
| [桌面应用发版](skills/desktop-app-release/) | 发布 macOS（或跨平台）桌面应用：图标、代码签名与公证、GitHub Releases、自动更新，以及加速签名。 |
| [共享页脚与产品列表](skills/shared-footer-product-list/) | 为跨产品的页脚链接和“我们的产品”列表维护单一数据源，在同一产品家族的所有网站间同步。 |
| [运营与增长](skills/operations-growth/) | 持续的运营与增长：受众渠道、账号矩阵、发帖节奏和社区互动，提升曝光。 |
| [X 涨粉手册](skills/x-growth/) | 通过真诚互动（先提供价值的回复、互关、build in public 发帖）运营 Twitter/X 账号涨粉，所有发布内容都需人工审批。 |

## 格式

每个 skill 放在 `skills/` 下各自的文件夹中：

```
skills/
  <skill-name>/
    SKILL.md        # 必需：操作手册本体
    ...             # 可选：模板、示例、脚本
```

`SKILL.md` 以 YAML frontmatter 开头，后面是 Markdown 正文：

```markdown
---
name: skill-name
description: 一句话说明智能体应在什么情况下使用这个 skill。
---

# 标题

步骤、规则、模板……
```

- `name`——简短，使用 kebab-case，与文件夹同名。
- `description`——用一句话说明**何时**使用该 skill，智能体据此判断是否适用。

## 使用方法

- **支持 skills 的智能体**：把 skill 文件夹复制（或软链接）到智能体的 skills 目录，智能体会读取 frontmatter 来决定何时加载。
- **任意智能体**：把 `SKILL.md` 的内容粘贴到系统提示词或任务说明里。
- **人工阅读**：直接看就行——它们本身就是清晰的检查清单。

Skill 只是起点。把占位符（`<Product>`、`<URL>` 等）换成你自己的信息，并根据实际情况调整数量、语气和规则。

## 原则

- 凡是公开或不可逆的操作（发帖、发消息、关注、花钱），都要**有人把关**。
- **不含私人数据**——skill 中不包含任何人名、账号、邮箱、路径或密钥。
- **重实操、轻理论**——每一步都应该是能实际执行的。

## 参与贡献

欢迎改进现有 skill 或新增 skill。

1. Fork 本仓库并新建分支。
2. 按上面的格式新增或修改 `skills/<skill-name>/SKILL.md`。
3. 保持通用：用占位符代替真实账号、产品或个人信息。
4. 提交 Pull Request，说明这个 skill 做什么、你改了什么。

## 许可证

[MIT](LICENSE) © 2026 Okayok
