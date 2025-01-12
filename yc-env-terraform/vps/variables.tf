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
    }))
  default = {
    # "centos7-01" = {
    #   platform_id="standard-v2"
    #   vm_name="jenkins-master"
    #   cpu=2
    #   ram=4
    #   core_fraction=5
    #   type="network-hdd"
    #   disk_volume=10
    #   network_interface=true
    #   scheduling_policy=true
    #   os_family="fd86t5b1o1dujno51lmc"
    # }
    # "centos7-02" = {
    #   platform_id="standard-v2"
    #   vm_name="jenkins-agent"
    #   cpu=2
    #   ram=4
    #   core_fraction=5
    #   type="network-hdd"
    #   disk_volume=10
    #   network_interface=true
    #   scheduling_policy=true
    #   os_family="fd86t5b1o1dujno51lmc"
    # }
    # "fedora" = {
    #   platform_id="standard-v2"
    #   vm_name="fedora"
    #   cpu=2
    #   ram=1
    #   core_fraction=5
    #   type="network-hdd"
    #   disk_volume=10
    #   network_interface=true
    #   scheduling_policy=true
    #   os_family="fd89sn80q3auso2rionh"
    # }
    # "ubuntu-2204-lts-01" = {
    #   platform_id="standard-v2"
    #   vm_name="jenkins-master"
    #   cpu=2
    #   ram=1
    #   core_fraction=5
    #   type="network-hdd"
    #   disk_volume=10
    #   network_interface=true
    #   scheduling_policy=true
    #   os_family="fd857s9nlophtetqniuu" 
    # }
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
    }
  }
}