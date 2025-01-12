variable "default_zone" {
  type        = string
}

variable "default_cidr" {
  type        = list(string)
  description = "ipv4 cidr"
}

variable "vpc_name" {
  type        = string
}

variable "metadata" {
  type        = map(string)
  default = {}
}

variable "each_vm" {
  type = map(object({
    platform_id=string
    vm_name=string
    cpu=number
    ram=number
    core_fraction=number
    type=string
    disk_volume=number
    network_interface=bool
    scheduling_policy=bool
    os_family=string
    user_data=bool
    }))
  default = {
    "ubuntu-2204-lts-02" = {
      platform_id="standard-v2"
      vm_name="gitlab-runner"
      cpu=2
      ram=1
      core_fraction=5
      type="network-hdd"
      disk_volume=10
      network_interface=true
      scheduling_policy=true
      os_family="fd857s9nlophtetqniuu"
      user_data=false
    }
    "ubuntu-1804" = {
      platform_id="standard-v3"
      vm_name="gitlab"
      cpu=4
      ram=8
      core_fraction=20
      type="network-hdd"
      disk_volume=20
      network_interface=true
      scheduling_policy=true
      os_family="fd8lp7dnlm6mmekfv5oi"
      user_data=false
    }
  }
}