# outputs
output "config_maps" {
  description = "Config map outputs"
  value       = { for cfm in kubernetes_config_map.this : cfm.metadata[0].name => { "namespace" : cfm.metadata[0].namespace, "data" : cfm.data } }
}
