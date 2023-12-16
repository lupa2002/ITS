FROM node:latest as builder

WORKDIR /

#tramite npm, installo la cli di angular, creo un nuovo progetto, ci vado dentro e faccio una build
RUN npm install -g @angular/cli \
&& ng new hello_world \
&& cd hello_world \
&& ng build 

FROM nginx:alpine

#dopo aver fatto la build copio IL CONTENUTO della cartella in cui angular ha fatto la build nella cartella html di nginx (prima copiavo direttamente la cartella intera, quindi avevo "/usr/share/nginx/html/[nome_app]/[file della build]" come risultato finale, ma nginx (ovviamente) non trovava alcun index.html, se non il suo di default"
COPY --from=builder /hello_world/dist/hello_world/* /usr/share/nginx/html/

EXPOSE 80

ENTRYPOINT [ "nginx", "-g",  "daemon off;" ]

#to run this "docker build -t ng ." and "docker run -p [porta]:80 ng"
