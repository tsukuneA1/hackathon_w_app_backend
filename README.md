# Engineer Connect(名前要検討) - Backend API

## 概要

Engineer Connect は、AI を活用したソフトウェアエンジニア向けのプラットフォームのバックエンド API です。GitHub プロファイルの分析機能とエンジニア同士のネットワーキングを支援します。

このプロジェクトは、[元のリポジトリ](https://github.com/tsukuneA1/hackathon_w_app) から派生し、モノレポ構成から独立したバックエンドプロジェクトとして分離されました。

## 技術スタック

- **Backend**: Ruby on Rails 8 (API モード)
- **Database**: PostgreSQL
- **Authentication**: GitHub OAuth + JWT
- **AI Integration**: OpenAI GPT-3.5-turbo
- **Platform**: Docker 対応

## プロジェクトの目的

- 新しいエンジニアの技術コミュニティ参入支援
- AI によるコーディングスキルの客観的な可視化
- 技術的なコミュニケーションの促進
- エンジニアの専門的成長をサポート

## 主要機能

- GitHub OAuth 認証
- リポジトリデータの同期・分析
- AI を活用したプロファイル分析
- コード品質の評価
- スキルベースのエンジニアマッチング

## MVC アーキテクチャ図

```
┌─────────────────────────────────────────────────────────────┐
│                       Frontend (Next.js)                    │
│                   ┌─────────────────────┐                   │
│                   │     View Layer      │                   │
│                   │   (React Components) │                  │
│                   └─────────────────────┘                   │
└─────────────────────────┬───────────────────────────────────┘
                          │ HTTP API Requests
                          │
┌─────────────────────────▼───────────────────────────────────┐
│                    Backend (Rails 8 API)                    │
│                                                             │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │   Controllers   │  │     Models      │  │    Views     │ │
│  │                 │  │                 │  │   (JSON)     │ │
│  │ • AuthController│  │ • User Model    │  │              │ │
│  │ • UserController│  │ • Repo Model    │  │ • JSON       │ │
│  │ • RepoController│  │ • Analysis Model│  │   Response   │ │
│  │ • AIController  │  │                 │  │              │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
│           │                     │                           │
│           │                     │                           │
│  ┌────────▼─────────────────────▼──────────────────────────┐│
│  │                  Service Layer                          ││
│  │                                                         ││
│  │ • GitHub API Integration Service                        ││
│  │ • OpenAI Integration Service                            ││
│  │ • Profile Analysis Service                              ││
│  │ • Authentication Service                                ││
│  └─────────────────────────────────────────────────────────┘│
└─────────────────────────┬───────────────────────────────────┘
                          │
┌─────────────────────────▼───────────────────────────────────┐
│                     Database Layer                          │
│                                                             │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │   PostgreSQL    │  │   External APIs │  │    Cache     │ │
│  │                 │  │                 │  │              │ │
│  │ • users         │  │ • GitHub API    │  │ • Redis      │ │
│  │ • repositories  │  │ • OpenAI API    │  │   (Optional) │ │
│  │ • analyses      │  │                 │  │              │ │
│  │ • sessions      │  │                 │  │              │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

## ターゲットユーザー

- AI 支援を活用するエンジニア
- 技術メンター
- 技術コミュニティのメンバー
- スキル向上を目指す学習者

## 開発状況

- プロジェクト基盤構築（進行中）
- GitHub OAuth 実装（進行中）
- データベース設計（進行中）
- AI 連携機能の開発準備

## セットアップ

### 前提条件

- Ruby 3.2+
- PostgreSQL
- Docker (オプション)

### ローカル開発環境構築

1. リポジトリのクローン
```bash
git clone https://github.com/tsukuneA1/hackathon_w_app_backend
cd backend
```

2. 依存関係のインストール
```bash
bundle install
```

3. データベースのセットアップ
```bash
rails db:create
rails db:migrate
```

4. サーバーの起動
```bash
rails server
```

## 関連リンク

- [元のリポジトリ](https://github.com/tsukuneA1/hackathon_w_app)
- フロントエンド: Next.js 15 + TypeScript
- AI 連携: OpenAI GPT-3.5-turbo

---

**注意**: このプロジェクトは開発初期段階にあり、機能は継続的に追加・更新されます。
