module "devops" {
  source         = "./vps"
  default_zone   = "ru-central1-a"
  default_cidr   = ["10.0.2.0/24"]
  vpc_name       = "net_dev"

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
  template       = file("./cloud-init.yml")
  vars           = {
    ssh_authorized_keys = var.vms_ssh_root_key
  }
}