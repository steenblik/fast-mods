// Beginning of FAST vars
// Service account = fast-avm1@gcp-ent-s-tfstate-rochepoc.iam.gserviceaccount.com

# Comment out lines 79-83 in outputs.tf
automation = { outputs_bucket = "" }

billing_account = {
  id = "01B0EA-C984E3-4C8A7C"
}

# Shall we remove net-dev.tf & dns-dev.tf??
environments = {
  prod = {
    name       = "prod"
    tag_name   = "prod"
    is_default = true
  }
}

# What happens if networking-dev and networking-prod are not present?
folder_ids = {
  networking = "folders/2936337292"
}

# A random hex string so we can simply destroy
prefix = "5404d"

// End of FAST vars

// Beginning of Network vars

# Can be left empty for now
dns = {}

enable_cloud_nat = false

regions = {
  primary   = "europe-west3"
  secondary = "europe-west6"
}

# What is the proper definition?
spoke_configs = { ncc_configs = {
  export_psc = true
  }
}
