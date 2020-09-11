
## 概要
「日々の面倒なお金の管理を簡単にしたい」

## 制作の背景
毎日の面倒な処理を少しでも楽にしていきたい。
もっとこれ、便利になればいいのに...

そういう、想いはいろんな場面であるのですが
今回はお金の管理処理に注目してみました!

わざわざ、自分のノートに収入と支出を記録して今月使えるお金を考えるの
自分はすごくめんどくさいです。

なので、このアプリケーションを作りました。



## 機能一覧
* ログイン・ログアウト機能
* 収入・支出機能
* カレンダー表示
* レスポンシブデザイン

![README-responsive](https://user-images.githubusercontent.com/60662524/88524761-bb736480-d034-11ea-94d1-dcfec3fc4266.png)

詳細は下記よりご確認ください。

https://docs.google.com/spreadsheets/d/1zn1J7OT1fU9TOgGupXXd03vXP6VqDejtVFZ6z9pqhcQ/edit#gid=1830135488

## 環境・使用技術
### フロントエンド
* Bootstrap 4.1.1
* SCSS (BEM)
* JavaScript、jQuery

### バックエンド
* ruby 2.6.1p
* Rails 6.0.3.2

### 開発環境
* atom
* Docker/Docker-compose
* postgres

### 本番環境(この環境する予定ですが、エラーが起きていて今はherokuで動かしています)
* AWS (EC2、RDS for MySQL、Route53、CloudWatch、S3、Lambda)
* MySQL2
* Nginx、 Puma
* CircleCIを用いてdocker-composeでコンテナを構築しCapistranoにより自動デプロイ


### テスト
* Rspec

## About me
現在Sirでjava,springbootを用いて開発を行っております!
2020年7月から新しい技術を学びたくいろいろな言語の勉強中です。
今年はRuby on Railsを極めたいと思っています。
