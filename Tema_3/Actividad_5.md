# Actividad 5 - Docker-compose

## Despliegue de la aplicación guestbook mediante Docker-compose

Creamos la receta:

<img width="1372" height="211" alt="image" src="https://github.com/user-attachments/assets/2a002d32-47ad-4e6f-9ef5-2c58e9f7a9b0" />

Vemos los contenedores:

<img width="1318" height="113" alt="image" src="https://github.com/user-attachments/assets/31572cd3-1702-4727-a59d-d938e012cbe4" />

Eliminamos la aplicación multicontenedor y los volúmenes con docker compose down -v:

<img width="381" height="146" alt="image" src="https://github.com/user-attachments/assets/deb90b8e-cfa1-486c-a3b6-d62b7081dee0" />

## Despliegue de la aplicación Temperaturas mediante Docker-compose

Borramos el compose anterior y hacemos el nuevo:

<img width="614" height="180" alt="image" src="https://github.com/user-attachments/assets/2fa650e8-109e-4eaf-abc8-850da282330d" />

Comprobamos su creación y eliminamos:

<img width="1515" height="188" alt="image" src="https://github.com/user-attachments/assets/22355d42-3032-442d-a4bc-df4fb6dd2fc9" />

## Despliegue de WordPress + Mariadb mediante Docker-compose:

En este caso no voy a borrar el compose anterior, voy a crear uno nuevo y a llamarlo con la flag -f:

<img width="653" height="153" alt="image" src="https://github.com/user-attachments/assets/796ee6dd-7835-4abd-9289-bdabfb4677dd" />

Se puede tener y construir más de un archivo a la vez llamandolos por su nombre de esta forma. Este compose tiene los volúmenes declarados.

<img width="1342" height="104" alt="image" src="https://github.com/user-attachments/assets/cc7f2630-47e0-4e93-bc57-6a3c8f0d31a7" />

