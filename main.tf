# main code

resource "kubernetes_namespace" "this" {
  for_each = var.namespaces
  metadata {
    name        = each.key
    labels      = each.value.labels
    annotations = each.value.annotations
  }
}

resource "kubernetes_config_map" "this" {
  for_each = var.config_maps
  metadata {
    name        = each.key
    namespace   = each.value.use_existing_namespace ? each.value.namespace : kubernetes_namespace.this[each.value.namespace].metadata[0].name
    labels      = each.value.labels
    annotations = each.value.annotations
  }

  data        = each.value.data
  binary_data = each.value.binary_data
}
