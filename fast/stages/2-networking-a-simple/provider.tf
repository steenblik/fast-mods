terraform {
  backend "gcs" {
    bucket                      = "${bucket}"
    impersonate_service_account = "fast-avm1@gcp-ent-s-tfstate-rochepoc.iam.gserviceaccount.com"
  }
}
provider "google" {
  impersonate_service_account = "fast-avm1@gcp-ent-s-tfstate-rochepoc.iam.gserviceaccount.com"
}
provider "google-beta" {
  impersonate_service_account = "fast-avm1@gcp-ent-s-tfstate-rochepoc.iam.gserviceaccount.com"
}