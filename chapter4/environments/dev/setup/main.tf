module "master" {
  source = "../../../modules/setup"

#   Required attribute "region" not specified: An attribute named "region" is required hereTerraform
# Required attribute "environment" not specified: An attribute named "environment" is required hereTerraform
# Required attribute "project_id" not specified: An attribute named "project_id" is required hereTerraform
    region = var.region
    environment =  var.environment
    project_id = var.project_id
    instance_name = var.instance_name
    machine_type = var.machine_type

}