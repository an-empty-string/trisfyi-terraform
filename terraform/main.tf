terraform {
  backend "s3" {
    bucket = "tris-tf-state"
    key = "tf-state"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "hwtoken" {
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCXEShUcOG0aNtI8+ZydcGJY7VPS6P35BohbM68cHyvvwK7+PKlPcloTfidHOaTTveD/5vMB9jKAuuY6uKAWJM5a6CNdS77+9ugeaCFDLc7I82eY+STXX8UehUi78LB0s3qOULvYpGvZIwG7Oz8L2O58ZJkeUgv+3r675m7ejaNOK15OeHL51xkZ/fn6C5T6EqkHxwjgWYUZTqRCLGb4nynnjcnMIzh0croSatEr8vmKa6eGwfbaEnLMJ4E7QY+JYD/H4X0QjmDqFUhTxeZ2gyvR5GOTVVuMe1047LcU/qv65zNDc96raPAGeNeC1h2c3e4rgUtl8KNuDo99aovItreJv6CuLBAgC5ZAsgwDl6qH03ahhVAyr7kdR0/4lTXYyOFnkKgnXcLu3GQtfb71rhTef+RbDKyMTcw2gOaTcn44hDJGGOWKce+a91CTIRlBEYj5/baiwesg5XP5loKjAqnP1smXnLLHvJBZawHU6qaS86PxxH1E26xGcYW1mdliS1O7U6odfkvPWZNumPFLP+nDUElsUTySrE0w0AOWLGRD8guGdhUh34RpTjcbnVSzfILciKIrEnYIThHJz1/AosUoVw3vPsO5/HFdz6VDHjZEoRzqG6RWLBa6lMtUE218c0HNMK8nuwPCciXOibnGzKYIKxIUCQs9sPtYpaJQMFZtQ== cardno:000609604905"
}

module "network" {
  source = "./modules/network"
}
