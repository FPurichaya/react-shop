#!/bin/sh

# Print trace
set -x -o errexit

#After setting up the bucket and DynamoDb make sure that the same variables are used in main.tf
REGION=${AWS_DEFAULT_REGION}
BUCKET_NAME=${PROJECT_NAME}-infrastructure
LOCKS_TABLE=${PROJECT_NAME}-tf-locks

f_backend() {
    aws dynamodb create-table \
        --region $REGION \
        --table-name ${LOCKS_TABLE} \
        --attribute-definitions AttributeName=LockID,AttributeType=S \
        --key-schema AttributeName=LockID,KeyType=HASH \
        --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1

    aws s3api create-bucket \
        --region $REGION \
        --create-bucket-configuration LocationConstraint=$REGION \
        --bucket ${BUCKET_NAME}

    aws s3api put-bucket-versioning \
        --region $REGION \
        --bucket ${BUCKET_NAME} \
        --versioning-configuration Status=Enabled
}

if aws s3 ls | grep "${PROJECT_NAME}-infrastructure"; then
    echo "State bucket already exists"
else
    echo "Creating state Bucket and DynamoDB"
    f_backend
fi
