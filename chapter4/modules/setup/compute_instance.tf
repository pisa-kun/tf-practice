# ComputeEngine のインスタンスを作成するための設定ファイル
resource "google_compute_instance" "sample_instance"{
    name = "${var.instance_name}-compute-instance"
    machine_type = var.machine_type
    zone = "asia-northeast1-a"

      boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"

    }
  }

  network_interface {
    network = "default" // your network name：今回はdefault
  }
}