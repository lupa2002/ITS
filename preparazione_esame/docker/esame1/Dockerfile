FROM python:3.11 AS builder

COPY . /app

WORKDIR /app/doc-custom-app

RUN pip install mkdocs

RUN mkdocs build

FROM nginx:alpine

COPY --from=builder /app/doc-custom-app/site /usr/share/nginx/html

EXPOSE 80
