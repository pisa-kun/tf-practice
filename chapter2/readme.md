## chapter2

https://cloud.google.com/docs/terraform/get-started-with-terraform?hl=ja


### gcloudでプロジェクトの設定

> gcloud init

対象のメールアドレスとプロジェクトを指定

> gcloud config configurations list

で作成したプロジェクト設定に切り替わっているか確認

> gcloud config set project <project-id>

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

#### variables.tfから変数名を使う

`var.変数名`で他ファイルから値を参照できる。
```main.tf
resource "google_compute_instance" "default" {
  name         = var.instance_name
```

```variables.tf
variable "instance_name" {
  type = string
  default = "kotosaki-instance"
}
```

defaultがない場合はterraform plan実行時に外部入力を求められる。

