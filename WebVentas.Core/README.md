# WebVentas.Core - PoC Clean Architecture

Este directorio contiene la Prueba de Concepto (PoC) inicial del nuevo backend de WebVentas, construido utilizando **.NET 8+** y **Clean Architecture**.

## 🏗️ Estructura de Proyectos

La solución `WebVentas.Core.sln` se compone de cuatro proyectos interconectados estratégicamente para desacoplar responsabilidades:

1. **`WebVentas.Core.Domain` (Capa de Dominio):**
   - No tiene dependencias de ningún otro proyecto.
   - Contiene Entidades de Negocio (Entities), Enums, Excepciones del dominio e Interfaces (ej. repositorios y abstracciones core).

2. **`WebVentas.Core.Application` (Capa de Aplicación):**
   - Depende de `Domain`.
   - Contiene Lógica de Negocio, Casos de Uso, Interactors, DTOs, validaciones y *Ports* (contratos de interfaces a inyectar).
   - Aquí residirá la lógica estricta sin preocuparse por Bases de Datos o Endpoints Web.

3. **`WebVentas.Core.Infrastructure` (Capa de Infraestructura):**
   - Depende de `Application` (para cumplir sus contratos/Ports).
   - Es el *Adapter* hacia el exterior. Contiene DbContexts de Entity Framework Core, repositorios concretos locales o integraciones (WCF para SAP).

4. **`WebVentas.Core.API` (Capa de Presentación):**
   - Depende de `Application` e `Infrastructure`.
   - Únicamente responsable de exponer la API REST, inyección de dependencias (`Program.cs`) y configuración de Auth/Middlewares HTTP. No tiene reglas de negocio.

## 🚀 Cómo Iniciar

Puedes abrir la solución `WebVentas.Core.sln` en **Visual Studio 2022**, o desde terminal siguiendo estos pasos:

### 1. Configuración Previa

Verifica los archivos `appsettings.json` o `appsettings.Development.json` en el proyecto `WebVentas.Core.API` para asegurarte de tener la cadena de conexión correcta a tu entorno de base de datos. 
La aplicación utiliza la llave `"WebVentas.Core"` dentro de `ConnectionStrings`, la cual por defecto se encuentra configurada para apuntar al servidor `54.39.107.69,11432` (base de datos `ventas_v2`).

### 2. Restaurar dependencias y compilar

Abre una terminal y navega a la raíz de la solución (`WebVentas.Core`), luego ejecuta:

```bash
dotnet restore
dotnet build
```

### 3. Aplicar Migraciones de Base de Datos (Entity Framework)

Las *Migraciones* son código que aplica cambios desde nuestra aplicación hacia las tablas de la base de datos de manera automática.

Para aplicar cualquier cambio pendiente a la base de datos (requerido al empezar):
1. Abre tu terminal en la carpeta principal `WebVentas.Core`.
2. Asegúrate de tener la herramienta de EF Core instalada ejecutando:
   ```bash
   dotnet tool install --global dotnet-ef
   ```
3. Ahora, aplica la estructura de datos:
   ```bash
   dotnet ef database update --project WebVentas.Core.Infrastructure --startup-project WebVentas.Core.API
   ```

### 4. Ejecutar la Aplicación para Pruebas Locales (Paso a Paso)

Es hora de verificar que todo funciona desde tu propia computadora.

1. **Abre PowerShell**:
   Pulsa la tecla Windows de tu teclado, escribe `PowerShell` y presiona *Enter*.
   
2. **Navega a la carpeta de tu código**:
   En la pantalla azul que se abre, escribe el comando para entrar a la ruta de la API y presiona *Enter*. Si tu proyecto está en el disco D, sería:
   ```powershell
   cd d:\@Edgar\Fuentes\WebVentas\WebVentas.Core\WebVentas.Core.API
   ```

3. **Inicia el servidor**:
   Escribe el siguiente comando y dale *Enter*:
   ```powershell
   dotnet run
   ```
   *Verás varias letras blancas y amarillas. Solo busca la frase amarilla que dice **"Now listening on: http://localhost:5000"** (el número al final puede variar a 5001 o similar).*

### 5. ¿Cómo probar la API a nivel de usuario? (Interfaz Swagger)

La aplicación trae integrada **Swagger**, una página web muy amigable y visual para interactuar con las rutas como si tuviéramos un panel de control, sin escribir código.

1. Abre tu navegador web favorito (Chrome, Edge, Firefox).
2. En la parte de arriba donde pones las direcciones web (Ej: google.com), escribe el enlace que te dio PowerShell seguido de `/swagger` y presiona *Enter*.
   **Ejemplo:** `http://localhost:5000/swagger`
3. Verás una pantalla blanca con verde con el título **"WebVentas.Core.API"** y una lista de "Controladores" (que son las funciones disponibles).
4. **¡Haz tu primera prueba!**:
   - Haz clic sobre cualquier ruta que empiece con `GET` (son de color azul). Por ejemplo: `GET /api/v1/ventas`.
   - Se abrirá un menú desplegable. Haz clic en la esquina derecha superior en el botón blanco **"Try it out"** (Pruébalo).
   - Ahora, si había campos para rellenar, se habilitarán. Para empezar, solo haz clic abajito en el gran botón azul **"Execute"** (Ejecutar).
   - Desplázate un poco más abajo hasta la sección negra **"Server response"** (Respuesta del servidor). Ahí verás los datos solicitados mostrados si todo fue bien (Código 200).

### 6. ¿Cómo Desplegar/Publicar localmente?

Si ya probaste que todo funciona y deseas subir esta API a tu servidor o instalarlo en el IIS de tu propia máquina (Localhost completo):

1. **Prepara los archivos finales**: 
   Abre una nueva ventana de PowerShell y ve a la ruta de tu API (`cd d:\@Edgar\Fuentes\WebVentas\WebVentas.Core\WebVentas.Core.API`).
2. Escribe el comando que compilará y empaquetará el código para que sea rápido y productivo:
   ```powershell
   dotnet publish -c Release -o C:\DespliegueLocal\WebVentasAPI
   ```
   *(Este comando agarra todo el código útil y lo lanza optimizado a la ruta que le digas en la `-o`, en ese ejemplo `C:\DespliegueLocal\WebVentasAPI`)*.
3. **Instala el sistema en tu PC (IIS)**:
   - Presiona Windows, busca "Administrador de Internet Information Services (IIS)".
   - En el panel izquierdo, despliega tu PC -> Sitios -> Clic derecho en "Default Web Site" -> "Agregar aplicación...".
   - Ponle un alias como `WebVentasAPI`.
   - En **Ruta de acceso física**, dale al botón `...` y busca la carpeta que creaste en el paso anterior (`C:\DespliegueLocal\WebVentasAPI`).
   - Acepta todo. Ahora la API estará viva a nivel de usuario en tu red y equipo yendo a `http://localhost/WebVentasAPI/swagger`.
