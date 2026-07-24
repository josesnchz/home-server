resource "kubernetes_manifest" "metallb_ip_pool" {
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind       = "IPAddressPool"
    metadata = {
      name      = "lb-ippool"
      namespace = "metallb-system"
    }
    spec = {
      addresses = var.metallb_address_pool
    }
  }
}

resource "kubernetes_manifest" "metallb_l2_advertisement" {
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind       = "L2Advertisement"
    metadata = {
      name      = "lb-advertisement"
      namespace = "metallb-system"
    }
  }

  depends_on = [kubernetes_manifest.metallb_ip_pool]
}
