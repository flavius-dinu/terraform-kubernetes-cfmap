# variables

variable "namespaces" {
  description = "Namespaces parameters"
  type = map(object({
    labels      = optional(map(string), {})
    annotations = optional(map(string), {})
  }))
  default = {}
}

variable "config_maps" {
  description = "Config map parameters"
  type = map(object({
    namespace              = string
    labels                 = optional(map(string), {})
    annotations            = optional(map(string), {})
    use_existing_namespace = optional(bool, false)
    data                   = optional(map(string), {})
    binary_data            = optional(map(string), {})
  }))
  default = {}
}
