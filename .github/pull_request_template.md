## 概要

行ったバグ修正や機能追加の概要を説明。
外部のタスク管理ツールを利用している場合、そのツールが発行するタスクへのリンクを貼る。
UI に対する変更を行った場合、変更前 / 後 の画像を添付する。

## 確認方法

行った修正をレビュアーが確認するための手順を記載する。
例：
1. Gem を追加したので `bundle install` を実行してください
2. カラムを追加したので `bundle exec rails db:migrate` を実行してください
3. 顧客一覧画面に「資本金」項目が追加され、デフォルトが「未入力」になっていることを確認してください

## 影響範囲

行った修正が影響するであろう範囲を記載する。レビュアーが修正の影響範囲を予測できるようにする。

## チェックリスト

プロジェクトごとにパスしなければならないルールを定義する。
例：
- [ ] siderをパスした
- [ ] インテグレーションテストを追加した
- [ ] Lint のチェックをパスした
- [ ] ユニットテストをパスした
- [ ] 必要なドキュメントを作成した

## コメント

修正内容で気になる部分をメモ。
例：「ここのコードはもっとイケてる書き方がある気がしています」、「この部分は `FIXME` を残していますが時間の都合によりご勘弁を」など。レビュアーとのコミュニケーションを補助する。
