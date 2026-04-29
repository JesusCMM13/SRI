# Actividad 1 - Instalación de Docker

Como estoy partiendo de una instalación limpia, no tengo que desinstalar versiopnes antiguas, simplemente voy a actualizar el listado de paquetes con
```bash
sudo apt update && sudo apt upgrade
```
<img width="831" height="304" alt="image" src="https://github.com/user-attachments/assets/9f7c0cd3-5d58-428f-aca5-b72d2e7a787e" />

Después de eso, vamos a optar por instalar Docker usando el repositorio apt, y para ello primero tenemos que configurarlo con la clave GPG oficial.  
Instalamos curl para poder descargarnos a través de una URL:
```bash
sudo apt install ca-certificates curl
```
<img width="788" height="299" alt="image" src="https://github.com/user-attachments/assets/6fe30ebc-f217-439d-98f8-2b6eb9569e76" />

Ahora creamos la carpeta /etc/apt/keyrings, descargo el paquete de Docker ahí y le cambio los permisos:

```bash
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

<img width="816" height="197" alt="image" src="https://github.com/user-attachments/assets/6e69da08-0447-46c2-a7da-e64add57e094" />

(Falló la primera vez porque me faltaba una s en keyrings).

Añadimos el repositorio a apt:

```bash
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
```
<img width="802" height="340" alt="image" src="https://github.com/user-attachments/assets/9b103b5e-2218-41ef-b365-31973118ac0d" />

Y usamos sudo apt update para ver que se ha agregado al repositorio apt:

<img width="806" height="308" alt="image" src="https://github.com/user-attachments/assets/07590ef9-7c59-42eb-8c8d-2cdc3bc1d38e" />

Para finalizar, instalamos la última versión de docker con: 

```bash
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

<img width="820" height="530" alt="image" src="https://github.com/user-attachments/assets/9073642b-a172-41dc-a48f-928538657535" />

Verificamos que se ha instalado mirando la versión: 

```bash
sudo systemctl status docker
```

<img width="817" height="532" alt="image" src="https://github.com/user-attachments/assets/e2ba1861-0816-4a33-9c45-1c0ca466cbbd" />
