terraform {
  backend "s3" {
    bucket         = "tf-bootstrap-aws-state-ee721b76"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    use_lockfile   = true
    encrypt        = true
  }
}
