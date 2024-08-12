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