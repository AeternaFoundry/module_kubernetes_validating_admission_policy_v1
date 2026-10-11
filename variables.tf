variable "validating_admission_policy_v1s" {
  description = <<EOT
Map of validating_admission_policy_v1s, attributes below
Required:
    - spec
Optional:
    - metadata
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    spec = object({
      audit_annotations = list(object({
        key              = string
        value_expression = string
      }))
      failure_policy = string
      match_conditions = optional(list(object({
        expression = string
        name       = string
      })))
      match_constraints = object({
        exclude_resource_rules = optional(list(object({
          api_groups     = list(string)
          api_versions   = list(string)
          operations     = list(string)
          resource_names = optional(list(string))
          resources      = list(string)
          scope          = optional(string)
        })))
        match_policy = optional(string)
        namespace_selector = optional(object({
          match_expressions = optional(list(object({
            key      = optional(string)
            operator = optional(string)
            values   = optional(list(string))
          })))
          match_labels = optional(map(string))
        }))
        object_selector = optional(object({
          label_selector = optional(object({
            match_expressions = optional(list(object({
              key      = optional(string)
              operator = optional(string)
              values   = optional(list(string))
            })))
            match_labels = optional(map(string))
          }))
        }))
        resource_rules = optional(list(object({
          api_groups     = list(string)
          api_versions   = list(string)
          operations     = list(string)
          resource_names = optional(list(string))
          resources      = list(string)
          scope          = optional(string)
        })))
      })
      param_kind = optional(object({
        api_version = string
        kind        = string
      }))
      validations = optional(list(object({
        expression         = string
        message            = string
        message_expression = optional(string)
        reason             = optional(string)
      })))
      variables = optional(list(object({
        expression = optional(string)
        name       = optional(string)
      })))
    })
    metadata = optional(object({
      annotations      = optional(map(string))
      generate_name    = optional(string)
      generation       = optional(number)
      labels           = optional(map(string))
      name             = optional(string)
      namespace        = optional(string)
      resource_version = optional(string)
      uid              = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
}

