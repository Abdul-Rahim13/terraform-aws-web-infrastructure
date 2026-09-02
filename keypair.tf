resource "aws_key_pair" "terraform_web_server" {
  key_name   = "terraform-web-server"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICkxERKd7LGvhDJPbS9ebYLHs0zTAiWXGovvpIH1MPDn abdul@CodeTitan"
}