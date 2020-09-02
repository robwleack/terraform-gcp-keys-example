resource "random_string" "project_suffix" {
  length = 4
}

resource "google_project" "this" {
  project_id          = local.project_id
  name                = local.project_name
  auto_create_network = false
}

module "keys" {
  source       = "./modules/keys"
  project_id   = google_project.this.project_id
  region       = data.google_client_config.default.region
  keyring_name = "test-keyring"
  keys         = local.keys
}