provider "aws" {
  region = var.region
  default_tags {
    tags = local.common_tags
  }
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
  default_tags {
    tags = local.common_tags
  }
}

provider "aws" {
  alias  = "ca-central-1"
  region = "ca-central-1"
  default_tags {
    tags = local.common_tags
  }
}