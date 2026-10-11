variable "realm_user_profiles" {
  description = <<EOT
Map of realm_user_profiles, attributes below
Required:
    - realm_id
Optional:
    - unmanaged_attribute_policy
    - attribute (block):
        - annotations (optional)
        - default_value (optional)
        - display_name (optional)
        - enabled_when_scope (optional)
        - group (optional)
        - multi_valued (optional)
        - name (required)
        - permissions (optional, block):
            - edit (required)
            - view (required)
        - required_for_roles (optional)
        - required_for_scopes (optional)
        - validator (optional, block):
            - config (optional)
            - name (required)
    - group (block):
        - annotations (optional)
        - display_description (optional)
        - display_header (optional)
        - name (required)
EOT

  type = map(object({
    realm_id                   = string
    unmanaged_attribute_policy = optional(string)
    attribute = optional(list(object({
      annotations        = optional(map(string))
      default_value      = optional(string)
      display_name       = optional(string)
      enabled_when_scope = optional(set(string))
      group              = optional(string)
      multi_valued       = optional(bool)
      name               = string
      permissions = optional(object({
        edit = set(string)
        view = set(string)
      }))
      required_for_roles  = optional(set(string))
      required_for_scopes = optional(set(string))
      validator = optional(list(object({
        config = optional(map(string))
        name   = string
      })))
    })))
    group = optional(list(object({
      annotations         = optional(map(string))
      display_description = optional(string)
      display_header      = optional(string)
      name                = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.realm_user_profiles : (
        v.unmanaged_attribute_policy == null || (contains(["DISABLED", "ENABLED", "ADMIN_VIEW", "ADMIN_EDIT"], v.unmanaged_attribute_policy))
      )
    ])
    error_message = "must be one of: \"DISABLED\", \"ENABLED\", \"ADMIN_VIEW\", \"ADMIN_EDIT\""
  }
}

