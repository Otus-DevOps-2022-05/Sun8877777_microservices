terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
}
provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

data "yandex_compute_image" "my_image" {
  family = "ubuntu-1804-lts"
}

resource "yandex_compute_instance" "kube-master" {
  name        = "kube-master"
  platform_id = "standard-v2"
  zone        = var.zone

  resources {
    cores  = 4
    memory = 4
    core_fraction = 20
  }

  labels = {
     tags = "master"
  }

  boot_disk {
    initialize_params {
      image_id = "${data.yandex_compute_image.my_image.id}"
      size = 40
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

}

resource "yandex_compute_instance" "kube-worker" {
  count       = var.count_inst
  name        = "kube-worker-${count.index}"
  platform_id = "standard-v2"
  zone        = var.zone

  resources {
    cores  = 4
    memory = 4
    core_fraction = 20
  }

  labels = {
     tags = "worker"
  }

  boot_disk {
    initialize_params {
      image_id = "${data.yandex_compute_image.my_image.id}"
      size = 40
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

