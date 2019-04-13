# WhetherTest
Livedoorお天気APIを使用し、各都市の天気を表示するデモアプリ

## Description
このアプリは、Livedoorお天気Webサービス（Livedoor Weather Web Service / LWWS）にて提供されている全国142箇所の今日・明日・明後日の「天気予報」「予想気温」を表示することができます。

## Setup
適当なディレクトリに本プロジェクトを`git clone`してください。

```
$ cd hoge/hoge
$ git clone https://github.com/MasamiYamate/WhetherTest.git
```

`git clone`後、プロジェクトファイルに移動しPodfileで指定されたライブラリをインストールします。

```
$ cd WhetherTest/
$ pod install
```

## Task contents
課題内容は下記の通りです。

- 2画面以上の画面構成であること
  - LoadingView
    - アプリ起動後の読み込み画面
  - AreaSuggestView
    - 各地域に属する都市名を一覧表示し、選択する画面
  - WhetherDetailView
    - 都市選択後、選択した都市の天気予報詳細画面を表示する画面
- 何かしらの非同期通信を含む
  - Livedoorお天気WebサービスAPIとの非同期通信を実装
    - 情報取得後、Callbackにて取得内容をViewに反映
- 非同期通信の結果により、何かしら画面上の表示が変更される
  - AreaSuggestView
    - 全国地点定義表(RSS)から各エリア名、都市名を取得し、一覧表示する
  - WhetherDetailView
    - 選択した都市のIDを元に天気予報APIをリクエストし、画面に指定した都市の天気予報を表示する
    
## Architecture
今回前提として、**大規模なアプリを作るつもり**ということだったため、仕様変更や機能追加などが柔軟に対応しやすい**CleanArchitecture**を取り入れつつ開発を行っています。
