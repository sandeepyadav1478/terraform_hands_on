# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
region = "us-west-2"
alias = "primary_region"
}

resource "random_pet" "petname" {
length = 5
separator = "-"
}

resource "aws_s3_bucket" "sample_bucket_we_used_b" {

provider = aws.primary_region

bucket = random_pet.petname.id
tags = {
public_bucket = true
}
}

resource "aws_s3_bucket_ownership_controls" "sample_bucket_we_used_b" {
provider = aws.primary_region
bucket = aws_s3_bucket.sample_bucket_we_used_b.id
rule {
object_ownership = "BucketOwnerPreferred"
}
}