output "id" {
  description = "The ID of the Diagnostic Setting."
  value       = try(azurerm_monitor_diagnostic_setting.this[0].id, "")
}
