resource "aws_launch_template" "smol_nix" {
  image_id = "ami-07f360673c2fccf8d"
  instance_type = "t4g.nano"
  key_name = aws_key_pair.hwtoken.key_name

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_type = "gp3"
      iops = 3000
      throughput = 125
      volume_size = 8
    }
  }

  update_default_version = true
}
