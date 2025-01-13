locals {
  cloud_init_configs = {
    vm1 = file("${path.module}/cloud-init/vm1.yaml")
    vm2 = file("${path.module}/cloud-init/vm2.yaml")
  }
}