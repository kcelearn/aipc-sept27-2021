variable DO_token {
    type = string
    sensitive = true
}

// Lookup the ssh key
data digitalocean_ssh_key aipc-sept27 {
    name = "aipc-sept27"
}

// Define the resource - droplet
resource digitalocean_droplet myserver {
    // mandatory attributes
    name = "myserver"
    image = "ubuntu-21-04-x64"
    size = "s-1vcpu-2gb"
    region = "sgp1"

    // ssh key
    ssh_keys = [ data.digitalocean_ssh_key.aipc-sept27.id ]
}

output myserver_ip {
    value = digitalocean_droplet.myserver.ipv4_address
}