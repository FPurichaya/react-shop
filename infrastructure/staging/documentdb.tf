resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "${var.project}-my-docdb-cluster"
  engine                  = "docdb"
  master_username         = var.docdb_master_user
  master_password         = var.docdb_master_password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_docdb_subnet_group.docdb_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.documentdb.id]
}

resource "aws_docdb_subnet_group" "docdb_subnet_group" {
  name       = "main"
  subnet_ids = data.terraform_remote_state.network_remote_state.outputs.aws_vpc_private_subnets

  tags = {
    Name = "My docdb subnet group"
  }
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "docdb-cluster-demo-${count.index}"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = "db.t3.medium"
}


