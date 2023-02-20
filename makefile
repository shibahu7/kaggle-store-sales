ARG=

build-once:
	docker-compose -f docker-compose.yml -f docker-compose.createbuckets.yml up

# 実験フォルダの一覧取得
list-experiments:
	mlflow experiments search

# 実験フォルダの作成
create-experiments:
	mlflow experiments create -n ${ARG}

# 実験フォルダのダウンロード
get-experiments:
	mlflow experiments csv -x ${ARG}
	tar -zcvf mlruns.tar.gz mlruns/
	rm -r mlruns/

# TODO: 実験画像のダウンロード boto3エラーになる