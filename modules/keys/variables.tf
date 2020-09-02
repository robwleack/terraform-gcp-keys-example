variable "keyring_name" {
  description = "Name of the keyring to create"
}

variable "keys" {
  type = map(object({
    purpose  = string
    bindings = map(object({
      role  = string
      users = list(string)
    }))
  }))
}

variable "project_id" {
  description = "ID of the project to add the keys to"
}

variable "region" {
  description = "GCP region to use when creating resources"
}
