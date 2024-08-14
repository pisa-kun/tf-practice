# Cloud SQLインスタンスの作成
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