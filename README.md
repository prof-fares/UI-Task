# Flutter Clean Architecture Project

## Overview
This project uses a **custom clean architecture** to ensure modularity and separation of concerns. The folder structure follows:

- **app**
  - `configuration`: Routing files are configured here.
  - `helpers`
  - `main`

- **data**
  - `models`
  - `repos`
  - `services`

- **domain**
  - `controllers`: Responsible for state management and dependency injection using GetX.
  - `bindings`

- **presentation**
  - `resourceManager`: Contains all resources such as colors, fonts, and themes.
  - `views`: Divided by each page, and within each page folder, smaller widgets are organized to promote modularity.

## Key Features

### 1. **GetX for State Management, Routing, and Dependency Injection**
   - GetX was used as a routing solution and for state management across the app. State management and dependency injection were handled in the `domain` layer.
   - Routing configuration files are organized under `app/configuration`.

### 2. **Data Fetching with Mock API Simulation**
   - Data was simulated using a mock service located at `data/services/mock/mock_data_service`.
   - Repositories manage data fetching and error handling using `Either` to handle both success and failure cases.
   - The repository for handling car data can be found in `data/repos/carsRepo/repoImpl/mock_repo_impl`.

### 3. **Optimized UI and Performance**
   - Each widget is designed as a `const` where possible, reducing unnecessary rebuilds.
   - Small, reusable widgets are built to improve readability, maintainability, and performance.
   - **Auto-Scrolling Carousel**: A custom auto-scroll carousel with smooth animation enhances the UI.
   - `RepaintBoundary` was used around scrollable lists to prevent unnecessary repaints of other elements, improving scrolling performance.
   - Cached images are managed by `CachedNetworkImage`, which improves performance by caching images locally.

### 4. **Infinite Scrolling and Pagination**
   - Each page features an infinite scroll with pagination simulation, specifically in the car grid view.

### 5. **Reusable Widget and Controller Template**
   - A `BaseController` was created as a template to provide common logic for other controllers. This pattern enhances:
     - **Code reusability**: Sharing base functionality across controllers.
     - **Complexity management**: Simplifying controllers by isolating shared logic.
   - Widgets that depend on `GetView` with generic controllers were also standardized, enhancing performance by ensuring each widget is `const`.

### 6. **Theme Switching**
   - Users can switch between dark and light themes seamlessly, implemented using GetX as an ecosystem.

### 7. **Responsive Design**
   - The app is fully responsive across devices, thanks to `Expanded`,`MediaQuery`,`LayoutBuilder`,`ScreenUtil` and `Device Preview` for testing.
   - UI adapts well on different screen sizes.

### 8. **Unit Testing**
   - Comprehensive unit tests were added to ensure app stability:
     - **Model Class Tests**: Testing data parsing into objects.
     - **Controller Tests**: Covering both main page and detail page controllers.
     - **Repository Layer Tests**: Ensuring correct data fetching and handling.
   - Mock data was used to simulate various scenarios, including successful and failed data fetching.

## File Organization and Setup

- **Colors, Text, and Styles**: All colors, text sizes, and weights are organized in `resourceManager`, along with the main `theming` file.
- **Reusable Widgets**: Widgets are split into smaller components, located in each page's respective folder within `views`.

### Running the Project
1. Ensure you have Flutter installed. Use the following command to check your version:
   ```bash
   flutter --version
