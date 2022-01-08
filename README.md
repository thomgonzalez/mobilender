# Mobilender
En una empresa de productos electrónicos, se tiene la necesidad de implementar un sistema de pedidos recibidos desde los clientes de dicha empresa.
* El dashboard de esta aplicación esta construido con HTML, JS, CCS con framework AngularJs.

![alt picture](https://github.com/thomgonzalez/mobilender/blob/main/docs/images/Dashboard.png)

SO - Ubuntu
    La aplicación fue probada en Ubuntu 18.04
    
Paso 1: Install Docker on Ubuntu
    Docker le proporciona una manera estándar de ejecutar su código. Docker es un sistema operativo para contenedores.
    
Paso 2: Instalar Docker Compose
    Compose es una herramienta para definir y ejecutar aplicaciones Docker de contenedores múltiples.
    
Paso 3: Instalar make
    Make es una utilidad disponible en Linux que agiliza la tarea de compilar código desde la terminal.
    
    ```sudo apt-get install make
    ```

# Getting Started with Create App on Docker

Paso 1: Contruir los contenedores, imagenes y volumenes.
    
    ```
    make build
    ```
Paso 2: Ejecutar app en desarrollo corre en el puerto 80.
    
    ```
    make run
    make run_dev
    ```
Paso 3:  Correr migraciones en caso de faltar alguna migración que no se haya creado.
    
    ```
    make backend_migrations
    make backend_migrate
    ```

Paso 3:  Copiar archivos estaticos en el contenedor para ver el dashboard y administrador de Django.
    
    ```
    make run backend_static
    ```
   
# Archivos .env
    Crear archivos localmente o en el server de producción, son archivos de variables de entorno de desarrollo
    que contiene accesos al sistema o datos sencibles.

# API Rest Framework
    Los endpoints fueron probados en Postman.
