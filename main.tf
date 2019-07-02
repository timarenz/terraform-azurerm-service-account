data "azurerm_client_config" "current" {}

resource "azuread_application" "main" {
  name = var.application_name
}

resource "azuread_service_principal" "main" {
  application_id = "${azuread_application.main.application_id}"
}

resource "random_string" "client_secret" {
  length  = 32
  special = false

}

resource "azuread_service_principal_password" "main" {
  end_date             = var.valid_until
  service_principal_id = "${azuread_service_principal.main.id}"
  value                = "${random_string.client_secret.result}"
}

resource "azurerm_role_assignment" "main" {
  role_definition_name = var.role_name
  scope                = var.scope
  principal_id         = azuread_service_principal.main.id

}
