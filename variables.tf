variable "project" { }
variable "region" { }
variable "prefix" { default = "default" }
variable "ha" { default = "false" }
variable "db-instance-name" { default = "default" }
variable "db-version" { default = "MYSQL_5_7" }
variable "db-tier" { default = "db-g1-small" }
variable "db-backup-start_time" { default = "02:00" }

# Region & Zone Map
variable "region_params" {
  type = "map"
  default {
    asia-east1 {
      zone1 = "asia-east1-a"
      zone2 = "asia-east1-b"
      zone3 = "asia-east1-c"
    }
    asia-northeast1 {
      zone1 = "asia-northeast1-a"
      zone2 = "asia-northeast1-b"
      zone3 = "asia-northeast1-c"
    }
    asia-south1 {
      zone1 = "asia-south1-a"
      zone2 = "asia-south1-b"
      zone3 = "asia-south1-c"
    }
    asia-southeast1 {
      zone1 = "asia-southeast1-a"
      zone2 = "asia-southeast1-b"
    }
    australia-southeast1 {
      zone1 = "australia-southeast1-a"
      zone2 = "australia-southeast1-b"
      zone3 = "australia-southeast1-c"
    }
    europe-west1 {
      zone1 = "europe-west1-b"
      zone2 = "europe-west1-c"
      zone3 = "europe-west1-d"
    }
    europe-west2 {
      zone1 = "europe-west2-a"
      zone2 = "europe-west2-b"
      zone3 = "europe-west2-c"
    }
    europe-west3 {
      zone1 = "europe-west3-a"
      zone2 = "europe-west3-b"
      zone3 = "europe-west3-c"
    }
    southamerica-east1 {
      zone1 = "southamerica-east1-a"
      zone2 = "southamerica-east1-b"
      zone3 = "southamerica-east1-c"
    }
    us-central1 {
      zone1 = "us-central1-a"
      zone2 = "us-central1-b"
      zone3 = "us-central1-c"
      zone4 = "us-central1-f"
    }
    us-east1 {
      zone1 = "us-east1-b"
      zone2 = "us-east1-c"
      zone3 = "us-east1-d"
    }
    us-east4 {
      zone1 = "us-east4-a"
      zone2 = "us-east4-b"
      zone3 = "us-east4-c"
    }
    us-west1 {
      zone1 = "us-west1-a"
      zone2 = "us-west1-b"
      zone3 = "us-west1-c"
    }
  }
}
