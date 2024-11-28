resource "google_compute_router" "interconnect-router-ew3" {
  name    = "interconnect-router-ew3"
  project = module.landing-project.project_id
  network = module.landing-vpc.self_link
  region  = "europe-west3"
  bgp {
    asn               = 16550
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
    advertised_ip_ranges {
      range = "10.255.255.0/24"
    }
    advertised_ip_ranges {
      range = "192.168.255.0/24"
    }
  }
}

resource "google_compute_router" "interconnect-router-ew6" {
  name    = "interconnect-router-ew6"
  project = module.landing-project.project_id
  network = module.landing-vpc.self_link
  region  = "europe-west6"
  bgp {
    asn               = 16550
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
    advertised_ip_ranges {
      range = "10.255.255.0/24"
    }
    advertised_ip_ranges {
      range = "192.168.255.0/24"
    }
  }
}

module "example-va-a-ew3" {
  source      = "../../../modules/net-vlan-attachment"
  project_id  = module.landing-project.project_id
  network     = module.landing-vpc.self_link
  region      = "europe-west3"
  name        = "vlan-attachment-a-ew3"
  description = "interconnect-a-ew3 vlan attachment 0"
  peer_asn    = "65000"
  router_config = {
    create = false
    name   = google_compute_router.interconnect-router-ew3.name
  }
  partner_interconnect_config = {
    edge_availability_domain = "AVAILABILITY_DOMAIN_1"
  }
}

module "example-va-b-ew3" {
  source      = "../../../modules/net-vlan-attachment"
  project_id  = module.landing-project.project_id
  network     = module.landing-vpc.self_link
  region      = "europe-west3"
  name        = "vlan-attachment-b-ew3"
  description = "interconnect-b-ew8 vlan attachment 1"
  peer_asn    = "65000"
  router_config = {
    create = false
    name   = google_compute_router.interconnect-router-ew3.name
  }
  partner_interconnect_config = {
    edge_availability_domain = "AVAILABILITY_DOMAIN_2"
  }
}

module "example-va-a-ew6" {
  source      = "../../../modules/net-vlan-attachment"
  project_id  = module.landing-project.project_id
  network     = module.landing-vpc.self_link
  region      = "europe-west6"
  name        = "vlan-attachment-a-ew6"
  description = "interconnect-a-ew12 vlan attachment 0"
  peer_asn    = "65000"
  router_config = {
    create = false
    name   = google_compute_router.interconnect-router-ew6.name
  }
  partner_interconnect_config = {
    edge_availability_domain = "AVAILABILITY_DOMAIN_1"
  }
}

module "example-va-b-ew6" {
  source      = "../../../modules/net-vlan-attachment"
  project_id  = module.landing-project.project_id
  network     = module.landing-vpc.self_link
  region      = "europe-west6"
  name        = "vlan-attachment-b-ew6"
  description = "interconnect-b-ew12 vlan attachment 1"
  peer_asn    = "65000"
  router_config = {
    create = false
    name   = google_compute_router.interconnect-router-ew6.name
  }
  partner_interconnect_config = {
    edge_availability_domain = "AVAILABILITY_DOMAIN_2"
  }
}
