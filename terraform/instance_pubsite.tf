data "local_file" "pubsite_config" {
  filename = "data/pubsite.configuration.nix"
}

resource "aws_network_interface" "pubsite" {
  subnet_id = module.network.subnet_id
  security_groups = [
    aws_security_group.allow_defaults.id,
    aws_security_group.allow_pubsite.id
  ]
}

resource "aws_instance" "pubsite" {
  launch_template {
    id = aws_launch_template.smol_nix.id
  }

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.pubsite.id
  }

  user_data = chomp(<<-EOF
    #!/bin/sh
    env

    dd if=/dev/zero of=/swap bs=1M count=512
    chmod 0600 /swap

    /run/current-system/sw/bin/mkswap /swap
    /run/current-system/sw/bin/swapon /swap

    echo ${base64encode(chomp(data.local_file.pubsite_config.content))} | base64 -d > /etc/nixos/configuration.nix
    nixos-rebuild switch
    EOF
  )
}

resource "aws_route53_record" "pubsite" {
  zone_id = var.route53_zone_id
  name = "gemini.tris.fyi"
  type = "A"
  ttl = "60"
  records = [ aws_instance.pubsite.public_ip ]
}
