# Estructura Sugerida para KMP (Kotlin Multiplatform)

Para la modernización móvil de WebVentas, utilizaremos **Kotlin Multiplatform (KMP)** para compartir la lógica de negocio, persistencia local y llamadas de red entre Android e iOS, delegando únicamente el código UI a las plataformas nativas.

## 🏗️ Árbol de Directorios (Módulo Móvil)

```text
WebVentasMobile/
├── androidApp/                  # Proyecto Nativo Android (UI)
│   ├── src/main/java/           # Código Kotlin + Jetpack Compose
│   ├── build.gradle.kts         # Dependencias Android
│   └── AndroidManifest.xml
│
├── iosApp/                      # Proyecto Nativo iOS (UI)
│   ├── iosApp/                  # Código Swift + SwiftUI
│   └── iosApp.xcodeproj         # Proyecto de Xcode
│
└── shared/                      # Módulo KMP (Core Compartido)
    ├── build.gradle.kts         # Configuraciones de multiplatform (Ktor, SQLDelight, etc)
    ├── src/
    │   ├── commonMain/          # 🧠 LÓGICA COMPARTIDA (Agnóstica a la plataforma)
    │   │   ├── kotlin/
    │   │   │   ├── Application/ # Casos de Uso, DTOs (equivalente a PoC .NET)
    │   │   │   ├── Data/        # Repositorios, Endpoints con Ktor
    │   │   │   └── Domain/      # Entidades (Documento, Auth)
    │   │
    │   ├── androidMain/         # 🤖 Implementaciones Exclusivas de Android (Ej. manejadores Bluetooth, SQLite Driver)
    │   │
    │   └── iosMain/             # 🍎 Implementaciones Exclusivas de iOS (Ej. NativeSqliteDriver)
```

## 🛠️ Stack y Dependencias Recomendadas en `shared/build.gradle.kts`

A continuación, la configuración de librerías esenciales para el módulo compartido (`commonMain`):

```kotlin
kotlin {
    androidTarget()
    iosX64()
    iosArm64()
    iosSimulatorArm64()

    sourceSets {
        val commonMain by getting {
            dependencies {
                // 🌐 Red (Networking REST/GraphQL)
                implementation("io.ktor:ktor-client-core:2.3.4")
                implementation("io.ktor:ktor-client-content-negotiation:2.3.4")
                implementation("io.ktor:ktor-serialization-kotlinx-json:2.3.4")
                
                // 💾 Persistencia de Datos Offline
                implementation("app.cash.sqldelight:coroutines-extensions:2.0.0")
                
                // 🔄 Inyección de Dependencias (Koin)
                implementation("io.insert-koin:koin-core:3.5.0")
                
                // 🧵 Concurrencia (Coroutines & Flows)
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3")
            }
        }
        val androidMain by getting {
            dependencies {
                implementation("io.ktor:ktor-client-okhttp:2.3.4")
                implementation("app.cash.sqldelight:android-driver:2.0.0")
            }
        }
        val iosMain by getting {
            dependencies {
                implementation("io.ktor:ktor-client-darwin:2.3.4")
                implementation("app.cash.sqldelight:native-driver:2.0.0")
            }
        }
    }
}
```

## 💡 El Flujo de Trabajo

1. **El Backend:** Expone `GET /api/documentos`.
2. **El Módulo `shared` (commonMain):** Usa `Ktor` para llamar a la API, recibe JSON, lo parsea, lo guarda en caché usando `SQLDelight`, y expone esa data a la UI a través de un `StateFlow`.
3. **Android (`androidApp`):** Consume ese `StateFlow` directamente en una vista elaborada con **Jetpack Compose** (100% Kotlin).
4. **iOS (`iosApp`):** Se convierte el Flow nativo a Combine/Observables y se inyecta en vistas de **SwiftUI**.

*Este documento acompaña al `ARQUITECTURA_TO_BE.md` como guía concisa del arranque móvil definitivo.*
