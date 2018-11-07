resource "google_sql_database_instance" "db-primary" {
  region = "${var.region}"
  database_version = "${var.db-version}"
  settings {
    tier = "${var.db-tier}"
    disk_autoresize = "true"
    ip_configuration {
      authorized_networks = [
        { value = "${var.authorized_network_0}" },
        { value = "${var.authorized_network_1}" },
        { value = "${var.authorized_network_2}" },
      ]
    }
    backup_configuration {
      enabled = "true"
      start_time = "${var.db-backup-start_time}"
    }
    location_preference {
      zone = "${lookup(var.region_params["${var.region}"],"zone1")}"
    }
  }
}