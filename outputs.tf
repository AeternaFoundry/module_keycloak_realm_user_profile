output "realm_user_profiles_id" {
  description = "Map of id values across all realm_user_profiles, keyed the same as var.realm_user_profiles except keys with no id are omitted"
  value       = { for k, v in keycloak_realm_user_profile.realm_user_profiles : k => v.id if v.id != null && length(v.id) > 0 }
}
output "realm_user_profiles_attribute" {
  description = "Map of attribute values across all realm_user_profiles, keyed the same as var.realm_user_profiles except keys with no attribute are omitted"
  value       = { for k, v in keycloak_realm_user_profile.realm_user_profiles : k => v.attribute if v.attribute != null && length(v.attribute) > 0 }
}
output "realm_user_profiles_group" {
  description = "Map of group values across all realm_user_profiles, keyed the same as var.realm_user_profiles except keys with no group are omitted"
  value       = { for k, v in keycloak_realm_user_profile.realm_user_profiles : k => v.group if v.group != null && length(v.group) > 0 }
}
output "realm_user_profiles_realm_id" {
  description = "Map of realm_id values across all realm_user_profiles, keyed the same as var.realm_user_profiles except keys with no realm_id are omitted"
  value       = { for k, v in keycloak_realm_user_profile.realm_user_profiles : k => v.realm_id if v.realm_id != null && length(v.realm_id) > 0 }
}
output "realm_user_profiles_unmanaged_attribute_policy" {
  description = "Map of unmanaged_attribute_policy values across all realm_user_profiles, keyed the same as var.realm_user_profiles except keys with no unmanaged_attribute_policy are omitted"
  value       = { for k, v in keycloak_realm_user_profile.realm_user_profiles : k => v.unmanaged_attribute_policy if v.unmanaged_attribute_policy != null && length(v.unmanaged_attribute_policy) > 0 }
}

