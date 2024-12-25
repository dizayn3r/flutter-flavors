# Flutter Flavor Implementation (Dev, Staging, Prod)

This project demonstrates how to implement flavors in a Flutter application, enabling easy management of different build configurations for development, staging, and production environments. This allows you to tailor your app's behavior and appearance for each stage of the software development lifecycle.

## Getting Started

This Flutter project showcases the three main stages of software development using distinct visual cues:

- **Development:** The environment where developers build and test new features.
- **Staging:** A pre-production environment used for final testing and quality assurance before release.
- **Production:** The live environment where the app is available to end-users.

This project uses distinct colors to visually differentiate each stage, providing an intuitive understanding of the software development lifecycle within the app itself.

## Visual Representation (Colors)

- **Development:** Blue
- **Staging:** Green
- **Production:** Red

These colors are used within the app (e.g., in the app bar or a banner) to clearly indicate the current flavor. The implementation details for this visual representation are not included in this README but are assumed to be part of the project's codebase.

## Flavors (Build Configurations)

The following flavors are implemented to manage different build configurations:

- **Development (dev):** Used for local development and testing. This flavor might include features like debug logging, mock data, and faster build times.
- **Staging (staging):** Used for pre-release testing and quality assurance. This flavor should closely mirror the production environment.
- **Production (prod):** Used for the final release to end-users. This flavor should be optimized for performance and stability.

## Implementation

Flavors are implemented using Flutter's build configuration capabilities, primarily through `flutter run --flavor <flavor_name>` and platform-specific build files.

### 1. Defining Flavors

Flavors are defined in the `android/app/build.gradle` (for Android) and `ios/Runner.xcconfig` (for iOS) files. This allows for platform-specific configurations for each flavor.

#### Android (`android/app/build.gradle`):

```gradle
android {
    ...
    flavorDimensions "default"
    productFlavors {
        dev {
            dimension "default"
            applicationIdSuffix ".dev"
            versionNameSuffix "-dev"
            resValue "string", "app_name", "Flutter Flavor Dev"
        }
        staging {
            dimension "default"
            applicationIdSuffix ".staging"
            versionNameSuffix "-staging"
            resValue "string", "app_name", "Flutter Flavor Staging"
        }
        prod {
            dimension "default"
            resValue "string", "app_name", "Flutter Flavor"
        }
    }
}