output "db-instance" {
  value = "${google_sql_database_instance.db-primary.name}"
}
