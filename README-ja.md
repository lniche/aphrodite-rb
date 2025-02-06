# Aphrodite Rails API Scaffold

[English](README.md) | [简体中文](README-zh.md) | [日本語](README-ja)

Aphrodite は、[Rails](https://rubyonrails.org) をベースに開発されたテンプレートプロジェクトで、開発者がフレームワークの使用フローを迅速に理解し、深く学ぶことを目的としています。このプロジェクトは、一般的な開発シーンを網羅した包括的なサンプルコードと設定を提供し、学習と実践をサポートします。さらに、Aphrodite にはコンテナーデプロイメントテンプレートも含まれており、現代のクラウド環境でプロジェクトを簡単にデプロイおよび管理できるようになっており、開発者がアプリケーションを効率的に構築および公開する手助けをします。

## 技術スタック

| 技術                                                                     | 説明                                                                                                                                           |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| [pg](https://rubygems.org/gems/pg)                                       | PostgreSQL データベースアダプタで、PostgreSQL データベースとの接続と操作機能を提供します。                                                     |
| [redis](https://rubygems.org/gems/redis)                                 | Redis クライアントライブラリで、Rails アプリケーションで Redis データベースと連携し、キャッシュやメッセージキューなどの機能をサポートします。  |
| [puma](https://rubygems.org/gems/puma)                                   | 高性能な Ruby Web サーバーで、Rails アプリケーションのデプロイに広く使用され、マルチスレッドおよびマルチプロセスモードをサポートします。       |
| [bootsnap](https://rubygems.org/gems/bootsnap)                           | Rails アプリケーションの起動時間を高速化するツールで、ロードプロセスを最適化し、リクエスト毎の起動時間を短縮します。                           |
| [rails](https://rubygems.org/gems/rails)                                 | Rails フレームワークのコアライブラリで、Web アプリケーションを迅速に開発するための MVC アーキテクチャを提供します。                            |
| [rack-cors](https://rubygems.org/gems/rack-cors)                         | クロスオリジンリソース共有 (CORS) を処理するミドルウェアライブラリで、クロスオリジンアクセスを可能にします。                                   |
| [sprockets-rails](https://rubygems.org/gems/sprockets-rails)             | Rails 内で JavaScript および CSS ファイルを前処理するライブラリで、リソースを結合および圧縮します。                                            |
| [stimulus-rails](https://rubygems.org/gems/stimulus-rails)               | StimulusJS を使って Rails フレームワークと統合し、複雑なフロントエンドインタラクションを構築するためのライブラリです。                         |
| [turbo-rails](https://rubygems.org/gems/turbo-rails)                     | Hotwire の一部で、Turbo 機能を追加し、完全なページリフレッシュなしでインターフェイスを更新することでウェブの速度とユーザー体験を向上させます。 |
| [rswag](https://rubygems.org/gems/rswag)                                 | API ドキュメントの生成と表示を行うライブラリで、Swagger API ドキュメント規格をサポートします。                                                 |
| [rswag-api](https://rubygems.org/gems/rswag-api)                         | API ドキュメント生成、リクエスト検証などの機能を提供し、Swagger 規格に準拠した API ドキュメントを自動生成します。                              |
| [rswag-ui](https://rubygems.org/gems/rswag-ui)                           | Swagger API ドキュメントを表示する UI を提供し、`rswag-api` と組み合わせてインタラクティブな API ドキュメントインターフェースを生成します。    |
| [bcrypt](https://rubygems.org/gems/bcrypt)                               | パスワードの暗号化とセキュリティ認証を提供するライブラリで、パスワードハッシュ機能を備えています。                                             |
| [devise](https://rubygems.org/gems/devise)                               | Rails のユーザー認証ソリューションで、登録、ログイン、パスワードリセットなどの機能を提供します。                                               |
| [jwt](https://rubygems.org/gems/jwt)                                     | JSON Web Token (JWT) の Ruby 実装で、トークンの生成と検証を行います。                                                                          |
| [importmap-rails](https://rubygems.org/gems/importmap-rails)             | フロントエンド JavaScript リソースの管理に Importmap を使用し、パッケージマネージャーやバンドルプロセスの複雑さを避けます。                    |
| [jbuilder](https://rubygems.org/gems/jbuilder)                           | JSON レスポンスを生成するための Ruby ライブラリで、Rails API 開発に適しています。                                                              |
| [tzinfo-data](https://rubygems.org/gems/tzinfo-data)                     | 時間帯データを提供するライブラリで、Rails アプリケーションが Windows や JRuby プラットフォーム上で時刻を正しく処理できるようにします。         |
| [brakeman](https://rubygems.org/gems/brakeman)                           | Rails アプリケーションのセキュリティ脆弱性を静的解析で検出するツールです。                                                                     |
| [debug](https://rubygems.org/gems/debug)                                 | Ruby の組み込みデバッグツールで、開発中にアプリケーションのデバッグに使用します。                                                              |
| [dotenv-rails](https://rubygems.org/gems/dotenv-rails)                   | `.env` ファイルから環境変数をロードするライブラリで、開発環境での設定管理を簡単にします。                                                      |
| [rubocop-rails-omakase](https://rubygems.org/gems/rubocop-rails-omakase) | Rails プロジェクト向けの RuboCop ルールを提供し、コードスタイルの自動検査を行います。                                                          |
| [rspec-rails](https://rubygems.org/gems/rspec-rails)                     | Rails 向けのテストフレームワーク統合で、RSpec テストの作成と実行をサポートします。                                                             |
| [rswag-specs](https://rubygems.org/gems/rswag-specs)                     | Swagger 規格に準拠した RSpec 拡張で、API ドキュメントの自動生成をサポートします。                                                              |
| [web-console](https://rubygems.org/gems/web-console)                     | Rails 開発ツールで、ブラウザ内で直接 Ruby コードを実行でき、デバッグを簡単にします。                                                           |
| [capybara](https://rubygems.org/gems/capybara)                           | Web アプリケーションの自動テストツールで、ブラウザとのインタラクションをシミュレートし、統合テストや受け入れテストに適しています。             |
| [selenium-webdriver](https://rubygems.org/gems/selenium-webdriver)       | ブラウザの自動操作を行うライブラリで、複数のブラウザをサポートし、UI テストで広く使用されます。                                                |

## 特徴

- **ユーザー認証と認可**：基本的なユーザーログインと権限付与機能を提供します。
- **分散ロック**：Redis をベースにした分散ロックを実装し、分散環境下でのリソースの安全性を確保します。
- **ミドルウェアサポート**：認証、リクエストログ、CORS 処理など、よく使われるミドルウェアを内蔵しています。
- **統一された出力フォーマット**：簡単に使える API Result の統一出力方式を提供し、API のレスポンスフォーマットを標準化して、インターフェースの一貫性を向上させます。
- **API モジュール設計**：モジュール化された API 設計をサポートし、拡張と保守が容易です。
- **Swagger ドキュメント統合**：API ドキュメントを自動生成し、フロントエンド開発とテストを容易にします。

## ディレクトリ構造

```
.
├── app/                # アプリケーションのコアコード
├── bin/                # 実行可能なスクリプト
├── config/             # 設定ファイル
├── db/                 # データベース関連
├── deploy/             # デプロイ関連ファイル
├── docs/               # プロジェクトドキュメント
├── lib/                # カスタムライブラリファイル
├── public/             # 公共リソース
├── storage/            # ファイルストレージ
├── test/               # テストファイル
├── tmp/                # 一時ファイル
├── vendor/             # サードパ-partyコード
└── README.md           # プロジェクト説明
```

## ローカルでの実行

```bash
# 1. プロジェクトのコードリポジトリをクローン
git clone https://github.com/lniche/aphrodite-rb.git
cd aphrodite-rb

# 2. 設定ファイルの準備
cd config
mv .env.example .env

# 3. 依存関係の処理
# Ruby と Rails 環境がインストールされていることを確認してください。rbenv の使用を推奨します
bundle install

# 4. データベースの初期化
db/migrate/V1.0.0__initial_schema.sql

# 5. サービスの起動
bin/rails server

# Swagger の生成
rake rswag:specs:swaggerize
```

## リポジトリの活動

![Alt](https://repobeats.axiom.co/api/embed/92f87152abeaf234940e0a4979ac2644ab05a54f.svg "Repobeats analytics image")

## ライセンス

このプロジェクトは MIT ライセンスに従っています。

## 感謝の意

すべてのコントリビューターとサポーターに感謝します。皆さんのご支援が私たちにとって非常に重要です！
