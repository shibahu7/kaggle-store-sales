import os
import mlflow

def main():
    # [プロジェクト名]_[git hash]_[日付 or 連番]
    # コマンドライン引数でexperiments_id or experiments_name を指定させる

    # mlflow trackingサーバのURLを指定
    mlflow.set_tracking_uri(os.environ["MLFLOW_TRACKING_URI"])

if __name__ == "__main__":
    main()
