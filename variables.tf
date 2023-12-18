variable "create_diagnostic_setting" {
  type        = bool
  description = "(Optional) Do you want to create the resource"
  default     = true
}

variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created."
}

variable "target_resource_id" {
  type        = string
  description = "(Required) The ID of an existing Resource on which to configure Diagnostic Settings. Changing this forces a new resource to be created."
}

variable "eventhub_name" {
  type        = string
  description = "(Optional) Specifies the name of the Event Hub where Diagnostics Data should be sent."
  default     = null
}

variable "eventhub_authorization_rule_id" {
  type        = string
  description = "(Optional) Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data."
  default     = null
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "(Optional) Specifies the ID of a Log Analytics Workspace where Diagnostics Data should be sent."
  default     = null
}

variable "log_analytics_destination_type" {
  type        = string
  description = "(Optional) Possible values are AzureDiagnostics and Dedicated. When set to Dedicated, logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table."
  default     = "AzureDiagnostics"
}

variable "partner_solution_id" {
  type        = string
  description = "(Optional) The ID of the market partner solution where Diagnostics Data should be sent. For potential partner integrations"
  default     = null
}

variable "storage_account_id" {
  type        = string
  description = "(Optional) The ID of the Storage Account where logs should be sent."
  default     = null
}

variable "enabled_log" {
  type        = any
  description = "(Optional) One or more enabled_log blocks, At least one enabled_log or metric block must be specified."
  default     = []
}

variable "metric" {
  type        = any
  description = "(Optional) One or more metric blocks, At least one enabled_log or metric block must be specified."
  default     = []
}

