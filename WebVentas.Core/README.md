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

Puedes abrir la solución `WebVentas.Core.sln` en **Visual Studio 2022**, o desde terminal:

```bash
cd WebVentas.Core
dotnet restore
dotnet build
```

Para correr la API temporalmente y levantar Swagger (por defecto):

```bash
cd WebVentas.Core.API
dotnet run
```
