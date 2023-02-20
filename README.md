# kaggle - store salse
店舗の売上予測を行う[コンペ](https://www.kaggle.com/competitions/store-sales-time-series-forecasting/overview)。
データは[こちらから](https://www.kaggle.com/competitions/store-sales-time-series-forecasting/data)

## 開発環境
- Docker Desktop
- Python 3.10.6
- pip 23.0.1

Python は pyenv で仮想環境を作成した。

## 動かし方
notebookの実行のみの場合、細かいことは考えずに実行環境だけあればよい。実験管理まで行いたい場合はdockerで環境を作成しているので、dockerのインストールを事前にしておく。実験管理にはmlflowを使用。構成図は下記の通り。

- `cp .env.example .env`
- `.env` を設定する
    - AWS関係の環境変数があるが、ローカルで環境を閉じさせるので任意のもので構わない
- （初回のみ）バケットの作成が必要になるため、`make build-once` を行う
- `docker-compose up -d` でコンテナ群起動
    - mlflow UI: http://localhost:5000/
        - Minio UI: http://localhost:9001/
           - `.env` に設定したAWSの環境変数と同じものをMinio UI上で設定する
           - Access Keys > Create access key で設定が可能
        - pgadmin: http://localhost:81/
        - 基本的にmlflow UIのみを確認するので上記二つにアクセスはあまりしない

## ipynbの管理について
notebookの出力が変更されるたびに差分が出るのは管理がしづらい。`nbstripout`を使えば出力をcommit時に削除してくれるので便利。
```
$ pip install --upgrade nbstripout
```
## やることとやらないこと

- やること
    - mlflowを使った実験管理
    -
- やらないこと
    - パイプラインの作成
    -