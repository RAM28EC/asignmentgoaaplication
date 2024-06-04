
# configure backend
terraform {
  backend "s3" {
    bucket         = "botgauge-terraform"
    key            = "backend/aws-eks.terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock-dynamodb"
  }
}