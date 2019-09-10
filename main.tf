data "azurerm_client_config" "current" {}

resource "azuread_application" "main" {
  name = var.name
}

resource "azuread_service_principal" "main" {
  application_id = azuread_application.main.application_id
}

resource "random_string" "client_secret" {
  length  = 32
  special = false
}

resource "azuread_service_principal_password" "main" {
  service_principal_id = azuread_service_principal.main.id
  value                = random_string.client_secret.result
  end_date             = var.valid_until

  # Hacky workaround to wait for service principale recplication within Azure even though this should have been fixed in
  # https://github.com/terraform-providers/terraform-provider-azuread/issues/4
  provisioner "local-exec" {
    command = "sleep 15"
  }
}

resource "azurerm_role_assignment" "main" {
  count                = var.skip_role_assignment ? 0 : 1
  role_definition_name = var.role_name
  scope                = var.scope
  principal_id         = azuread_service_principal.main.id
}
