output "realm_user_profiles_id" {
  description = "Map of id values across all realm_user_profiles, keyed the same as var.realm_user_profiles"
  value       = { for k, v in keycloak_realm_user_profile.realm_user_profiles : k => v.id }
}
output "realm_user_profiles_attribute" {
  description = "Map of attribute values across all realm_user_profiles, keyed the same as var.realm_user_profiles"
  value       = { for k, v in keycloak_realm_user_profile.realm_user_profiles : k => v.attribute }
}
output "realm_user_profiles_group" {
  description = "Map of group values across all realm_user_profiles, keyed the same as var.realm_user_profiles"
  value       = { for k, v in keycloak_realm_user_profile.realm_user_profiles : k => v.group }
}
output "realm_user_profiles_realm_id" {
  description = "Map of realm_id values across all realm_user_profiles, keyed the same as var.realm_user_profiles"
  value       = { for k, v in keycloak_realm_user_profile.realm_user_profiles : k => v.realm_id }
}
output "realm_user_profiles_unmanaged_attribute_policy" {
  description = "Map of unmanaged_attribute_policy values across all realm_user_profiles, keyed the same as var.realm_user_profiles"
  value       = { for k, v in keycloak_realm_user_profile.realm_user_profiles : k => v.unmanaged_attribute_policy }
}

