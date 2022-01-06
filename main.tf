terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}
# Create a VPC
resource "aws_vpc" "project8-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "project8-VPC"
  }
}
# Create Web Public Subnet
resource "aws_subnet" "WebApp-Sub-1" {
  vpc_id                  = aws_vpc.project8-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "WebApp-Sub-2a"

  }
}
resource "aws_subnet" "WebApp-Sub-2" {
  vpc_id                  = aws_vpc.project8-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-Subnet-2b"
  }
}
# Create Application Private Subnet
resource "aws_subnet" "Application-Subnet-1" {
  vpc_id                  = aws_vpc.project8-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Application-2a"
  }
}
resource "aws_subnet" "Application-Subnet-2" {
  vpc_id                  = aws_vpc.project8-vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Application-2b"
  }
}
# Create Database Private Subnet
resource "aws_subnet" "DataBase-Subnet-1" {
  vpc_id            = aws_vpc.project8-vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "DB-2a"
  }
}
resource "aws_subnet" "DataBase-Subnet-2" {
  vpc_id            = aws_vpc.project8-vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "DB-2b"
  }
}