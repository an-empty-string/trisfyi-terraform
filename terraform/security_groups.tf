resource "aws_security_group" "allow_defaults" {
  name = "allow_defaults"
  description = "Allow inbound SSH and outbound Internet access"
  vpc_id = module.network.vpc_id

  ingress {
    description = "Inbound SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }

  egress {
    description = "Outbound"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }
}

resource "aws_security_group" "allow_pubsite" {
  name = "allow_pubsite"
  description = "Allow inbound HTTP, HTTPS, and Gemini access"
  vpc_id = module.network.vpc_id

  ingress {
    description = "Inbound Gemini"
    from_port = 1965
    to_port = 1965
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }

  ingress {
    description = "Inbound HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }

  ingress {
    description = "Inbound HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }
}
