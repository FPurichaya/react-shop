resource "aws_ecr_repository" "ecr-backend-repo" {
  name                 = "${var.project}-${var.environment}-backend-repo-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  encryption_configuration {

  }
}


resource "aws_ecr_repository" "ecr-frontend-repo" {
  name                 = "${var.project}-${var.environment}-frontend-repo-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  encryption_configuration {

  }
}