variable DO_token {
    type = string
    sensitive = true
}
variable DO_image {
    type = string
    default = "ubuntu-20-04-x64"
}
variable DO_region {
    type = string
    default = "sgp1"
}
variable DO_size {
    type = string
    default = "s-1vcpu-1gb"
}

data terraform_remote_state mysql8 {
    backend = "s3"
    config = {
        endpoint = "https://sgp1.digitaloceanspaces.com"
        key = "workshop03/terraform.tfstate"
        bucket = "aipc"
        region = "sgp1"
        skip_credentials_validation = true
        skip_metadata_api_check = true
        skip_region_validation = true
    }
}

output database_endpoint {
    value = data.terraform_remote_state.mysql8.outputs.mysql8_enpoint
}