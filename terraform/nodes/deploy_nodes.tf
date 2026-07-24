terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_tls_insecure     = var.proxmox_tls_insecure
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
}

resource "proxmox_vm_qemu" "k8s_master" {
  name        = "k8s-master"
  vmid        = 100
  target_node = "endurance"
  clone       = "template-debian13-cloud-init"
  full_clone  = true

  tags = "kubernetes,master,terraform"

  # Hardware Resources
  cpu {
    cores   = 3
    sockets = 1
  }

  memory = 6144
  agent  = 1 # Proxmox config

  # Disk Config
  disks {
    # Principal
    virtio {
      virtio0 {
        disk {
          storage = "habitat"
          size    = "50G"
        }
      }
    }
    # Cloud-Init
    ide {
      ide2 {
        cloudinit {
          storage = "habitat"
        }
      }
    }
  }
  bootdisk = "virtio0"
  boot     = "order=virtio0;ide2"

  # Network Config
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
  ipconfig0 = "ip=192.168.0.60/24,gw=192.168.0.1"

  # Cloud-init
  os_type = "cloud-init"
  ciuser  = var.cloud_init_user
  sshkeys = var.ssh_public_key

}

resource "proxmox_vm_qemu" "k8s_node" {
  count       = 3
  name        = "k8s-worker-${count.index}"
  vmid        = 101 + count.index
  target_node = "endurance"
  clone       = "template-debian13-cloud-init"
  full_clone  = true

  tags = "kubernetes,worker,terraform"

  # Hardware Resources
  cpu {
    cores   = 2
    sockets = 1
  }

  memory = 4096
  agent  = 1 # Proxmox config

  # Disk Config
  disks {
    # Principal
    virtio {
      virtio0 {
        disk {
          storage = "habitat"
          size    = "50G"
        }
      }
    }
    # Cloud-Init
    ide {
      ide2 {
        cloudinit {
          storage = "habitat"
        }
      }
    }
  }
  bootdisk = "virtio0"
  boot     = "order=virtio0;ide2"

  # Network Config
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
  ipconfig0 = "ip=192.168.0.6${count.index + 1}/24,gw=192.168.0.1"

  # Cloud-init
  os_type = "cloud-init"
  ciuser  = var.cloud_init_user
  sshkeys = var.ssh_public_key

}
