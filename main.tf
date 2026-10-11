data "oci_devops_deploy_pipelines" "devops_deploy_pipelines_lookup" {
  for_each = var.devops_deploy_pipelines_lookup

  compartment_id = each.value.compartment_id
  display_name   = each.value.display_name
  project_id     = each.value.project_id
  state          = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

