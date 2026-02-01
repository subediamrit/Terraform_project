terraform {
  backend "s3" {
    bucket         = "amrit-subedi-bucket-2060"
    key            = "my-app.tfstate"
    region         = "ap-south-2"
    dynamodb_table = "locktable"
    encrypt        = true
  }
}