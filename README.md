
## Requiere:
Docker
Docker-compose
master.key (Solicitar)

## Pasos para ejecutar el proyecto:
1) git clone https://github.com/estebans16/increase
2) Editar docker-compose.yml.
3) docker-compose build
4) docker-compose run increase rake db:create
5) docker-compose run increase rake db:migrate
6) docker-compose up

Esto va a levantar API en localhost en el puerto 5000.
