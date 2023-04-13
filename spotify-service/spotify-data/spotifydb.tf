provider "aws" {
  region     = var.credentials.region
  access_key = var.credentials.access_key
  secret_key = var.credentials.secret_key
}

resource "aws_dynamodb_table" "spotifydb" {
  name           = "${var.prefix}-spotify"
  billing_mode   = "PROVISIONED"
  read_capacity = var.throughput.read_capacity
  write_capacity = var.throughput.write_capacity
  hash_key       = "Song"
  range_key      = "Artist"


  attribute {
    name = "Song"
    type = "S"
  }

  attribute {
    name = "Artist"
    type = "S"
  }

  ttl {
    attribute_name = "ttl"
    enabled        = false
  }

  tags = {
    Name        = "${var.prefix}-spotify-table"
  }
}
