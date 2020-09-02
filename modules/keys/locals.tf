locals {
  key_bindings_flattened = flatten([
    for key_name, k in var.keys : [
      for binding_name, binding in k.bindings : {
        key_name = key_name
        binding_name = binding_name
        role = binding.role
        users = binding.users
      }
    ]
  ])

  key_bindings = {
    for binding in local.key_bindings_flattened : "${binding.key_name}_${binding.binding_name}" => binding
  }
}
