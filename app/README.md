# フロントエンド

## ディレクトリとファイル構成

- src: ソースファイル
  - App.tsx: SPA のルーティング
  - pages: 全画面表示のコンポーネント。基本的に View の呼び出しと通信ロジックのみ
  - components: React コンポーネント
    - common: 共通コンポーネントがある
    - task: タスク page のコンポーネント
    - notification: 通知 page のコンポーネント
      - 〇〇 View.tsx: 全画面表示のコンポーネント。スタイル

## コミット時の注意点

- npm run format
- npm run lint
- npm run test.unit
- npm run build

## コンポーネント

- 〇〇.tsx: React コンポーネント。スタイル専門
- 〇〇.model.ts: コンポーネントのロジック定義
- 〇〇.state.ts: コンポーネントの状態定義
- 〇〇.props.ts: コンポーネントの props 定義
- ??.test.ts: テストコードのファイル
