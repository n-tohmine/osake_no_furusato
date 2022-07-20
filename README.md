# お酒のふるさと（仮）

## ■ サービス概要
「醸造所訪問を目的として旅行先を決める」がコンセプトのサービスです。</br>
工場見学ができるお酒の醸造所と近隣の宿泊施設が検索できます。

## ■ メインのターゲットユーザー
- 年代・性別問わずお酒と旅行が好きな人。
- お酒の製造工程に興味がある人。
- 観光地やリゾート地以外の旅の目的を探している人。

## ■ ユーザーが抱える課題
- 工場見学検索サイトは既に複数存在するが、下記のような課題がある。
  - 幅広いカテゴリーの工場見学をカバーしているため関係ないものも多く表示される。
  - ビール、ワイン、ウイスキー、日本酒といったお酒の種類ごとに工場見学を探すのに手間が掛かる。
  - 工場までの経路はサイトを離れて別途調べなければいけない。
  - 宿泊施設の情報が無いor少ないので自宅から遠いところは避けてしまう。

## ■ 解決方法
- お酒×旅行に特化した工場見学検索サービスで行きたい醸造所探し〜宿泊先探しまでサポートする。

## ■ 実装予定の機能
- 全ユーザー
  - 醸造所検索
  - 醸造所詳細閲覧
  - 醸造所までのルート検索
  - 醸造所付近の宿泊施設検索
  - レビュー閲覧

- 登録ユーザー
  - 「気になる」機能
  - Like機能
  - レビューのCRUD
  - プロフィール登録（名前、アイコン、居住地、好きなお酒、自己紹介）※名前以外は任意。
  - 他登録ユーザーのプロフィールおよび「気になる」一覧とLike一覧の閲覧 

- 管理ユーザー
  - 登録ユーザーのCRUD
  - 醸造所のCRUD

## ■ なぜこのサービスを作りたいのか？
私はビール工場見学や酒蔵巡りが好きなのですが、当日は試飲をすることもあり自宅からのアクセスが良好で日帰りで行ける範囲の醸造所にしか行ったことがありませんでした。</br>
そこで旅行と組み合わせたサービスを作ることで、今まで選択肢から外れていた地域の醸造所に足を運ぶ機会を増やせるのではないかと考えました。</br>
また、今まで訪問する醸造所は「〇〇(お酒の種類) △△（地域名） 工場見学」で検索して上位に出てくるまとめサイトを見て決めており、かなり限られた選択肢の中で行き先を決定していました。</br>
自分の希望条件に合う醸造所を手軽に検索・比較して行き先を決められるサービスがあれば便利だと思い、このサービスを作りたい思いました。

## ■ スケジュール
  企画〜技術調査：7/5〆切</br>
  README〜ER図作成：7/14〆切</br>
  メイン機能実装：7/14 - 8/21</br>
  β版をRUNTEQ内リリース(MVP)：8/21〆切</br>
  本番リリース：9/7

## ■ 画面遷移図
  https://www.figma.com/file/dTFlWM1YL6FdvlkjloLYLR/osake_no_furusato?node-id=0%3A1

## ■ ER図
  https://app.diagrams.net/#G1JIX66lvmo5c4tBlxh5iXga8ZugkIbhXg