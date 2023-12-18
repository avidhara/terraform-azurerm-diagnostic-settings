resource "azurerm_monitor_diagnostic_setting" "this" {
  count = var.create_diagnostic_setting ? 1 : 0

  name                           = var.name
  target_resource_id             = var.target_resource_id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = var.log_analytics_destination_type
  partner_solution_id            = var.partner_solution_id

  storage_account_id = var.storage_account_id


  dynamic "enabled_log" {
    for_each = var.enabled_log
    content {
      category       = try(enabled_log.value.category, null)
      category_group = try(enabled_log.value.category_group, null)

      dynamic "retention_policy" {
        for_each = try(enabled_log.value.retention_policy, [])

        content {
          enabled = try(retention_policy.value.enabled, true)
          days    = try(retention_policy.value.days, 0)
        }

      }
    }
  }

  dynamic "metric" {
    for_each = var.metric

    content {
      category = try(metric.value.category)
      enabled  = try(metric.value.enabled, true)
      dynamic "retention_policy" {
        for_each = try(metric.value.retention_policy, [])

        content {
          enabled = try(retention_policy.value.enabled, true)
          days    = try(retention_policy.value.days, 0)
        }

      }

    }

  }

}
