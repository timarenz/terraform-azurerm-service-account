output "id" {
  value = azurerm_role_assignment.main[0].id
}

output "client_id" {
  value = azuread_application.main.application_id
}

output "client_secret" {
  depends_on = [azuread_service_principal_password.main]
  value      = random_string.client_secret.result
  sensitive  = true
}

output "tenant_id" {
  value = data.azurerm_client_config.current.tenant_id
}

output "subscription_id" {
  value = data.azurerm_client_config.current.subscription_id
}
