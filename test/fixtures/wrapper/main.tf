module "extensive_kitchen_terraform" {
  os_family = "${var.os_family}"

  # The generated key pair will be used to configure SSH authentication
  public_key  = "${"~/.ssh/id_rsa.pub"}"
  private_key = "${"~/.ssh/id_rsa"}"

  # The source of the module is the root directory of the Terraform project
  source        = "../../../"
  tf_test       = "true"
  salt_test     = "false"
  env           = "qa"
  minion_config = "../../../etc/salt/minion.linux"
  grains.config = "../../../etc/salt/grains"

  #   subnet_availability_zone = "${var.subnet_availability_zone}"
}
