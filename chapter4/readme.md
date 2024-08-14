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