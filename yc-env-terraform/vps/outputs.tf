output "vpc_subnet_id" {
  value = yandex_vpc_subnet.devops.id
}
output "vpc_subnet_name" {
  value = yandex_vpc_subnet.devops.name
}
output "vpc_subnet_zone" {
  value = yandex_vpc_subnet.devops.zone
}
output "vpc_subnet_v4_cidr_blocks" {
  value = yandex_vpc_subnet.devops.v4_cidr_blocks
}

output "vm_details" {
  value = [
    for instance in yandex_compute_instance.ansible : {
      name        = instance.name,
      ip_address  = instance.network_interface[0].nat_ip_address
    }
  ]
}