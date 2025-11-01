terraform {
  backend "s3" {
    bucket = "my-terraform-project-oct-2025"
    key    = "Staging/terraform.tfstate"
    region = "us-east-1"
  }
}
