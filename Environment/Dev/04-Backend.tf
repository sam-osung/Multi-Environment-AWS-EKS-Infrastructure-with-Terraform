terraform {
  backend "s3" {
    bucket = "my-terraform-project-oct-2025"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
