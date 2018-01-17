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
      binary_log_enabled = "true"
      enabled = "true"
      start_time = "${var.db-backup-start_time}"
    }
    location_preference {
      zone = "${lookup(var.region_params["${var.region}"],"zone1")}"
    }
  }
}

resource "google_sql_database_instance" "db-failover" {
  region = "${var.region}"
  count = "${var.ha ? 1 : 0}"
  database_version = "${var.db-version}"
  master_instance_name = "${google_sql_database_instance.db-primary.name}"
  replica_configuration {
    failover_target = "true"
    }
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
    location_preference {
      zone = "${lookup(var.region_params["${var.region}"],"zone2")}"
    }
  }
}
