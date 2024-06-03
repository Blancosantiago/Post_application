# Proyecto Flutter: Listado de Posts

## Descripción del Proyecto

Este proyecto es una aplicación desarrollada en Flutter que muestra un listado de publicaciones (posts). Al seleccionar una publicación, se abre una pantalla de detalles que muestra los comentarios asociados a esa publicación.

### Características Principales
- Gestión de Estado con Cubit: Se utiliza Cubit para manejar los estados de la aplicación de manera eficiente.
- Arquitectura Limpia (Clean Architecture): Implementación de principios de Clean Architecture para mantener un código limpio y mantenible.
- Inyección de Dependencias: Utilización de patrones de inyección de dependencias para facilitar la gestión de dependencias y mejorar la testabilidad.
- Manejo de Errores: Implementación de manejo de errores, como la desconexión de internet, para mejorar la experiencia del usuario.
- Intercambio de Información: Uso de channels para la comunicación entre la parte nativa y Flutter

### Dependencias del Proyecto
Las siguientes bibliotecas y paquetes se utilizaron en el desarrollo de este proyecto:

- bloc
- dio
- equatable
- flutter_bloc
- get_it
- go_router
- google_fonts
- internet_connection_checker
- intl

## Setup proyecto
Para iniciar el proyecto, modifica el archivo launch en la carpeta .vscode. Si usas otro IDE, define la variable APPENVURL con la URL del backend usando Ejemplo --dart-define=APPENVURL=https:asdfgh.com
