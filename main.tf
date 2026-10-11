resource "kubernetes_validating_admission_policy_v1" "validating_admission_policy_v1s" {
  for_each = var.validating_admission_policy_v1s

  spec     = each.value.spec
  metadata = each.value.metadata

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

