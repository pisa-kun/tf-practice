## chapter4

https://zenn.dev/oyasumipants/articles/8f0ac1a3395520

### 環境構築

`chapter4/stage/dev`でterraform init

### フォルダ構成

- environments
配下では環境（開発、ステージング、本番など）ごとに module を呼び出す root module となるコードを格納します

- environments/dev/setup
配下では開発環境で setup module を呼び出す root module となるコードを格納します

- modules
配下では再利用可能な　Terraform　コード（モジュール）を格納します

```
.
├── readme.md
├── environments　# 🆕 各環境を想定（開発、ステージング、本番など）
│   ├── dev
│   │   └── setup　# 🆕 setup module を呼び出す root module　等を格納する
│   │       ├── main.tf
│   │       └── variable.tf
│   ├── prd
│   └── stg
└── modules # 🆕　再利用可能なTerraformコード（モジュール）を格納するディレクトリ
    └── setup
        ├── compute_instance.tf
        ├── provider.tf
        └── variable.tf
```

#### init

Terraform 設定ファイルがあるディレクトリ（ environments/dev/setup/ ）に移動し、そのディレクトリでこのコマンドを実行します。
> terraform init

### deploy

> terraform plan -var-file="secret.tfvars"

> terraform apply -var-file="secret.tfvars"

### tfstateファイルの管理

```
.
├── README.md
├── commons　# 🆕 環境で共通のリソースを置く想定
│   └── backend_setup # 🆕 Cloud Storageを構成する
│       ├── main.tf
│       ├── provider.tf
│       └── variable.tf
├── environments # 各環境を想定（開発、ステージング、本番など）
└── modules # 再利用可能なTerraformコード（モジュール）を格納するディレクトリ
```

この状態でterraform applyしてbucketを作成する。

そのあとに`backend.tf`を作成してterraform init → terraform applyする。

```
terraform {
  backend "gcs" {
    bucket = "sample-terraform-state-bucket" // your gcs bucket name
    prefix = "commons/backend_setup"         // your gcs prefix
  }
}
```

#### setup moduleのtfstateもStorage管理

```
.
├── README.md
├── commons　#　環境で共通のリソースを置く想定
├── environments
│   └── dev
│       └── setup
│           ├── backend.tf　# 🆕 tfstate を Cloud Storage で管理する
│           ├── main.tf
│           └── variable.tf
├── environments # 各環境を想定（開発、ステージング、本番など）
└── modules # 再利用可能なTerraformコード（モジュール）を格納するディレクトリ
```