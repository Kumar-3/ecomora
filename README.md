# Ecomora

A modern e-commerce mobile app built with Flutter, following Clean Architecture principles.

---

## Features

- **Onboarding** — Animated introduction screens for first-time users
- **Authentication** — Login, Register, OTP verification, Forgot/Reset password, Token verification
- **Dashboard** — Main navigation shell with modular screens
- **Home** — Product browsing interface
- **Wishlist** — Save and manage favourite products
- **Dark Mode** — Full light/dark theme support

---

## Tech Stack

| Layer | Technology |
| --- | --- |
| Framework | Flutter 3.41.x |
| State Management | Riverpod 3.x (`flutter_riverpod`, `riverpod_annotation`) |
| Code Generation | `riverpod_generator`, `build_runner` |
| Navigation | `go_router` |
| Dependency Injection | `get_it` |
| Networking | `http` |
| Local Storage | `shared_preferences` |
| Animations | `lottie` |
| Architecture | Clean Architecture (Data / Domain / Presentation) |
| Font | Switzer (9 weights) |

---

## Project Structure

```text
lib/
├── core/
│   ├── common/          # Shared widgets, entities, models, singletons
│   ├── config/          # AppConfig — env-aware build configuration
│   ├── errors/          # Exceptions & failures
│   ├── extension/       # Dart extensions (context, string, text style)
│   ├── res/             # Colors, text styles, media paths
│   ├── services/        # Router, dependency injection
│   └── utils/           # Constants, typedefs, network utilities
└── src/
    ├── auth/            # Authentication feature
    │   ├── data/        # Remote datasource, repository implementation
    │   ├── domain/      # Repository interface, use cases
    │   └── presentation/ # Riverpod adapter, states, screens
    ├── dashboard/       # Dashboard shell + wishlist feature
    ├── home/            # Home screen
    └── on_boarding/     # Onboarding screens
```

---

## Getting Started

### Prerequisites

- Flutter `>=3.41.0`
- Dart `>=3.10.4`

### Installation

```bash
git clone https://github.com/<your-username>/ecomora.git
cd ecomora
flutter pub get
```

### Code Generation

Run once before building (required for Riverpod providers):

```bash
dart run build_runner build --delete-conflicting-outputs
```

Or in watch mode during development:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### Running

**Development (hits localhost API by default):**

```bash
flutter run
```

**Production build:**

```bash
flutter build apk --release \
  --dart-define=APP_ENV=prod \
  --dart-define=BASE_URL=https://api.yourdomain.com/api/v1 \
  --dart-define=AUTHORITY=api.yourdomain.com \
  --dart-define=APP_NAME=Ecomora
```

---

## Environment Configuration

All environment values are injected at build time via `--dart-define`. No `.env` files are committed.

| Variable | Default (dev) | Description |
| --- | --- | --- |
| `APP_ENV` | `dev` | Environment name (`dev` / `prod`) |
| `BASE_URL` | `http://127.0.0.1:3000/api/v1` | API base URL |
| `AUTHORITY` | `127.0.0.1:3000` | API host authority |
| `API_PATH` | `/api/v1` | API path prefix |
| `APP_NAME` | `Ecomora` | App display name |

---

## Android Release Signing

1. Copy the signing template:

   ```bash
   cp android/key.properties.example android/key.properties
   ```

2. Fill in your keystore details in `android/key.properties` (this file is gitignored).
3. Place your `.jks` keystore file at the path you specified.

---

## Architecture Overview

```text
Presentation  →  Domain  →  Data
  (Riverpod)   (Use Cases)  (Repository + Datasource)
```

- **Domain layer** has zero Flutter/framework dependencies — pure Dart
- **Use cases** return `Either<Failure, T>` via `dartz`
- **Riverpod adapters** consume use cases and expose sealed `AuthState` to the UI
- **Data layer** handles HTTP, error mapping, and token renewal

---

## Color Palette

| Token | Hex | Usage |
| --- | --- | --- |
| Primary | `#524EB7` | Buttons, active states |
| Secondary | `#FF6631` | Accents, highlights |
| Dark BG | `#0E0D11` | Dark mode background |
| Text Primary | `#282344` | Headings |
| Text Secondary | `#9491A1` | Subtitles, hints |
