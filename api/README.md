# Promise-Executioner API

## 概要

本アプリケーションのサーバーサイドで稼働し、ドメインロジックの演算、他のサービスとの中継、データベースとの接続を行う。

## 環境

- Swift 5.8
- [Vapor 4](https://vapor.codes)
- PostgreSQL 15

## 開発環境構築

1. Xcodeのインストール
1. Postgreでサーバー用とテスト用のデータベースを用意
1. open Package.swift
1. Xcodeの[Custom Working Directoryの設定](https://docs.vapor.codes/getting-started/xcode/#custom-working-directory)
1. `cp example.env .env.testing`して設定
1. `cp example.env .env`して設定
1. Xcodeの実行引数に`migrate`を追加して実行
1. Xcodeの実行引数に`migrate --env testing`を追加して実行
1. Xcodeの実行引数をなくして実行し、サーバーを立てる
1. ⌘uで全てのテストを実行する

## ディレクトリ構成

- Source: プログラムファイルディレクトリ
    - App: サーバー実行ディレクトリ
        - Controllers: コントローラー
    - Entity: ドメインモデル
    - Persistence: データベース実装
        - Migration: テーブル操作クエリ
        - Model: ORMモデル
        - Repository: リポジトリの実装
    - Repository: 永続仮想のprotocol
    - Testing: テストで使用する擬似値
    - Usecase: ユースケース
- Tests: テストディレクトリ


## Database設計

```mermaid
erDiagram

    users {
        uuid id PK
        string name
        string display_name
    }

    tasks {
        uuid id PK
        uuid user_id FK
        string title
        string note
    }
    users ||--o{ tasks: "所有"
    
    send_message_to_user_penalties {
        uuid id PK
        uuid task_id FK
        uuid destin_user_id FK
        int amount
        string note
        string message
        datetime executed_at
    }
    tasks ||--o{ send_message_to_user_penalties: "所有"
    users ||--o{ send_message_to_user_penalties: "宛先"

    push_button_conditions {
        uuid id PK
        uuid task_id FK
        datetime completed_at
        datetime failed_at
    }
    tasks ||--o{ push_button_conditions: "所有"

    push_button_condition_deadline_restrictions {
        uuid id PK
        uuid push_button_condition_id FK
        datetime deadline
    }

    push_button_conditions ||--o| push_button_condition_deadline_restrictions: "所有"
```