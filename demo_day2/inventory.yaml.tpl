all:
  vars:
    ansible_user: root
    ansible_ssh_private_key_file: ../keys/aipc
    ansible_connection: ssh

  hosts:
    %{ for d in droplets }
    ${ d.name }:
      ansible_host: ${d.ipv4_address}
    %{ endfor }
