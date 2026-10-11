resource "keycloak_realm_user_profile" "realm_user_profiles" {
  for_each = var.realm_user_profiles

  realm_id                   = each.value.realm_id
  unmanaged_attribute_policy = each.value.unmanaged_attribute_policy

  dynamic "attribute" {
    for_each = each.value.attribute != null ? each.value.attribute : []
    content {
      annotations        = attribute.value.annotations
      default_value      = attribute.value.default_value
      display_name       = attribute.value.display_name
      enabled_when_scope = attribute.value.enabled_when_scope
      group              = attribute.value.group
      multi_valued       = attribute.value.multi_valued
      name               = attribute.value.name
      dynamic "permissions" {
        for_each = attribute.value.permissions != null ? [attribute.value.permissions] : []
        content {
          edit = permissions.value.edit
          view = permissions.value.view
        }
      }
      required_for_roles  = attribute.value.required_for_roles
      required_for_scopes = attribute.value.required_for_scopes
      dynamic "validator" {
        for_each = attribute.value.validator != null ? attribute.value.validator : []
        content {
          config = validator.value.config
          name   = validator.value.name
        }
      }
    }
  }

  dynamic "group" {
    for_each = each.value.group != null ? each.value.group : []
    content {
      annotations         = group.value.annotations
      display_description = group.value.display_description
      display_header      = group.value.display_header
      name                = group.value.name
    }
  }
}

