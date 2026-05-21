# Contenedores con sistemas Gestores de Base de Datos 
[ImagenDocker](./img/fb43fdf7-5f3b-413d-ae30-0d9f0fd99f72%20(1).png)
## Comandos Docker con descripcion
| Columna 1 | Columna 2 |
| :--- | :--- |
| **Docker --version** | Verifica la version del docker_ |
| **Docker pull Nombre_imagen** | _Descarga una imagen en Dockerhub_[DockerHub] (https://hub.docker.com)|
| **Docker imagen**| _Visualiza las imagenes_ |
| **Docker run**| _Crea un contenedor_ |
| **Docker ps**| _Visualisa todos los contenedor en ejecucion_|
| **Docker rconteiner ls**| _Visualisa todos los contenedor en ejecucion_ |
| **Docker ps -a**| _Visualisa todos los contenedor en ejecucion_|
| **Docker conteiner ls -a**| _Visualisa todos los contenedor en ejecucion_|
| **Docker stop "name" o "ID"**| _Detiene un contenedor_|
| **Docker start "name" o "ID"**| _Inicia un contenedor_|
| **Docker rm "name"**| _Elimina un contenedor que esta en ejecucion_|
| **Docker volum ls**| _lista de los volumenes que tiene docker_|
| **Docker volume create "Name""**| _Crea un volumen_|
| **Docker volume rm "Name""**| _Eliminaclear
 un volumen_|
## comandos de contenedores de SGBD

```
docker pull docker/gettin-started
```

### Contenedor de tutrorial de docker
```
docker run -d --name tutorial-docker -p 80:80 docker pull docker/gettin-started
o
docker run -d --name tutorial-docker -p 80:80 d //<-- esta es la ide d933
``` 
### Contenedor de MariaDB sin volumen 

```
docker run -d --name server-MariaDBG3 -p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345 12e0c
```
### Contenedor de MariaDB con volumen 

```
docker run -d --name server-MariaDBG3 \
-p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345 \
-v vol-mariadbg3: /var/lib/mysql 12e0c
```
### Contenedor de MariaDB con volumen 
```
docker run -d --name server-posgresg3 \
-e pPOSGRES_PASSWORD=123456 \
-p 5456:5432 -v vol_posgresg3:/var/lib/posgressql/data \
sha256

```