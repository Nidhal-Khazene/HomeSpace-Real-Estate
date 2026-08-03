# HomeSpace - Real Estate App
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/Nidhal-Khazene/HomeSpace-Real-Estate)

HomeSpace is a feature-rich real estate mobile application built with Flutter. It provides a modern, clean UI for users to discover, save, and inquire about properties. This project is an implementation of a UI kit from Figma, demonstrating a feature-first clean architecture, state management with BLoC, a repository pattern for data access, and a variety of custom UI components.

## ✨ Features

- **Onboarding:** A multi-step user onboarding process to customise the user experience from the start.
- **Authentication:** Secure user login and sign-up flows, including social media options and password reset.
- **Home Feed:** A dynamic home screen displaying nearby listings and categorised properties, with skeleton loading states.
- **Property Listings:** Detailed property views with image carousels, pricing, property specifications, and agent information.
- **Search & Filter:** Robust search functionality for addresses, cities, and postal codes.
- **Favorites:** Ability to save listings to personalised wishlists, persisted locally with Hive.
- **In-App Chat:** A messaging system to connect users with agents and inquire about listings.
- **Mortgage Calculator:** A handy tool to estimate monthly mortgage payments, with interactive charts.
- **Settings:** A comprehensive settings module for profile management, notification preferences, and support.

## 📱 Screenshots

| Splash | Onboarding 1 | Onboarding 2 | Onboarding 3 |
| :---: | :---: | :---: | :---: |
| <img src="assets/preview/splash_view.png" width="220"/> | <img src="assets/preview/on_boarding_view_1.png" width="220"/> | <img src="assets/preview/on_boarding_view_2.png" width="220"/> | <img src="assets/preview/on_boarding_view_3.png" width="220"/> |

| Onboarding 4 | Onboarding 5 | Onboarding 6 | Auth 1 |
| :---: | :---: | :---: | :---: |
| <img src="assets/preview/on_boarding_view_4.png" width="220"/> | <img src="assets/preview/on_boarding_view_5.png" width="220"/> | <img src="assets/preview/on_boarding_view_6.png" width="220"/> | <img src="assets/preview/auth_1.png" width="220"/> |

| Auth 2 | Auth 3 | Auth 4 | Auth 5 |
| :---: | :---: | :---: | :---: |
| <img src="assets/preview/auth_2.png" width="220"/> | <img src="assets/preview/auth_3.png" width="220"/> | <img src="assets/preview/auth_4.png" width="220"/> | <img src="assets/preview/auth_5.png" width="220"/> |

| Auth 6 |
| :---: |
| <img src="assets/preview/auth_6.png" width="220"/> |

| Screen 1 | Screen 2 | Screen 3 | Screen 4 |
| :---: | :---: | :---: | :---: |
| <img src="assets/preview/1.png" width="220"/> | <img src="assets/preview/2.png" width="220"/> | <img src="assets/preview/3.png" width="220"/> | <img src="assets/preview/4.png" width="220"/> |

| Screen 5 | Screen 6 | Screen 7 | Screen 8 |
| :---: | :---: | :---: | :---: |
| <img src="assets/preview/5.png" width="220"/> | <img src="assets/preview/6.png" width="220"/> | <img src="assets/preview/7.png" width="220"/> | <img src="assets/preview/8.png" width="220"/> |

| Screen 9 | Screen 10 | Screen 11 | Screen 12 |
| :---: | :---: | :---: | :---: |
| <img src="assets/preview/9.png" width="220"/> | <img src="assets/preview/10.png" width="220"/> | <img src="assets/preview/11.png" width="220"/> | <img src="assets/preview/12.png" width="220"/> |

| Screen 13 | Screen 14 | Screen 15 | Screen 16 |
| :---: | :---: | :---: | :---: |
| <img src="assets/preview/13.png" width="220"/> | <img src="assets/preview/14.png" width="220"/> | <img src="assets/preview/15.png" width="220"/> | <img src="assets/preview/16.png" width="220"/> |

## 🎨 Figma Design

This application is based on the "Real estate - UI Kit" from Figma Community.

