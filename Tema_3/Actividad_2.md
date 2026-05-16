# Actividad 2 - Docker

La imgen de Hello-world:

<img width="980" height="616" alt="image" src="https://github.com/user-attachments/assets/507943a4-b348-488d-9d9b-2a646d4fa8ab" />

Vemos que al terminar de ejecutarse el proceso, se paran: 

<img width="1059" height="110" alt="image" src="https://github.com/user-attachments/assets/1df60596-a058-4da3-b6cb-b856b31267b4" />

Podemos eliminar el contenedor con su nombre o id: 

<img width="1009" height="129" alt="image" src="https://github.com/user-attachments/assets/b89523e5-f2da-4bac-97c7-dba32acc5a7f" />

Con `docker run` ejecutamos contenedores, y con `docker images` vemos las imágenes que tenemos descargadas:

<img width="1111" height="99" alt="image" src="https://github.com/user-attachments/assets/27583e42-5df7-4611-97e1-cc0acc32a616" />

## Ejecutando un contenedor interactivo

Usamos -it para que sea interactiva y nos abra una terminal:

<img width="756" height="187" alt="image" src="https://github.com/user-attachments/assets/6acafd3c-5a10-4776-adf6-3f838986111c" />

Si salimos se para pero nos podemos volver a conectar:

<img width="426" height="84" alt="image" src="https://github.com/user-attachments/assets/b13d1406-d7f6-49df-9c47-66fe12363dbc" />

Con exec ejecutamos comandos dentro del contenedor:

<img width="1105" height="534" alt="image" src="https://github.com/user-attachments/assets/a7584e01-95e8-4462-b9a9-e2699888c975" />

Y con inspect nos da su información:

<img width="1742" height="499" alt="image" src="https://github.com/user-attachments/assets/97be3ed7-f9e1-4ad1-a93a-0db39d0c7708" />

## Creando un contenedor demonio

La opción -d del comando `run` hace que la ejecución del comando en el contenedor se haga en segundo plano, y `bash -c` nos permite ejecutar uno o mas comandos en el contenedor de forma más compleja.

<img width="1069" height="266" alt="image" src="https://github.com/user-attachments/assets/45262afa-53ba-4572-9a42-4b6c2053854e" />

Vemos que se está ejecutando en segundo plano y lo que está haciendo. Por último lo borramos a la fuerza:

<img width="819" height="129" alt="image" src="https://github.com/user-attachments/assets/9ccffc91-42ad-4310-9a6f-2392047b134b" />

## Creando un contenedor con un servidor web

Lo hacemos con la imagen de apache en dockerhub:

<img width="947" height="224" alt="image" src="https://github.com/user-attachments/assets/ffb426de-2201-4deb-8aca-d5f074fbdb42" />

Lo comprobamos accediendo a la IP del servidor con docker:

<img width="839" height="228" alt="image" src="https://github.com/user-attachments/assets/851ed9b4-118a-400d-a3c9-5da0a09f8835" />

Para modificarlo accedemos al contenedor con exec y creamos un index.html:

<img width="811" height="162" alt="image" src="https://github.com/user-attachments/assets/dc0c59b8-690b-4c00-8bba-a28e34a02c8a" />

## Configuración de contenedores con variables de entorno

Se hace con el flag -e o --env. Vamos a probarlo con MariaDB:

<img width="1324" height="430" alt="image" src="https://github.com/user-attachments/assets/f8ce91f2-f8cf-4313-a514-468f32d0a8b9" />

<img width="612" height="200" alt="image" src="https://github.com/user-attachments/assets/a8439b0b-148d-4a78-be7f-30da756e5f76" />

