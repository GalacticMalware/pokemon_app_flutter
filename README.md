# Pokedex App 🚀

Una aplicación móvil moderna de Pokédex inspirada en el universo Pokémon, desarrollada en **Flutter** utilizando la arquitectura limpia (**Clean Architecture**), el patrón de diseño funcional **BLoC** para la gestión de estados y un estricto cumplimiento de los principios **SOLID**.

La aplicación consume la API pública [PokeAPI](https://pokeapi.co) para listar los primeros 151 Pokémon (Primera Generación), ofreciendo paginación infinita, búsquedas en tiempo real, opciones de ordenamiento y una vista de detalles dinámica basada en el tipo elemental de cada Pokémon.

---

## 🛠️ Tecnologías y Librerías Utilizadas

- **Gestión de Estados e Inyección:** `flutter_bloc`, `get_it`, `riverpod`.
- **Conectividad y Red:** `http`, `cached_network_image`.
- **Programación Funcional y Modelado:** `dartz` (`Either`), `equatable`, `json_annotation`.
- **Herramientas de Desarrollo:** `build_runner`, `json_serializable`.

---

## 📐 Implementation de los Principios SOLID

El proyecto se estructuró dividiendo el código en tres capas puras (**Data, Domain y Presentation**) para garantizar la modularidad mediante los siguientes principios:

- **S - Single Responsibility (Responsabilidad Única):** Cada componente hace una sola cosa. Las entidades mapean datos puros, los _DataSources_ solo realizan peticiones HTTP crudas, los _Use Cases_ ejecutan únicamente reglas de negocio y los _BLoCs_ controlan exclusivamente los estados del flujo de la interfaz de usuario.
- **O - Open/Closed (Abierto/Cerrado):** La arquitectura está abierta a la extensión pero cerrada a la modificación. Por ejemplo, si deseas añadir una fuente de datos local (_Caché_ con Hive), puedes hacerlo extendiendo la interfaz `PokemonRemoteDataSource` o agregando un nuevo repositorio sin modificar la lógica existente del dominio.
- **L - Liskov Substitution (Sustitución de Liskov):** Las clases derivadas pueden sustituir a sus clases base sin romper la aplicación. Los fallos del sistema heredan de la clase abstracta `Failure` (`ServerFailure`, `NetworkFailure`), permitiendo que el BLoC los procese de manera uniforme.
- **I - Interface Segregation (Segregación de Interfaces):** Los contratos son específicos. La interfaz `PokemonRepository` define estrictamente los métodos necesarios para la lógica de Pokémon, evitando que las capas de presentación o datos dependan de métodos monolíticos o innecesarios.
- **D - Dependency Inversion (Inversión de Dependencias):** Las capas de alto nivel (Dominio) no dependen de las capas de bajo nivel (Datos); ambas dependen de abstracciones. El caso de uso `GetPokemonList` no conoce la implementación de `PokemonRepositoryImpl` ni al cliente HTTP; se comunica mediante la interfaz abstracta `PokemonRepository`, inyectada limpiamente con **GetIt**.

---

## 📥 Instrucciones de Instalación

Sigue estos pasos para clonar el repositorio, resolver las dependencias y ejecutar el proyecto en tu entorno local.

> 💡 **Nota de entorno:** El proyecto está diseñado como un entorno unificado y simplificado, por lo que **no requiere ningún tipo de configuración de flavors** (como esquemas separados para desarrollo, pruebas o producción) para poder compilar o funcionar.

### 1. Requisitos Previos

- Tener instalado **Flutter SDK** (Versión `>= 3.0.0`).
- Tener configurado un emulador (Android/iOS) o un dispositivo físico en modo desarrollador.

### 2. Clonar el repositorio

```bash
git clone https://github.com
cd pokedex_app
```

### 3. Instalar las dependencias

Descarga todos los paquetes especificados en el archivo `pubspec.yaml`:

```bash
flutter pub get
```

### 4. Generar el código automático

Dado que el proyecto utiliza `json_serializable` para el mapeo automático de datos, ejecuta el siguiente comando para generar los archivos `.g.dart`:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 5. Ejecutar la aplicación

Inicia el proyecto en tu emulador o dispositivo conectado:

```bash
flutter run
```
