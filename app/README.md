# フロントエンド

## ディレクトリとファイル構成

- src: ソースファイル
  - App.tsx: SPAのルーティング
  - pages: 全画面表示のコンポーネント。基本的にViewの呼び出しと通信ロジックのみ
  - components: Reactコンポーネント
    - common: 共通コンポーネントがある
    - task: タスクpageのコンポーネント
    - notification: 通知pageのコンポーネント
      - 〇〇View.tsx: 全画面表示のコンポーネント。スタイル

## コミット時の注意点
- npm run format
- npm run lint
- npm run test.unit
- npm run build

## コンポーネント

- 〇〇.tsx: Reactコンポーネント。スタイル専門
- 〇〇.model.ts: コンポーネントのロジック定義
- 〇〇.state.ts: コンポーネントの状態定義
- 〇〇.props.ts: コンポーネントのprops定義
- ??.test.ts: テストコードのファイル

20日までの可能開発時間

- 大野
  - 40h
- 中道
  - 40h
- 田中
  - 25〜30h

## 土日何時〜何時
- 10時
