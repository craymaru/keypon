<div align="center"><img src="https://i.imgur.com/7lkQS6B.png" width="400"/></div>

> Saving keybindings, keep on with you!

このアプリケーションはキーバインディングを記録し共有するために作成しました
エンジニア、デザイナー、ゲーマーなど普段パソコンで作業する方向けのアプリになればと思いデザインしました

This application is created to record and share key bindings. Designed to be an application for engineers, designers, gamers, etc. who usually work on PC/Mac.

## 使用技術

## アプリケーション | App.

### Back

| Name          | Version | Install by |
| ------------- | ------- | ---------- |
| Ruby          | 2.6.5   | rbenv      |
| Ruby On Rails | 6.0.2.1 | gem        |
| devise        |         |

### Front

| Name       | Version | Install by   |
| ---------- | ------- | ------------ |
| bootstrap  |         | package.json |
| bootswatch |         | package.json |
| JQuery     |         | package.json |

## デプロイ環境 | Deployment Env.

### Servers

- デプロイに`Docker`を使用するため、`Amazon ECS` を採用しました。

| Name                            | Role                                             |
| ------------------------------- | ------------------------------------------------ |
| Docker                          |                                                  |
| Amazon ECS                      | コンテナデプロイ                                 |
| -- CloudFormation               |                                                  |
| -- Auto Scaling                 |                                                  |
| -- EC2                          | 学習のため `Fargate` は使用せず `EC2` で自己管理 |
| -- RDS                          |                                                  |
| -- EIP                          |                                                  |
| -- ALB                          |                                                  |
| Amazon Route 53                 | DNS サーバー                                     |
| [Porkbun](https://porkbun.com/) | Domain リセラー                                  |

### Others

| Name       | Role               |
| ---------- | ------------------ |
| Amazon ECR | コンテナレジストリ |

Docker
Amazon ECR
ALB

Nginx
Puma
Rails

| Name    | Version |
| ------- | ------- |
| Ruby    | 2.6.5   |
| rbenv   | 1.1.2   |
| Bundler | 2.1.4   |

## 開発環境 | Development Env.

- 当初は開発環境でもメリットを活かすため `Docker` を採用しましたが、`Volumeマウント`のパフォーマンスと `Railsコマンド`の遅さを理由に、`Vagrant` 環境を新しく作り、開発を移行しました

### Vagrant

| Name           | Version |
| -------------- | ------- |
| MacOS Catalina | 10.15.3 |
| docker         | 19.03.5 |
| docker-compose | 1.25.4  |

### Docker (old)

| Name           | Version |
| -------------- | ------- |
| MacOS Catalina | 10.15.3 |
| docker         | 19.03.5 |
| docker-compose | 1.25.4  |

## Design | デザイン
