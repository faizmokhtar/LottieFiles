# LottieFiles

LottieFiles is an iOS app to browse Lottie animations from [lottiefiles.com](https://lottiefiles.com/).

This app allows users too:

- Explore the latest animations, featured animations and popular animations
- Scan QR code on [lottiefiles.com](https://lottiefiles.com/) and preview it on your device
- Share animations on Instagram stories and others

| Videos  |   |
|---|---|
| ![Home](assets/home.gif?raw=true)  | Home page |
| ![Explore](assets/explore-lottie.gif?raw=true)  | Explore with recent, featured and popular animations  |
| ![Login](assets/mock-login.gif?raw=true) | Mock auth state |
| ![Share](assets/share-animation.gif?raw=true) | Share to Instagram stories and others |
| ![Scan](assets/scan-qr-lottie.gif?raw=true) | Scan QR in lottiefiles.com |

## Installation

You can run the project on the latest Xcode13 and above.

## Architecture

- This project uses MVVM architecture with [Apple Combine][1] for reactive programming.
- This project utilise dependency injection for isolating dependencies

---

## Folder Structures

- `Scenes/`
  - Contains all the view controllers and view models that are related to the controller
- `Views/`
  - Contains shared views.
- `Providers/`
  - Contains API calls
- `Managers/`
  - `UserManager`: Handle user state management
- `Extensions/`
  - For extensions related files

## Tests

- Tests are added in the same folder as the implementation but with the target still set to the `Tests` target. For example:
- However, mocks,spy, etc still lives under the `Tests` target

# Some issues

- Tried using SwiftUI for developing [the app](https://github.com/faizmokhtar/LottieTest) at first but it seems like the Lottie support is not good enough yet? Very bad stutterings.
- There was some crash cause by assertion check on `lottie-ios` library. I had to fork the library and remove it myself. 
The assertion should probably be replace with warnings instead

# Some learnings

- Learned how to configure Lottie
- Learned how to use Combine in UIKit
- Learned how to use `UICollectionView` diffable data sources

# What could have been better
- Ideally the API in the `HomeViewModel` should have been a single API instead of three different API calls. 
This is so that the client don't have to transform the API responses so much. This would help with feature parity between platforms.
  - TODO: Create a single endpoint to fetch the 3 API calls and return a response that fits `HomeItem` struct
- More tests.
- I feel like the usage of UIKit and `Apple Combine` here is somewhat awkward here if compared to using `RxSwift`. After trying it out, 
I think it's best if the usage is only limited to UI binding through `@Publish/ObservableObject`

[1]: https://developer.apple.com/documentation/combine
