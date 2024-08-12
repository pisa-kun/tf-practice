## chapter3

https://qiita.com/kawakawaryuryu/items/58d8afbb21155c2e9572

### ステートファイルの共有ストレージ

tfstateファイルを管理するバケットをまずは作成する

```main.tf
resource "google_storage_bucket" "terraform-state-store"{
  name = var.bucket_name
  location = var.region
  storage_class = "REGIONAL"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action{
      type="Delete"
    }
    condition {
      num_newer_versions = 5
    }
  }
}
```

> terraform init

> terraform plan

> terraform apply

### tfstateの設定

terraform.backedにbucket名を追加する。

```main.tf
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.40.0"
    }
  }

  backend "gcs" {
    bucket = var.bucket_name
  }
}

```

**terraform{}**ではvarを使って値渡しすることができない。
```
│ Error: Variables not allowed
│
│   on main.tf line 10, in terraform:
│   10:     bucket = var.bucket_name
│
│ Variables may not be used here.
```