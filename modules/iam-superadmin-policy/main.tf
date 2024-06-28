resource "aws_iam_policy" "superadmin" {
  name        = "AWSFullAccess"
  description = "Allows the user to manage all resources on this AWS account"
  policy = data.aws_iam_policy_document.superadmin.json
}
