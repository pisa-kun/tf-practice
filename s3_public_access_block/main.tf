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

## デフォルトで今はパブリックアクセスブロックはすべて無効化されている
resource "aws_s3_bucket" "raw-sample" {
  bucket = "sample-bucket-raw-access-sumisumi" // s3バケット名をユニークにするために自分の名前など入れる
}

## 明示的に無効化する場合
resource "aws_s3_bucket" "block-sample" {
  bucket = "sample-bucket-block-access-sumisumi" // s3バケット名をユニークにするために自分の名前など入れる
}

# バケットポリシーの内容を定義
# see: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document
data "aws_iam_policy_document" "main" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject",
    ]
    resources = [
      aws_s3_bucket.block-sample.arn,
      "${aws_s3_bucket.block-sample.arn}/*",
    ]
  }
}

# バケットポリシーをバケットに紐づける
# see: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy
resource "aws_s3_bucket_policy" "main" {
  bucket = aws_s3_bucket.block-sample.id
  policy = data.aws_iam_policy_document.main.json

  // 依存順番を指定
  depends_on = [ aws_s3_bucket_public_access_block.main,]
}

## falseの場合はアクセスできてしまう
resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = aws_s3_bucket.block-sample.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}