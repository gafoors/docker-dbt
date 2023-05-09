1. Buid docker image
`podman build -t localhost/dbt-postgres .`
2. Run docker image  
    a) Pass the env var reference (assumes `export S3_DBT_PROJECT=s3://shameem-demobucket/dbt-project/jaffle_shop/`)  
    b) Mount the AWS credentials file to be picked up by the root user processes  
`podman run -it -e S3_DBT_PROJECT -v /Users/gafoors/.aws/credentials:/root/.aws/credentials localhost/dbt-postgres`  
OR   
`podman run -it -e S3_DBT_PROJECT=s3://shameem-demobucket/dbt-project/jaffle_shop/ -v /Users/gafoors/.aws/credentials:/root/.aws/credentials localhost/dbt-postgres`  

[Note that podman is equivalent to docker]