resource "yandex_vpc_network" "devops" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "devops" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.devops.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_compute_instance" "ansible" {
  for_each = var.each_vm
  name              = each.value.vm_name
  hostname          = each.value.vm_name
  platform_id       = each.value.platform_id
  zone              = var.default_zone
  resources {
    cores           = each.value.cpu
    memory          = each.value.ram
    core_fraction   = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id      = each.value.os_family
      type          = each.value.type
      size          = each.value.disk_volume
    }
  }
  scheduling_policy {
    preemptible     = each.value.scheduling_policy
  }
  network_interface {
    subnet_id       = yandex_vpc_subnet.devops.id
    nat             = each.value.network_interface
  }

  metadata = {
    for k, v in var.metadata : k => v
  }
}