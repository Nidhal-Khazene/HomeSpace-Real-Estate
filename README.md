# HomeSpace - Real Estate App
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/Nidhal-Khazene/HomeSpace-Real-Estate)

HomeSpace is a feature-rich real estate mobile application built with Flutter. It provides a modern, clean UI for users to discover, save, and inquire about properties. This project is an implementation of a UI kit from Figma, demonstrating a feature-first architecture, state management with BLoC, and a variety of custom UI components.

## ✨ Features

- **Onboarding:** A multi-step user onboarding process to customize the user experience from the start.
- **Authentication:** Secure user login and sign-up flows, including social media options and password reset.
- **Home Feed:** A dynamic home screen displaying nearby listings and categorized properties.
- **Property Listings:** Detailed property views with image carousels, pricing, property specifications, and agent information.
- **Search & Filter:** Robust search functionality for addresses, cities, and postal codes.
- **Favorites:** Ability to save listings to personalized wishlists.
- **In-App Chat:** A messaging system to connect users with agents and inquire about listings.
- **Mortgage Calculator:** A handy tool to estimate monthly mortgage payments.
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

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: `flutter_bloc`
- **Routing**: Custom `onGenerateRoute`
- **Local Storage**: `shared_preferences`
- **UI Packages**: `flutter_svg`, `font_awesome_flutter`, `iconsax_flutter`
- **Charts**: `fl_chart`
- **Utilities**: `dartz`, `table_calendar`

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- A code editor like VS Code or Android Studio.

### Installation

1.  Clone the repository:
    ```sh
    git clone https://github.com/Nidhal-Khazene/HomeSpace-Real-Estate.git
    ```
2.  Navigate to the project directory:
    ```sh
    cd HomeSpace-Real-Estate
    ```
3.  Install dependencies:
    ```sh
    flutter pub get
    ```
4.  Run the app:
    ```sh
    flutter run
    ```

## 📁 Project Structure

The project follows a feature-first architectural approach to keep the codebase modular, scalable, and easy to maintain.

```
lib/
├── core/         # Shared code: models, widgets, services, errors, utils
│   ├── errors/
│   ├── functions/
│   ├── models/
│   ├── routing/
│   ├── services/
│   ├── utils/
│   └── widgets/
├── features/     # Feature-specific modules
│   ├── auth/
│   ├── chats/
│   ├── favourites/
│   ├── home/
│   ├── on_boarding/
│   ├── settings/
│   └── splash/
└── main.dart     # Application entry point
```

- **`core`**: Contains all shared functionalities across different features, such as custom widgets, utility functions, routing logic, and base models.
- **`features`**: Each sub-directory represents a distinct feature of the app (e.g., `auth`, `home`). Each feature folder contains its own `presentation` layer with `views` and `widgets`.

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.