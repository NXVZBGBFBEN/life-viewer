# life-viewer
[![wakatime](https://wakatime.com/badge/github/NXVZBGBFBEN/life-viewer.svg)](https://wakatime.com/badge/github/NXVZBGBFBEN/life-viewer)

Processingを使ったライフゲームの実装

## ビルドについて
ビルドには以下のツールを利用できる環境が必要です．  
Processing IDE を用いず，コマンドライン上でビルドすることを想定しています．

- Python3 (``python3``)
- Processing4 (``processing-java``)

life-viewerは``processing-java``コマンドのwrapperとして，ビルドスクリプト(``make.py``)を同梱しています．  
構文を以下に示します．

```console
> python3 ./make.py <command>
```

|``<command>``|説明|
|:--|:--|
|``--help``|ビルドスクリプトに関するヘルプを表示します(未実装)|
|``--build``|プロジェクトをビルドします|
|``--run``|プロジェクトをビルドして実行します|
|``--present``|プロジェクトをビルドしてフルスクリーンで実行します|
|``--export``|プロジェクトをJavaアプリケーションとして書き出します|

## ウィンドウについて
life-viewerを起動すると，2つのウィンドウが展開されます．  

以下に示すのがメインウィンドウです．このウィンドウはセルの表示のみを行ないます．

![main](https://github.com/NXVZBGBFBEN/life-viewer/assets/107386214/f50eddc2-c1d0-4df1-9596-183f164208f4)

以下に示すのがコントロールウィンドウです．このウィンドウを用いて色の変更や速度指定などを行ないます．(未実装)

![control](https://github.com/NXVZBGBFBEN/life-viewer/assets/107386214/87d42ca7-d603-411b-8445-07d947a3d6df)

## 設定ファイルについて
life-viewerは設定ファイルの読み込み・書き出しに対応しています．  
以下の順でより上位のものが読み込まれ，ファイルが存在しない場合は起動時に自動作成されます．

1. ``$XDG_CONFIG_HOME/life-viewer/config.xml``
2. ``$HOME/.config/life-viewer/config.xml``

## バグ報告等について
life-viewerは未だ開発中です．バグの報告やアイディア等は[Issues](https://github.com/NXVZBGBFBEN/life-viewer/issues)ページにてご報告ください．
