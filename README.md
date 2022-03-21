# LottieFiles

LottieFiles is an iOS app to browse Lottie animations from [lottiefiles.com](https://lottiefiles.com/).

This app allows users too:

- Explore the latest animations, featured animations and popular animations
- Scan QR code on [lottiefiles.com](https://lottiefiles.com/) and preview it on your device
- Share animations on Instagram stories and others

## Installation

You can run the project on the latest Xcode13 and above.

## Installation

This project uses Cocoapods. To run the installation, `cd` into the project root folder and run

## Architecture

- This project uses MVVM architecture with [Apple Combine][1] for reactive programming.
- This project utilise dependency injection for isolating dependencies

---

## Folder Structures



## Tests

- Tests are added in the same folder as the implementation but with the target still set to the `Tests` target. For example:
- However, mocks,spy, etc still lives under the `Tests` target

# Some issues

- Tried using SwiftUI for developing the app at first but it seems like the Lottie support is not good enough yet? Very bad stutterings.
- There was some crash cause by assertion check on `lottie-ios` library. I had to fork the library and remove it myself. 
The assertion should probably be replace with warnings instead

# What could have been better
- Ideally the API in the `HomeViewModel` should have been a single API instead of three different API calls. 
This is so that the client don't have to transform the API responses so much. This would help with feature parity between platforms.
  - TODO: Create a single endpoint to fetch the 3 API calls and return a response that fits `HomeItem` struct
- More tests.
- I feel like the usage of UIKit and `Apple Combine` here is somewhat awkward here if compared to using `RxSwift`. After trying it out, 
I think it's best if the usage is only limited to UI binding through `@Publish/ObservableObject`

[1]: https://developer.apple.com/documentation/combine
