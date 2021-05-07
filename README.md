# README

## Descripción general.
Ecolabora busca ser un lugar donde se produzca la revalorización de objetos que de otra manera terminarían en rellenos sanitarios. 
Ecolabora se define como el tinder de la economía circular. Un lugar donde los usuarios puedan subir sus productos y regalarlos a usuarios cerca de su ubicación.

El modelo de base de datos utilizado puede encontrarse aquí [Aquí](https://dbdiagram.io/d/606b10ccecb54e10c33eba79) 

## Versiones.

* Ruby 2.6.6 x86_64-darwin20
* Rails 6.0.3.6

## Gestión del proyecto

Se utiliza trello para gestionar el desarrollo del proyecto. Las historias de usuario y el avance en el desarrollo se pueden observar en [Panel Ecolabora](https://trello.com/b/tGVNQ2K0/ecolabora)

## Deployment

Para el despliegue de la aplicación solo debes acceder al repositorio y descargar la carpeta del proyecto. Luego en el terminal
```
  bundle
  heroku create
  heroku run rails db:migrate
  heroku run yarn add
  heroku run rails db:seed
```

El usuario administrador admin1@mail.cl y clave 123456, puede servir como punto de partida para gestionar el panel de administración. Se recomienda editar y eliminar este acceso, una vez desplegada la aplicación. 




