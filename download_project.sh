#! /bin/sh 

echo "Downloading from ${S3_DBT_PROJECT}"
aws s3 cp ${S3_DBT_PROJECT} /usr/app/dbt --recursive

echo "Running dbt commands ${DBT_ARGS}"
dbt ${DBT_ARGS} 