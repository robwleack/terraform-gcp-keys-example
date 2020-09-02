resource "google_kms_key_ring" "keyring" {
  location = var.region
  name     = var.keyring_name
}

resource "google_kms_crypto_key" "keys" {
  for_each = var.keys

  name     = each.key
  key_ring = google_kms_key_ring.keyring.id
  purpose  = each.value.purpose
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_crypto_key_iam_binding" "bindings" {
  for_each = local.key_bindings

  crypto_key_id = google_kms_crypto_key.keys[each.value.key_name].id
  role          = each.value.role
  members       = each.value.users
}
