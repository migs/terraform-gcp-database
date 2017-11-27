output "db-instance-name" {
  value = "${google_sql_database_instance.db-primary.name}"
}

output "db-instance-ip" {
  value = "${google_sql_database_instance.db-primary.ip_address.0.ip_address}"
}
