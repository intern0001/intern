resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress-controller"
  version    = "9.7.8"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

}