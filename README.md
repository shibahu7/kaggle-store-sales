# kaggle - store salse
店舗の売上予測を行う[コンペ](https://www.kaggle.com/competitions/store-sales-time-series-forecasting/overview)。
データは[こちらから](https://www.kaggle.com/competitions/store-sales-time-series-forecasting/data)

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