include .env

ARG=

build-once:
	docker-compose -f docker-compose.yml -f docker-compose.createbuckets.yml up

# 実験フォルダの一覧取得
list-experiments:
	MLFLOW_TRACKING_URI=${MLFLOW_TRACKING_URI} mlflow experiments search

# 実験フォルダの作成
create-experiments:
	MLFLOW_TRACKING_URI=${MLFLOW_TRACKING_URI} mlflow experiments create -n ${ARG}

# 実験フォルダのダウンロード
get-experiments:
	MLFLOW_TRACKING_URI=${MLFLOW_TRACKING_URI} mlflow experiments csv -x ${ARG}
	tar -zcvf mlruns.tar.gz mlruns/
	rm -r mlruns/

# TODO: 実験画像のダウンロード boto3エラーになる