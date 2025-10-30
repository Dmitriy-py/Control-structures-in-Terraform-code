locals {
  ssh_public_key_content = file("~/.ssh/id_rsa.pub")

  ubuntu_image_id =  data.yandex_compute_image.ubuntu_latest.image_id

  vm_metadata = {
    user-data = templatefile("${path.module}/start-vm.tpl", {
      username = var.ssh_user
      ssh_key  = local.ssh_public_key_content
    })
  }
}
