# Project Overview

This project is the Flutter frontend for a scalable friend-group application.
The core domain is **Cashpools**: a Splitwise-like expense sharing and settlement feature for group events (e.g., vacations).
*Future scope:* Minigames (Wheel of Fortune, Imposter, Truth or Dare), calendars, and polling.
*Backend:* Kotlin REST API, Keycloak Auth, and SSE (Server-Sent Events) for live actions.

# Tech Stack

*   **Framework:** Flutter
*   **State, Navigation & DI:** GetX (`GetxController`, `GetView`, `Get.toNamed`, `Get.put`)
*   **UI Library:** `forui`
*   **Data Classes / Serialization:** `freezed` + `json_annotation`
*   **Networking:** `dio` (REST & SSE)

# Architectural Rules

The app strictly follows Clean Architecture, Layered Architecture, and the Single Source of Truth principle. Logic must be aggressively decoupled.

*   **`lib/core/`**: Infrastructure. Contains global errors, network configurations (Dio, Auth interceptors), and app-wide utilities (JWT, UI state wrappers).
*   **`lib/data/`**: Data layer.
    *   `models/`: Domain entities and DTOs (Requests/Responses/Commands). **Must** use `freezed`.
    *   `repositories/`: Pure data fetching. Communicates directly with the backend via Dio.
    *   `managers/`: Local state/storage (e.g., `session_manager`).
*   **`lib/services/`**: Domain orchestration. Acts as the middleman between Controllers and Repositories. Handles business logic and data transformations.
*   **`lib/presentation/`**: UI layer. Strictly split into `screens/` and `controllers/`.
    *   **Screens/Sheets/Dialogs:** Purely declarative UI using `forui`. Zero business logic.
    *   **Controllers:** Extend `GetxController`. Handle all user interactions, form validation, and communication with Services.
*   **`lib/di/`**: Dependency Injection layer. All GetX bindings (`Get.put`, `Get.lazyPut`) are centralized here, separated by type (repos, services, controllers).

# AI Directives: Code Generation (CRITICAL)

When generating code for this project, you must adhere strictly to these rules:

1.  **Strict UI/Logic Separation:** Never put business logic, API calls, or complex state management inside a Widget. Widgets observe state via GetX (`Obx`, `GetBuilder`, or `controller.state`) and delegate actions to their respective `GetxController`.
2.  **State Management (GetX):** Use reactive state variables (`.obs`) in controllers. Handle loading, success, and error UI states elegantly (refer to `ui_state.dart` if applicable).
3.  **Data Models (Freezed):** Any new data model, request, or response must be generated using `@freezed`. Do not write standard Dart data classes. Always include the `part 'model_name.freezed.dart';` and `part 'model_name.g.dart';` directives.
4.  **UI Components:** Prefer the `forui` library over standard Material widgets where applicable (e.g., buttons, inputs, scaffolds) to maintain consistent app styling.
5.  **Networking & Auth:** Do not manually attach Keycloak JWTs to requests in repositories. Assume `auth_interceptor.dart` handles token injection and refreshing.
6.  **Command/Request Pattern:** Notice the separation in `lib/data/models/.../` between `cmds` (internal app actions) and `requests` (API payloads). Maintain this separation when creating new features.
7.  **Live Actions (SSE):** When implementing real-time features (like Cashpool updates), utilize Server-Sent Events patterns rather than standard polling or WebSockets, routing the stream through the Service layer to the Controller.