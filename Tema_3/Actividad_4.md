# Actividad 4 - Almacenamiento y redes Docker

## Despliegue de la aplicación Guestbook

Primero creamos la red interna de Docker:

<img width="619" height="76" alt="image" src="https://github.com/user-attachments/assets/6508e9b8-97e4-4bc9-85c9-c80cd2fc63fd" />

Ahora ejecutamos los dos contenedores de los dos servicios necesarios. Vemos que el flag -v nos da un volumen persistente:

<img width="1138" height="611" alt="image" src="https://github.com/user-attachments/assets/5a2eb99c-be7d-4a59-875b-b8b4fb139f58" />

Comprobamos que la aplicacion está funcionando con la IP del WSL: 

<img width="1092" height="288" alt="image" src="https://github.com/user-attachments/assets/70d4c5c1-5743-4f66-be85-b3d6278687ad" />

## Despliegue de la aplicación Temperaturas

Como antes, vamos a crear una red para conectar los dos contenedores:

<img width="624" height="82" alt="image" src="https://github.com/user-attachments/assets/dc3a3d1d-fb2c-4634-bf3e-e8d729ecce0c" />

Y nos descargamos el frontend y el backend de la aplicación:

<img width="1188" height="389" alt="image" src="https://github.com/user-attachments/assets/e15afb3e-5153-4f8b-a9c2-85afdf831624" />

Lo comprobamos:

<img width="1164" height="431" alt="image" src="https://github.com/user-attachments/assets/49fcce0e-a30d-4f67-a37a-9ec9c4e1b347" />

## Despliegue de Wordpress + mariadb

Creamos la red:

<img width="609" height="60" alt="image" src="https://github.com/user-attachments/assets/7b60e6d7-96b2-4d63-a763-5f76a4c9723c" />

Y creamos los contenedores de mariaDB y wordpress:

<img width="599" height="202" alt="image" src="https://github.com/user-attachments/assets/36653d94-21e5-4989-8498-0eec523a7210" />

<img width="745" height="766" alt="image" src="https://github.com/user-attachments/assets/c7877727-a456-4f94-94ed-0ee6f5fa37be" />

Lo comprobamos:

<img width="898" height="576" alt="image" src="https://github.com/user-attachments/assets/dc3dedfb-5b5e-44fa-9966-99c92ba2b30a" />





