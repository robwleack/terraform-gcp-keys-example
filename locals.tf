locals {
  project_name = "gcp-keys-test"
  project_id   = "${local.project_name}-${random_string.project_suffix.result}"

  keys = {
    "keyA" = {
      "purpose"  = "ENCRYPT_DECRYPT"
      "bindings" = {
        "admin" = {
          role  = "roles/cloudkms.admin"
          users = local.users_admin
        },
        "basic" = {
          role  = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
          users = local.users_all
        }
      }
    },
    "keyB" = {
      "purpose"  = "ENCRYPT_DECRYPT"
      "bindings" = {
        "admin" = {
          role  = "roles/cloudkms.admin"
          users = local.users_admin
        },
        "basic" = {
          role  = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
          users = local.users_all
        }
      }
    }
  }

  users_all   = concat(local.users_basic, local.users_admin)
  users_admin = [
    "user:best.admin@example.com",
    "user:dev.ops@yahoo.com",
  ]
  users_basic = [
    "user:john.doe@example.com",
    "user:jane.doe@yahoo.com",
    "user:best.admin@example.com",
    "user:dev.ops@yahoo.com",
  ]
}
