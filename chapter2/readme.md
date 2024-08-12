## chapter2

https://cloud.google.com/docs/terraform/get-started-with-terraform?hl=ja


### gcloudでプロジェクトの設定

> gcloud init

対象のメールアドレスとプロジェクトを指定

> gcloud config configurations list

で作成したプロジェクト設定に切り替わっているか確認

### Compute Engine APIの有効化

> gcloud services enable compute.googleapis.com

> gcloud compute instances list

```
Listed 0 items.
```

と表示されればOK

### terraform を初期化する

terraform initを実行して必要なプラグインを追加する。
.tteraformディレクトリをビルドできる。

> terraform init

#### terraform構成を検証する

Dry-Run(事前検証)する。
> terraform plan