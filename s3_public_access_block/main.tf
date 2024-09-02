terraform {
  // terraformのバージョンを指定
  required_version = ">= 1.5.1"

  // awsプロバイダーのバージョンを指定
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

// awsプロバイダーの設定
provider "aws" {
  // regionを指定
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "raw-sample" {
  bucket = "sample-bucket-raw-access-sumisumi" // s3バケット名をユニークにするために自分の名前など入れる
}

resource "aws_s3_bucket" "block-sample" {
  bucket = "sample-bucket-block-access-sumisumi" // s3バケット名をユニークにするために自分の名前など入れる
}