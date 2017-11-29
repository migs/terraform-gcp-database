resource "random_id" "db-instance" {
  byte_length = 8
}

resource "google_sql_database_instance" "db-primary" {
  name = "${var.prefix}-db-${var.db-instance-name}-primary-${random_id.db-instance.dec}"
  region = "${var.region}"
  database_version = "${var.db-version}"
  settings {
    tier = "${var.db-tier}"
    disk_autoresize = "true"
    ip_configuration {
      require_ssl = "true"
      authorized_networks = "${var.authorized_networks}"
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
  name = "${var.prefix}-db-${var.db-instance-name}-failover-${random_id.db-instance.dec}"
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
      require_ssl = "true"
    }
    location_preference {
      zone = "${lookup(var.region_params["${var.region}"],"zone2")}"
    }
  }
}
