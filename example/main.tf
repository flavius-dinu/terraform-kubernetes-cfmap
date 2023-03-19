# main code

provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "config_maps" {
  source = "../"
  namespaces = {
    ns1 = {
      labels = {
        color = "green"
      }
    }
  }

  config_maps = {
    cf1 = {
      namespace = "ns1"
      data = {
        api_host = "myhost:443"
        db_host  = "dbhost:5432"
      }
    }
  }
}
