provider "google" {
  project = "kubernetes-417314"
  region  = "us-central1"
  credentials = file("./cred.json")
}

resource "google_container_cluster" "assignment_cluster" {
  name               = "k8s"
  location           = "us-central1-a"
  initial_node_count = 1

  node_config {
    machine_type = "e2-micro"
    disk_size_gb = 10
    disk_type = "pd-standard"
    image_type = "COS_CONTAINERD"
  }
}


resource "google_compute_disk" "persistent_disk" {
  name  = "disk"
  type  = "pd-standard"
  zone  = "us-central1-a" 
  size  = 10
}
