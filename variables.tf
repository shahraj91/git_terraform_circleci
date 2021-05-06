variable "project" {}

variable "credentials_file" {}

variable "region" {
  type = string
  default = "us-central-1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "machine_types" {
  type = map
  default = {
      dev = "f1-micro"
      test = "n1-highcpu-32"
      prod = "nq-highcpu-32"
  }
}