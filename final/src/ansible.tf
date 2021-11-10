###############################################################################
####################  node 1 ###################################
#############################################################################
resource "null_resource" "vmaz1" {
  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection' "
    ]
  }
  connection {
    host        = azurerm_network_interface.vm1.private_ip_address
    type        = "ssh"
    user        = "aipuser1"
    private_key = local.private_key
    agent       = false
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm1.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/azcli.yml -u aipuser1"
  }
  depends_on = [module.vm3]
}



resource "null_resource" "vm1" {
  count = length(var.vm1_packages)
  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection' "
    ]
  }
  connection {
    host        = azurerm_network_interface.vm1.private_ip_address
    type        = "ssh"
    user        = "aipuser1"
    private_key = local.private_key
    agent       = false
  }
  #download package
  provisioner "remote-exec" {
    inline = ["cd /tmp",
      "az login --service-principal --username '${var.client_id}' --password '${var.client_secret}' --tenant '${var.tenant_id}'",
      "az account set --subscription '${var.subscription_id}'",
      "az account list --output table",
      "az storage blob download --account-name '${var.storage_account_name}' --container-name '${var.container_name}' --name '${var.vm1_packages[count.index]}' --file '${var.vm1_packages[count.index]}'"
    ]
  }
  depends_on = [null_resource.vmaz1]
}

resource "null_resource" "install_package1" {
  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection' "
    ]
  }
  connection {
    host        = azurerm_network_interface.vm1.private_ip_address
    type        = "ssh"
    user        = "aipuser1"
    private_key = local.private_key
    agent       = false
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm1.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/java.yml -u aipuser1"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm1.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/zk-install.yml -u aipuser1"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm1.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/elastic-install.yml -u aipuser1"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm1.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/saga-install.yml -u aipuser1"
  }

  depends_on = [null_resource.vm1]
}


###############################################################################
####################  node 2 ###################################
#############################################################################
resource "null_resource" "vmaz2" {
  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection' "
    ]
  }

  connection {
    host        = azurerm_network_interface.vm2.private_ip_address
    type        = "ssh"
    user        = "aipuser2"
    private_key = local.private_key
    agent       = false
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm2.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/azcli.yml -u aipuser2"
  }

  depends_on = [null_resource.install_package1]
}

resource "null_resource" "vm2" {
  count = length(var.vm2_packages)
  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection' "
    ]
  }
  connection {
    host        = azurerm_network_interface.vm2.private_ip_address
    type        = "ssh"
    user        = "aipuser2"
    private_key = local.private_key
    agent       = false
  }


  #download package
  provisioner "remote-exec" {
    inline = ["cd /tmp",
      "az login --service-principal --username '${var.client_id}' --password '${var.client_secret}' --tenant '${var.tenant_id}'",
      "az account set --subscription '${var.subscription_id}'",
      "az account list --output table",
      "az storage blob download --account-name '${var.storage_account_name}' --container-name '${var.container_name}' --name '${var.vm2_packages[count.index]}' --file '${var.vm2_packages[count.index]}'"
    ]
  }
  depends_on = [null_resource.vmaz2]
}

resource "null_resource" "install_package2" {
  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection' "
    ]
  }
  connection {
    host        = azurerm_network_interface.vm2.private_ip_address
    type        = "ssh"
    user        = "aipuser2"
    private_key = local.private_key
    agent       = false
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm2.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/java.yml -u aipuser2"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm2.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/aspire-master-install.yml -u aipuser2"
  }

  depends_on = [null_resource.vm2]
}
###############################################################################
####################  node 3 ###################################
#############################################################################
resource "null_resource" "vmaz3" {
  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection' "
    ]
  }

  connection {
    host        = azurerm_network_interface.vm3.private_ip_address
    type        = "ssh"
    user        = "aipuser3"
    private_key = local.private_key
    agent       = false
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm3.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/azcli.yml -u aipuser3"
  }
  depends_on = [null_resource.install_package2]
}




resource "null_resource" "vm3" {
  count = length(var.vm3_packages)
  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection' "
    ]
  }
  connection {
    host        = azurerm_network_interface.vm3.private_ip_address
    type        = "ssh"
    user        = "aipuser3"
    private_key = local.private_key
    agent       = false
  }


  #download package
  provisioner "remote-exec" {
    inline = ["cd /tmp",
      "az login --service-principal --username '${var.client_id}' --password '${var.client_secret}' --tenant '${var.tenant_id}'",
      "az account set --subscription '${var.subscription_id}'",
      "az account list --output table",
      "az storage blob download --account-name '${var.storage_account_name}' --container-name '${var.container_name}' --name '${var.vm3_packages[count.index]}' --file '${var.vm3_packages[count.index]}'"
    ]
  }
  depends_on = [null_resource.vmaz3]
}

resource "null_resource" "install_package3" {
  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection' "
    ]
  }
  connection {
    host        = azurerm_network_interface.vm3.private_ip_address
    type        = "ssh"
    user        = "aipuser3"
    private_key = local.private_key
    agent       = false
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm3.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/java.yml -u aipuser3"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_network_interface.vm3.private_ip_address}, --private-key ${var.private_key} ${path.module}/ansible/aspire-worker-install.yml -u aipuser3"
  }

  depends_on = [null_resource.vm3]
}

variable "vm1_packages" {
  type    = list(string)
  default = ["jdk-11.0.12_linux-x64_bin.rpm", "apache-zookeeper-3.5.6-bin.tar.gz", "elasticsearch-7.2.1-x86_64.rpm", "Saga-1.2.1.5.zip"]
}

variable "vm2_packages" {
  type    = list(string)
  default = ["jdk-11.0.12_linux-x64_bin.rpm", "aspire-4.0-SNAPSHOT.tar.gz"]
}

variable "vm3_packages" {
  type    = list(string)
  default = ["jdk-11.0.12_linux-x64_bin.rpm", "aspire-4.0-SNAPSHOT.tar.gz"]
}
