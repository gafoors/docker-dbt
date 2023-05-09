FROM ghcr.io/dbt-labs/dbt-postgres:latest	
USER root
RUN apt update && \
    apt install -y curl unzip

WORKDIR /tmp
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \ 
    ./aws/install

ENV S3_DBT_PROJECT=s3://replace-me/dbt-project-folder
ENV DBT_ARGS="list"
WORKDIR /usr/app/dbt
COPY --chmod=755 download_project.sh .

ENTRYPOINT [ "/usr/app/dbt/download_project.sh" ]