FROM python:3.11 AS builder
RUN pip install mkdocs
WORKDIR /app
COPY mkdocs.yml .
COPY /docs/ /docs/
RUN mkdocs build

FROM nginx:alpine
COPY --from=builder /app/site/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]