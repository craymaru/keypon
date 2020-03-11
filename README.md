
<a href="http://keypon.io">
<div align="center"><img src="https://i.imgur.com/cOKwldl.png" width="600"/></div>
</a>


# デザイン | Design

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
| mpressionist          | 1.6.1   | gem      | PV数調査                  |
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



## デプロイ環境構成 | Deployment Env.

### サーバー構成

* 図に変える

| Name            | Role     |
| ----------------|--------- |
| Nginx           | Web Server         |
| Docker          |                    |


### AWS
* デプロイには`Docker`を使用するため、`Amazon ECS` を採用しました。

| Name              | Role                                             |
| ----------------- | ------------------------------------------------ |
| ECR        | コンテナレジストリ                               |
| ECS        | コンテナデプロイ                                 |
| -- CloudFormation |                                                  |
| -- Auto Scaling   |                                                  |
| -- EC2            | 学習のため `Fargate` は使用せず `EC2` で自己管理 |
| -- RDS            |                                                  |
| -- ALB            |                                                  |

### Domains
| Name                                                                                                               | Role            |
| ------------------------------------------------------------------------------------------------------------------ | --------------- |
|　Elastic IP            | Global IP                                                 |
| Route 53   | Domain Name Server                                     |
| <img src="https://porkbun.com/partners/logos/porkbun.comphpPkl2eU.svg" width="22"/>[Porkbun](https://porkbun.com/) | Domain Reseller                           |



# ローカル開発環境 | Development Env.

* 当初は開発環境でもメリットを活かすため `Docker` を採用しましたが、`Volumeマウント`のパフォーマンスとRailsコマンド実行時の遅延を理由に、`Vagrant` 環境を新しく作り、開発を移行しました

### Host Maschine

Name            | Version  |
--------------- | -------- |
MacOS Catalina  | 10.15.3  |
docker          | 19.03.5  |
docker-compose  | 1.25.4   |
VirtualBox      | 6.1.4    |
Vagrant         | 2.2.7    |
