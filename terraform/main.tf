resource "google_compute_network" "aia_vpc" {
  name                    = "aia-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "aia_subnet" {
  name          = "aia-subnet"
  ip_cidr_range = "10.10.0.0/20"
  region        = var.region
  network       = google_compute_network.aia_vpc.id

  secondary_ip_range {
    range_name    = "pods-range"
    ip_cidr_range = "10.20.0.0/16"
  }

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "10.30.0.0/20"
  }
}

resource "google_container_cluster" "aia_gke" {
  name     = "aia-gke-zonal"
  location = var.zone

  network    = google_compute_network.aia_vpc.id
  subnetwork = google_compute_subnetwork.aia_subnet.name

  deletion_protection = false

  initial_node_count = 1

  node_config {
    machine_type = "e2-small"
    disk_type    = "pd-standard"
    disk_size_gb = 30

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods-range"
    services_secondary_range_name = "services-range"
  }
}
