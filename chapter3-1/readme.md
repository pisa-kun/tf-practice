## chapter3-1

https://alpacat.com/posts/cloudrun-cloudsql-with-terraform  
https://zenn.dev/ring_belle/books/gcp-cloudrun-terraform/viewer/cloudsql  
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance  

### 環境構築

`chapter3-1/stage/dev`でterraform init

### CloudSQLのデプロイ

#### Cloud SQLの側の作成
最低限の箱だけ作成
```
resource "google_sql_database_instance" "instance" {
  project = var.project_id

  name             = var.db_instance_name
  region           = var.region
  database_version = "POSTGRES_15"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection = "false"
}
```

#### Cloud SQLにdatabaseを作成
dbとユーザー作成
```
# Cloud SQLにDBを作成
resource "google_sql_database" "database" {
  project = var.project_id

  name     = "database"
  instance = google_sql_database_instance.instance.name
}

# Cloud SQLにユーザーを追加
resource "google_sql_user" "users" {
  project = var.project_id

  name     = var.db_username
  instance = google_sql_database_instance.instance.name
  password = var.db_password
}
```

#### デプロイ

secret.tfvarsに設定を記載しておいて、引数に渡すと逐一入力しなくてよい。

```
db_username = "test_user"
db_password = "database_user_password"
project_id = "hogehoge_project"
```

> terraform plan -var-file="secret.tfvars"

> terraform apply -var-file="secret.tfvars"