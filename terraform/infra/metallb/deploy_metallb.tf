resource "helm_release" "metallb" {
  name             = "metallb"
  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  namespace        = "metallb-system"
  create_namespace = true
  wait             = true

  set = [
    {
      name  = "speaker.tolerateMaster"
      value = "false"
    },
    {
      name  = "speaker.frr.enabled"
      value = "false"
    }
  ]
}
