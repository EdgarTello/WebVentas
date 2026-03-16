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
La aplicación utiliza la llave `"WebVentas.Core"` dentro de `ConnectionStrings`, la cual por defecto se encuentra configurada para apuntar al servidor `37.187.141.26,11432` (base de datos `ventas_v2`).

### 2. Restaurar dependencias y compilar

Abre una terminal y navega a la raíz de la solución (`WebVentas.Core`), luego ejecuta:

```bash
dotnet restore
dotnet build
```

### 3. Ejecutar la Aplicación para Pruebas Locales (Paso a Paso)

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
   *Verás varias letras blancas y amarillas. Solo busca la frase amarilla que dice **"Now listening on: http://localhost:5273"** (el número al final puede variar a otro puerto dependiendo de tu equipo).*

### 4. ¿Cómo probar la API a nivel de usuario? (Interfaz Swagger)

La aplicación trae integrada **Swagger**, una página web muy amigable y visual para interactuar con las rutas como si tuviéramos un panel de control, sin escribir código.

1. Abre tu navegador web favorito (Chrome, Edge, Firefox).
2. En la parte de arriba donde pones las direcciones web (Ej: google.com), escribe el enlace que te dio PowerShell y presiona *Enter*. (Serás redirigido automáticamente a la pantalla de la API).
   **Ejemplo:** `http://localhost:5273`
3. Verás una pantalla blanca con verde con el título **"WebVentas.Core.API"** y una lista de "Controladores" (que son las funciones disponibles).
4. **¡Haz tu primera prueba!**:
   - Haz clic sobre cualquier ruta que empiece con `GET` (son de color azul). Por ejemplo: `GET /api/v1/ventas`.
   - Se abrirá un menú desplegable. Haz clic en la esquina derecha superior en el botón blanco **"Try it out"** (Pruébalo).
   - Ahora, si había campos para rellenar, se habilitarán. Para empezar, solo haz clic abajito en el gran botón azul **"Execute"** (Ejecutar).
   - Desplázate un poco más abajo hasta la sección negra **"Server response"** (Respuesta del servidor). Ahí verás los datos solicitados mostrados si todo fue bien (Código 200).

### 5. ¿Cómo publico los pasos para el servidor final?

Dado que probaremos todo **solamente a nivel de aplicación local**, no necesitas instalar *IIS*, *WAMP* ni ninguna herramienta de servidor en tu PC. El comando `dotnet run` (que usamos en el paso 3) empaqueta su propio mini-servidor.

Cualquier prueba de conexión, integración o lectura debe ser validada directamente desde esa ventana azul de **PowerShell** en tu entorno, verificando la consola y las respuestas de Swagger.
