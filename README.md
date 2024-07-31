# Weather App

This project is a Flutter application that fetches weather data from the OpenWeatherMap API and displays the temperature and location name on the screen, following the provided Figma design.

## Features

- Clean architecture using the Bloc (Business Logic Component) pattern
- Responsive image handling based on screen size
- Unit tests for key functions in the Bloc, Repository, and DataSource layers

## Getting Started

### Prerequisites

- Flutter SDK (version 3.22.2)
- Dart SDK (version 3.4.3)
- An API key from OpenWeatherMap (you can sign up for a free account to get one)

### Installation

1. Clone the repository:

```
git clone https://github.com/itismrx/copah_onboarding.git
```

2. Navigate to the project directory:

```
cd copah_onboarding
```

3. Install the dependencies:

```
flutter pub get
```

4. Run the app:

```
flutter run
```

### Testing

To run the unit tests:

```
flutter test
```

## Architecture

This project follows the Clean Architecture principles, with the following layers:

1. **Presentation Layer**: Responsible for the UI and user interactions. In this project, it includes the `HomeScreen` and the Bloc (`WeatherBloc`).

2. **Domain Layer**: Encapsulates the business logic and use cases. In this project, it includes the `WeatherRepository` interface.

3. **Data Layer**: Responsible for data retrieval and manipulation. In this project, it includes the `WeatherRepositoryImpl` and `RemoteDataSource`.

The use of the Bloc pattern and the separation of concerns in the architecture ensure that the code is maintainable, testable, and scalable.