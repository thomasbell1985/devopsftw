terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">=0.14.9"
}

provider "aws" {
  profile = var.profile
  region  = var.region
}

resource "aws_iam_group" "devops_team" {
  name = "devops_team"
}

resource "aws_iam_user" "bob" {
  name = "bob"
}

data "aws_caller_identity" "source" {
  provider = aws
}
resource "aws_iam_group_membership" "devops_team_members" {
  name = "devops_team_members"
  users = [
    aws_iam_user.bob.name,
  ]
  group = aws_iam_group.devops_team.name
}

resource "aws_iam_policy" "prod_devops_assume_policy" {
  name        = "devops_assume_policy"
  description = "policy allowing assumption of the assumable role"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Action" : "sts:AssumeRole",
      "Resource" : "arn:aws:iam::${data.aws_caller_identity.source.account_id}:role/${aws_iam_role.prod_devops_role.name}"
    }]
  })

}

resource "aws_iam_group_policy_attachment" "attachment" {
  group      = aws_iam_group.devops_team.id
  policy_arn = aws_iam_policy.prod_devops_assume_policy.arn
}

data "aws_iam_policy_document" "prod_devops_assumable_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.source.account_id}:root"]
    }
  }
}

resource "aws_iam_role" "prod_devops_role" {
  name               = "devops_role"
  assume_role_policy = data.aws_iam_policy_document.prod_devops_assumable_role_policy.json
}







