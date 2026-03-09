# WebVentas - Visión Arquitectónica y Rediseño (To-Be)

Bienvenido al plano arquitectónico definitivo para la reescritura integral de **WebVentas**. Este documento establece las directrices estratégicas y técnicas para migrar de una arquitectura monolítica tradicional hacia un ecosistema moderno, escalable, "API First" y orientado a experiencias nativas multiplataforma.

---

## 🏗️ 1. Nueva Arquitectura Base (To-Be)

El nuevo sistema abandonará el esquema MVC acoplado a la UI a favor de la **Arquitectura Limpia (Clean Architecture)** o **Arquitectura Hexagonal (Ports and Adapters)**. Este enfoque asegura un desacoplamiento total entre las reglas de negocio, la capa de presentación y la infraestructura.

### Principios Fundamentales:
- **Independencia de Frameworks:** La lógica de negocio (Dominio y Casos de Uso) debe desconocer si la petición proviene de HTTP, gRPC o un worker en background.
- **Independencia de UI y Base de Datos:** Cambiar la vista o el motor de base de datos no debe impactar el core del sistema.
- **Testabilidad:** El núcleo del negocio será 100% testeable mediante pruebas unitarias sin depender de bases de datos reales o servidores web.

---

## 🛠️ 2. Stack Tecnológico (Versiones Recomendadas)

Para soportar este rediseño integral, el stack es actualizado hacia las normativas y herramientas más modernas de la industria:

*   **Lenguaje Backend:** C# (C# 12 / .NET 8 o superior)
*   **Framework Backend:** ASP.NET Core minimal APIs u orientadas a controladores ligeros.
*   **Base de Datos / ORM:** Entity Framework Core (última versión) con abstracción mediante patrón Repository/Unit Of Work. Soporte multi-tenant nativo a nivel de contexto.
*   **Seguridad:** OAuth 2.0 / OpenID Connect (Ej. IdentityServer o Keycloak) en conjunto con JWT, abandonando Session/FormsAuthentication y SAML obsoleto.
*   **Móvil (Cliente):** Kotlin (KMP) + Jetpack Compose para Android, y SwiftUI para iOS.
*   **Web Frontend:** React (Next.js) o Angular (versiones standalone modernas), conectados exclusivamente vía API.

---

## 🌐 3. Diseño de API y Backend ("API First")

El backend se transforma en el núcleo exclusivo centralizado para todas las aplicaciones clientes (Web, Mobile, Integraciones).

### Estructura del Backend (API RESTful + GraphQL)
- **API RESTful Core:** Será el estándar para la mayoría de las operaciones (CRUD, autenticación, flujos transaccionales). Todas las respuestas seguirán un estándar (ej. RFC 7807 Problem Details for HTTP APIs para errores).
- **GraphQL (Opcional pero Recomendado):** Para módulos complejos con relaciones profundas (como la visualización de jerarquías de documentos o reportes con campos dinámicos), minimizando el sobre-fetching (Over-fetching) para las aplicaciones móviles.

### Flujo Clean Architecture en Backend:
1.  **API Layer (Presentación):** Controladores/Endpoints. Su único trabajo es recibir la petición HTTP, autorizar y pasar el DTO a la capa de aplicación.
2.  **Application Layer:** Casos de uso e Interfaces. Orquesta el flujo de negocio pero no toma decisiones lógicas puras.
3.  **Domain Layer:** Entidades puras y reglas de negocio. Código 100% libre de dependencias a frameworks.
4.  **Infrastructure Layer:** Implementaciones de Base de datos (EF Core), clientes HTTP externos (SAP WCF/REST) y servicios de correo/archivos.

---

## 📱 4. Estrategia Móvil con Kotlin Multiplatform (KMP)

Para la nueva generación de aplicaciones móviles, adoptaremos **Kotlin Multiplatform (KMP)** garantizando máxima reutilización de código y una experiencia 100% nativa.

