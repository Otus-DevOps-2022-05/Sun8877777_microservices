output "kube-master-ip" {
  value = yandex_compute_instance.kube-master[*].network_interface.0.nat_ip_address
}
output "kube-worker-ip" {
  value = yandex_compute_instance.kube-worker[*].network_interface.0.nat_ip_address
}