[Figma Link](https://www.figma.com/design/P2YRSm4AaaqYNxnQzQoJWe/Real-estate---UI-Kit--Community-?node-id=337-2417&t=brkWggxk4HYh7iXc-0)

## 🔑 RentCast API

HomeSpace uses the **[RentCast API](https://rentcast.io)** to fetch real-time property listings data.

### What it provides

| Data | Description |
| :--- | :--- |
| **Sale Listings** | Active for-sale properties with price, address, beds, baths, and square footage |
| **Property Details** | Property type, year built, lot size, and estimated values |
| **Agent Info** | Listing agent name and contact details |
| **Images** | Property photo URLs displayed in listing carousels |

### Endpoint used

| Method | Endpoint | Purpose |
| :--- | :--- | :--- |
| `GET` | `/v1/listings/sale` | Fetch paginated active sale listings with filters (city, state, property type, bedrooms) |

### Authentication

All requests are authenticated via the `X-Api-Key` header. The key is loaded at runtime from a local `.env` file using `flutter_dotenv` — **never hard-coded or committed to version control**.

```env
# .env  (add this file locally — it is listed in .gitignore)
RENTCAST_API_KEY=your_rentcast_api_key_here
```

### Getting an API key

1. Sign up for a free account at [rentcast.io](https://rentcast.io).
2. Navigate to **Dashboard → API Keys**.
3. Copy your key and paste it into your local `.env` file.

> **Note:** The free tier includes a limited number of monthly requests. Check [RentCast's pricing page](https://rentcast.io/pricing) for up-to-date quota information.

## 🛠️ Tech Stack

| Category | Package / Tool |
| :--- | :--- |
| **Framework** | Flutter (Dart SDK ^3.8.1) |
| **State Management** | `flutter_bloc` · `bloc` |
| **Architecture** | Clean Architecture · Feature-First · Repository Pattern |
| **Networking** | `dio` |
| **Dependency Injection** | `get_it` |
| **Local Storage** | `hive` · `hive_flutter` · `shared_preferences` |
| **Environment Config** | `flutter_dotenv` |
| **Routing** | Custom `onGenerateRoute` |
| **UI / Icons** | `flutter_svg` · `font_awesome_flutter` · `iconsax_flutter` · `iconly` |
| **Charts** | `fl_chart` |
| **Skeleton Loading** | `skeletonizer` |
| **Utilities** | `dartz` · `table_calendar` |
| **Code Generation** | `hive_generator` · `build_runner` |
| **Custom Font** | GT Walsheim |

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- A code editor like VS Code or Android Studio.

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/Nidhal-Khazene/HomeSpace-Real-Estate.git
    ```
2. Navigate to the project directory:
    ```sh
    cd HomeSpace-Real-Estate
    ```
3. Create a `.env` file at the project root and add your RentCast API key:
    ```env
    RENTCAST_API_KEY=your_rentcast_api_key_here
    ```
4. Install dependencies:
    ```sh
    flutter pub get
    ```
5. Run code generation (required for Hive adapters):
    ```sh
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
6. Run the app:
    ```sh
    flutter run
    ```

## 📁 Project Structure

The project follows a **Feature-First Clean Architecture** to keep the codebase modular, scalable, and easy to maintain. Each feature is self-contained with its own `data`, `domain`, and `presentation` layers.

```
lib/
├── core/                 # App-wide infrastructure
│   ├── errors/           # Failure & exception definitions
│   ├── routing/          # onGenerateRoute navigation
│   ├── services/         # Service locator (get_it), Hive setup, BLoC observer
│   └── utils/            # Colors, constants, asset helpers
├── shared/               # Shared domain & UI across features
│   ├── models/           # Common data models
│   ├── use_cases/        # Shared use case base classes
│   ├── widgets/          # Reusable UI components
│   └── functions/        # Shared utility functions
├── features/             # Feature-specific modules
│   ├── auth/             # Login, sign-up, forgot password
│   ├── chats/            # In-app messaging
│   ├── favourites/       # Saved listings (Hive-persisted)
│   ├── home/             # Feed, listings, property details
│   ├── on_boarding/      # Multi-step onboarding flow
│   ├── settings/         # Profile, notifications, support
│   └── splash/           # Launch screen
└── main.dart             # Application entry point
```

Each feature folder follows Clean Architecture layers:

```
feature/
├── data/
│   ├── data_sources/     # Remote (Dio) & local (Hive) data sources
│   ├── models/           # JSON-serialisable data models
│   └── repos/            # Repository implementations
├── domain/
│   ├── entities/         # Pure domain entities
│   ├── repos/            # Repository abstract interfaces
│   └── use_cases/        # Business logic use cases
└── presentation/
    ├── manager/          # BLoC / Cubit state management
    └── views/            # Screens & widgets
```

- **`core`**: App-wide infrastructure — routing, dependency injection setup, Hive initialisation, and shared utilities.
- **`shared`**: Cross-feature building blocks — reusable widgets, common models, and base use case classes.
- **`features`**: Each sub-directory is a fully independent feature module with its own data, domain, and presentation layers.

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.