### Diseño del Módulo Compartido (KMP Shared Module)
Todo el código que no dependa de la plataforma residirá aquí:
-   **Modelos de Datos y DTOs:** Reflejando la estructura del nuevo backend.
-   **Consumo de Red (Networking):** Utilizando **Ktor** como cliente HTTP para gestionar las peticiones REST/GraphQL al backend.
-   **Almacenamiento Local (Caching/Offline):** Utilizando **SQLDelight** o **Room** (con soporte KMP) persistiendo configuraciones y datos operacionales críticos.
-   **Lógica de Presentación (ViewModels):** Manejadores de estado compartidos (ej. usando MVI o MVVM con state flows de Coroutines).

### Capa de UI Nativa (El último eslabón)
La UI será delegada a la tecnología nativa moderna de cada ecosistema, consumiendo exclusivamente los *Flows* y Estados del módulo KMP:
-   **Android:** **Jetpack Compose**. UIs declarativas super responsivas acopladas a los ViewModels del Core.
-   **iOS:** **SwiftUI**. Creación de vistas fluidas y modernas en el ecosistema Apple sin intermediarios pesados (como Flutter o React Native).

---

## 🗺️ 5. Plan de Ejecución Integral (Roadmap de Reescritura)

La transición se realizará de manera metódica para mitigar riesgos, adoptando una estrategia de estrangulamiento (Strangler Fig Pattern) si el negocio requiere mantener la aplicación actual viva, o un Big Bang ordenado si hay recursos para un corte limpio.

1.  **Fase 1: Setup de la Nueva Base y Estandarización (Mes 1)**
    *   Definición del nuevo esquema de Base de Datos y migración desde el modelo legacy.
    *   Setup de infraestructura Cloud y repositorios de código.
    *   Arquitectura esqueleto de la API (.NET 8 Clean Architecture).
2.  **Fase 2: Autenticación, Core y Desarrollo de APIs (Mes 2 - 3)**
    *   Implementación de Servidor de Identidades (JWT/OAuth2).
    *   Reescritura de módulos críticos y lógicas de acceso a datos legacy a nuevos servicios Core (Formularios, Documentos).
3.  **Fase 3: Desarrollo KMP Core y Web Base (Mes 4 - 5)**
    *   Inicio del desarrollo Web (React/Next.js) consumiendo la nueva API.
    *   Desarrollo de *Shared Module KMP* (Ktor, SQLDelight, lógicas offline).
4.  **Fase 4: Integración UI Móvil Nativa (Mes 6)**
    *   Implementación de Jetpack Compose en Android.
    *   Implementación de SwiftUI en iOS (en paralelo o cascada).
5.  **Fase 5: Testing Integral, QA y Despliegue (Mes 7)**
    *   Pruebas de carga (APIs).
    *   Lanzamiento Beta, retroalimentación y paso a Producción.

---

## ✅ 6. Estándares y Mejores Prácticas

Un código limpio exige herramientas y procesos impecables:

### 1. Control de Versiones (Git Flow / Trunk-Based Development)
- Utilización estricta de **Conventional Commits** (ej. `feat:`, `fix:`, `refactor:`).
- Revisiones de código obligatorias (Pull Requests / Merge Requests) antes de integrar a las ramas `main` o `develop`.

### 2. Testing (TDD y QAA)
-   **API:** Cobertura mínima del **70%** con `xUnit` o `NUnit` y `Moq`. Pruebas de integración para rutas críticas contra bases de datos en memoria o Testcontainers.
-   **KMP:** Pruebas unitarias completas sobre la capa de red y casos de uso en el módulo compartido.
-   **UI:** Snapshot testing y UI Tests para vistas nativas críticas en iOS/Android.

### 3. CI/CD (Automatización Continua)
-   **GitHub Actions / GitLab CI:** Pipelines configurados por entorno (Dev, Staging, Prod).
-   **Integración Continua (CI):** El pipeline DEBE compilar, correr linters y ejecutar todas las pruebas unitarias al hacer push. Si falla, el PR es bloqueado.
-   **Despliegue Continuo (CD):** Despliegues automatizados hacia Azure/AWS mediate Docker/Kubernetes (backend) y subida automática a App Center/TestFlight para pre-versiones móviles.
-   **Análisis de Código Estático:** Integración obligatoria con **SonarQube** o equivalente para vetar code smells o deudas técnicas tempranas.
