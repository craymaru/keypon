
<a href="http://keypon.io">
<div align="center"><img src="https://i.imgur.com/cOKwldl.png" width="600"/></div>
</a>


# KEYPON とは？ | About KEYPON

> keypon.io
> Saving keybindings, keep on with you!


このアプリケーションはキーバインディングを記録し共有するために作成しました🐈
エンジニア、デザイナー、ゲーマーなど普段パソコンで作業する方が使用していただけるアプリになることを願っております🙏

This application is created to record and share key bindings. I hope that this application will be used by engineers, designers, gamers, etc. who usually work on PC / Mac. 

# 使用技術 | Technology Uses

## アプリケーション | App.

### Back

| Name                  | Version | Packager | Note                      |
| --------------------- | ------- | -------- | ------------------------- |
| Ruby                  | 2.6.5   | rbenv    |                           |
| bundler               | 2.1.4   | gem      |                           |
| yarn                  | 1.12.1  | -        |                           |
| Ruby On Rails         | 6.0.2.1 | gem      |                           |
| Puma                  | 4.3.3   | gem      |                           |
| actioncable           | 6.0.2   | yarn     |                           |
| actiontext            | 6.0.2-1 | yarn     |                           |
| activestorage         | 6.0.2   | yarn     |                           |
| devise                | 4.7.1   | gem      | 認証管理                  |
| impressionist          | 1.6.1   | gem      | PV数調査                  |
| ransack               | 2.3.2   | gem      | 検索機能強化              |
| spring-watcher-listen | 2.0.1   | gem      | (dev) bin読み込み速度向上 |
| guard-livereload      | 2.5.2   | gem      | (dev) 自動プレビュー      |
| rufo                  | 0.12.0  | gem      | (dev) Syntax監視          |
| acts-as-taggable-on   | 6.5.0   | gem      | タグ管理                  |
| shrine                | 3.2.1   | gem      | 画像アップロード          |
| image_processing      | 1.10.3  | gem      | 画像処理                  |
| mini_magick           | 4.10.1  | gem      | 画像リサイズ              |


### Front

| Name                      | Version | Packager | Note               |
| ------------------------- | ------- | -------- | ------------------ |
| webpacker                 | 4.2.2   | gem      | 依存関係により重複 |
| turbolinks                | 5.2.1   | gem      | 依存関係により重複 |
| webpacker                 | 4.2.2   | yarn     |                    |
| turbolinks                | 5.2.0   | yarn     |                    |
| JQuery                    | 3.4.1   | yarn     |                    |
| popper.js                 | 1.16.1  | yarn     |                    |
| typeahead.js              | 0.11.1  | yarn     |                    |
| trix                      | 1.2.3   | yarn     |                    |
| bootstrap                 | 4.4.1   | yarn     |                    |
| bootswatch                | 4.4.1   | yarn     |                    |
| bootstrap-tagsinput       | 0.7.1   | yarn     |                    |
| bootstrap-material-design | 4.1.2   | yarn     | Disabled           |
| fontawesome               | 5.12.1  | yarn     |                    |
| webpack-dev-server        | 3.10.3  | yarn     | (dev)              |


### Database
| Name  | Version | Role             |
| ----- | ------- | ---------------- |
| MySQL | 5.7     | (Production) RDB |
| MySQL | 5.7     | (Dev) Docker     |
| MySQL | 5.7.29  | (Dev) Vagrant    |



# デプロイ構成 | Deployment Stracture

## 大まかな流れ

| Name     | Role                                                                                                                 |
| -------- | -------------------------------------------------------------------------------------------------------------------- |
| GitHub   | ソースコードリポジトリ、ビルドイメージの元となるソース                                                               |
| CircleCI | Nginx、Rails コンテナのBuild、`ECR`へのPush、<br>CLI経由で`ECS クラスター`上の`サービス`および`タスク`のアップデート |
| ECR      | コンテナリポジトリ                                                                                                   |
| EC2      | `Docker` とコンテナたち の実態が走るVM                                                                                       |

<a href="https://i.imgur.com/bGhcUFC.png" style="margin:0.5rem">
<div align="center"><img src="https://i.imgur.com/bGhcUFC.png" width="800px"/></div>
</a>


## AWS
* デプロイに`Docker`を使用するため、`Amazon ECS` を採用しました。

| Name               | Role                                              |
| ------------------ | ------------------------------------------------- |
| ECS                | コンテナデプロイ                                  |
| -- CloudFormation  | プロビジョニング                                  |
| -- Auto Scaling    | コンテナのオートスケーリング                      |
| -- EC2             | 学習のため `Fargate` は使用せず `EC2` で自己管理  |
| -- ALB             | ロードバランシング                                |
| -- InternetGateway | ゲートウェイ                                      |
| RDS                | `MySQL 5.7` データベース                                  |
| VPC                | ネットワーク                                      |
| S3                 | コンテナがエフェメラルなため 画像ファイルの永続化 |
| CloudWatch         | コンテナのリアルタイムロギング                    |


## Domain & DNS
| Name                                                                                                               | Role            |
| ------------------------------------------------------------------------------------------------------------------ | --------------- |
|　Elastic IP            | Global IP                                                 |
| Route 53   | Domain Name Server                                     |
| <img src="https://porkbun.com/partners/logos/porkbun.comphpPkl2eU.svg" width="22"/>[Porkbun](https://porkbun.com/) | Domain Reseller    
<a href="https://imgur.com/rVbSIzA.png"  style="margin:0.5rem">
<div align="center"><img src="https://imgur.com/rVbSIzA.png" width="800px"/></div>
</a>



## Containers

| Container Name    | Role | Memo                    |
| ----------------- | ---- | ----------------------- |
| Nginx             | Web  | Production, Development |
| Rails 6 with Puma | App  | Production, Development |
| MySQL             | DB   | Only Development        |
<a href="https://imgur.com/KmDq53X.png" style="margin:0.5rem">
<div align="center"><img src="https://imgur.com/KmDq53X.png" width="800px"/></div>
</a>


# ローカル開発環境 | Development Env.

* 当初は開発環境でもメリットを活かすため `Docker` を採用しましたが、`Volumeマウント`のパフォーマンスとRailsコマンド実行時の遅延を理由に、`Vagrant` 環境を新しく作り、開発を移行しました

## Host Maschine

| Name           | Version |
| -------------- | ------- |
| MacOS Catalina | 10.15.3 |
| docker         | 19.03.5 |
| docker-compose | 1.25.4  |
| VirtualBox     | 6.1.4   |
| Vagrant        | 2.2.7   |

## Webpacker
* 従来の app/assets 以下の読み込みではなく `Rails 6` で標準化された `Webpacker` を採用して JavaScript、CSS、Static な Image をプロバイドしています。


# ライセンス
