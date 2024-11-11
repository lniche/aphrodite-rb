# Aphrodite Rails API Scaffold

Aphrodite 是一个基于 [Rails](https://rubyonrails.org) 开发的模板项目，旨在帮助开发者快速上手，深入理解框架的使用流程。该项目提供了全面的示例代码和配置，涵盖了常见的开发场景，以便于学习和实践。此外，Aphrodite 还包含容器部署模板，使得项目在现代云环境中能够轻松部署与管理，助力开发者高效构建和发布应用。

## 技术栈

| 技术                                                                     | 说明                                                                                                |
| ------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------- |
| [pg](https://rubygems.org/gems/pg)                                       | PostgreSQL 数据库适配器，提供与 PostgreSQL 数据库的连接和操作功能。                                 |
| [redis](https://rubygems.org/gems/redis)                                 | Redis 客户端库，用于在 Rails 应用中与 Redis 数据库交互，支持缓存、消息队列等功能。                  |
| [puma](https://rubygems.org/gems/puma)                                   | 高性能的 Ruby Web 服务器，广泛用于部署 Rails 应用，支持多线程和多进程模式。                         |
| [bootsnap](https://rubygems.org/gems/bootsnap)                           | 提速 Rails 应用启动时间的工具，优化加载过程，减少每次请求的启动时间。                               |
| [rails](https://rubygems.org/gems/rails)                                 | Rails 框架的核心库，提供全面的 MVC 架构，适用于快速开发 Web 应用程序。                              |
| [rack-cors](https://rubygems.org/gems/rack-cors)                         | 用于处理跨域请求（CORS）的中间件库，使得跨域访问成为可能。                                          |
| [sprockets-rails](https://rubygems.org/gems/sprockets-rails)             | 处理 Rails 中的 JavaScript 和 CSS 文件的预处理器，用于将多种资源合并和压缩。                        |
| [stimulus-rails](https://rubygems.org/gems/stimulus-rails)               | 通过 StimulusJS 实现的 Rails 框架集成，用于构建复杂的前端交互。                                     |
| [turbo-rails](https://rubygems.org/gems/turbo-rails)                     | Hotwire 的一部分，优化网页的速度和用户体验，通过增加 Turbo 功能，使得无需完整页面刷新即可更新界面。 |
| [rswag](https://rubygems.org/gems/rswag)                                 | 用于生成和展示 API 文档的库，支持 Swagger API 文档规范。                                            |
| [rswag-api](https://rubygems.org/gems/rswag-api)                         | 提供 API 文档生成、请求验证等功能，用于自动化生成符合 Swagger 规范的 API 文档。                     |
| [rswag-ui](https://rubygems.org/gems/rswag-ui)                           | 提供用于展示 Swagger API 文档的 UI，支持与 `rswag-api` 结合生成交互式 API 文档界面。                |
| [bcrypt](https://rubygems.org/gems/bcrypt)                               | 用于加密密码和实现安全认证的库，提供密码哈希功能。                                                  |
| [devise](https://rubygems.org/gems/devise)                               | Rails 用户认证解决方案，提供注册、登录、密码重置等功能。                                            |
| [jwt](https://rubygems.org/gems/jwt)                                     | JSON Web Token (JWT) 的 Ruby 实现，用于处理令牌生成和验证。                                         |
| [importmap-rails](https://rubygems.org/gems/importmap-rails)             | 使用导入映射管理前端 JavaScript 资源，避免了包管理器和打包过程的复杂性。                            |
| [jbuilder](https://rubygems.org/gems/jbuilder)                           | 用于生成 JSON 响应的 Ruby 库，适用于 Rails API 开发。                                               |
| [tzinfo-data](https://rubygems.org/gems/tzinfo-data)                     | 提供时区数据的库，确保 Rails 应用在 Windows 或 JRuby 平台上的时区支持。                             |
| [brakeman](https://rubygems.org/gems/brakeman)                           | 用于检查 Rails 应用中的安全漏洞的静态分析工具。                                                     |
| [debug](https://rubygems.org/gems/debug)                                 | Ruby 内置调试工具，在开发中用于调试应用。                                                           |
| [dotenv-rails](https://rubygems.org/gems/dotenv-rails)                   | 用于加载 `.env` 文件中的环境变量，便于在开发环境中管理配置。                                        |
| [rubocop-rails-omakase](https://rubygems.org/gems/rubocop-rails-omakase) | 提供 Rails 项目特定的 RuboCop 规则，自动检查代码风格。                                              |
| [rspec-rails](https://rubygems.org/gems/rspec-rails)                     | Rails 测试框架集成，用于编写和运行 RSpec 测试。                                                     |
| [rswag-specs](https://rubygems.org/gems/rswag-specs)                     | 用于编写 Swagger 规范的 RSpec 扩展，支持 API 文档的自动化生成。                                     |
| [web-console](https://rubygems.org/gems/web-console)                     | Rails 开发工具，允许在浏览器中直接运行 Ruby 代码，便于调试。                                        |
| [capybara](https://rubygems.org/gems/capybara)                           | Web 应用自动化测试工具，提供了模拟用户与浏览器交互的功能，适合集成测试和验收测试。                  |
| [selenium-webdriver](https://rubygems.org/gems/selenium-webdriver)       | 用于控制浏览器进行自动化测试的库，支持多种浏览器，常用于 UI 测试。                                  |

## 特性

- **用户认证与授权**：提供基础的用户登录和权限授权功能。
- **分布式锁**：基于 Redis 实现的分布式锁，保证分布式环境下的资源安全。
- **中间件支持**：内置常用的中间件，包括认证、请求日志、跨域处理等。
- **统一输出格式**：提供简单易用的 API Result 统一输出方式，标准化 API 响应格式，提升接口一致性。
- **API 模块化设计**：支持模块化的 API 设计，易于扩展和维护。
- **Swagger 文档集成**：自动生成 API 文档，便于前端开发和测试。

## 模块说明

```
.
├── app/                # 应用核心代码
├── bin/                # 可执行脚本
├── config/             # 配置文件
├── db/                 # 数据库相关
├── deploy/             # 部署相关文件
├── docs/               # 项目文档
├── lib/                # 自定义库文件
├── public/             # 公共资源
├── storage/            # 文件存储
├── test/               # 测试文件
├── tmp/                # 临时文件
├── vendor/             # 第三方代码
└── README.md           # 项目说明
```

## 本地运行

```bash
# 1. 克隆项目代码库
git clone https://github.com/lniche/aphrodite-rb.git
cd aphrodite-rb

# 2. 配置文件
cd config
mv .env.example .env

# 3. 处理依赖
# 确保你已经安装了 Ruby 和 Rails 环境, 推荐使用rbenv
bundle install

# 4. 初始化数据库
db/init.sql

# 5. 启动服务
bin/rails server
```

## Repo Activity

![Alt](https://repobeats.axiom.co/api/embed/92f87152abeaf234940e0a4979ac2644ab05a54f.svg "Repobeats analytics image")

## 贡献

如果你有任何建议或想法，欢迎创建 Issue 或直接提交 Pull Request。

1. Fork 这个仓库。
2. 创建一个新的分支：

```
git checkout -b feature/your-feature
```

3. 提交你的更改：

```
git commit -m 'Add new feature'
```

4. 推送到你的分支：

```
git push origin feature/your-feature
```

5. 提交 Pull Request。

## 许可证

该项目遵循 MIT 许可证。

## 鸣谢

特别感谢所有贡献者和支持者，您的帮助对我们至关重要！
