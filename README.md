# FacePing for iOS

**FacePing** verifies a face on the iPhone itself: enrol a face once, then check it live (with a head-turn liveness check) any time, with no network. This is the Swift package for iOS 15.1 and later, distributed as a binary (`FacePing.xcframework`).

Face detection, liveness, matching, encrypted storage and licence checks run in the FacePing core, a native library written in Rust and compiled into the framework, together with Microsoft's ONNX Runtime and the face models. Your app only does `import FacePing`.

## Add it to your app

In Xcode: **File → Add Package Dependencies…**, enter

```
https://github.com/faceping/faceping-ios
```

and choose version **1.0.0-preview.3**. It's a prerelease, so pick the dependency rule **Exact Version** `1.0.0-preview.3`: while FacePing is in preview, each release may change the API, so update on purpose (Xcode only offers prereleases when you type one in). Add the `FacePing` library to your app target.

Or in a `Package.swift`:

```swift
.package(url: "https://github.com/faceping/faceping-ios", exact: "1.0.0-preview.3")
```

Then:

- Add `NSCameraUsageDescription` to your app's Info.plist (the live check uses the front camera).
- The simulator has no front camera, so test the live check on an iPhone.

## Use it

```swift
import FacePing

let faceping = try FacePing(sandboxKey: "fp_test_…")

// Add the face once, on the device
try await faceping.enroll(id: "me", photo: photo)

// Verify any time, with no network
let result = try await faceping.verifyLive(id: "me", camera: cameraView)
// result.outcome → .match
```

`photo` is a `FaceImage`, `UIImage` or image `Data` (JPEG, PNG, HEIC). `cameraView` is a `FaceCameraView`; in SwiftUI show it with `FaceCamera(cameraView)`. One FacePing runs per app: `FacePing.configure(sandboxKey:)` once at start-up, then `FacePing.shared` anywhere.

The [iOS starter](https://github.com/faceping/ios-starter) is a complete SwiftUI app (FaceCheck) built on this package: clone it, paste your key, run it on your iPhone.

## The sandbox

Get a free sandbox key at [app.faceping.ai/signup](https://app.faceping.ai/signup) (no card, no approval): **Developers → Sandbox keys → Create sandbox key**. It starts with `fp_test_`.

The sandbox is for building and testing: up to 25 faces per device, each deleted 24 hours after it was enrolled. Faces never leave the phone. The app needs a connection the first time it runs, to activate your key; after that it works offline for 30 days. To use FacePing with real people, go live from your [FacePing dashboard](https://app.faceping.ai). Your verify code doesn't change.

## Learn more

- [Get started on iOS](https://docs.faceping.ai/start/ios/)
- [How the SDK works](https://docs.faceping.ai/sdk/): liveness, storage, sandbox and production
- [Security](https://docs.faceping.ai/security/): the Rust core, encryption on the device
- [Changelog](https://docs.faceping.ai/changelog/)
- Questions: support@faceping.ai

## Licence

The FacePing SDK is licensed, not sold: see [LICENSE](LICENSE) (also at [faceping.ai/legal/sdk-licence](https://faceping.ai/legal/sdk-licence)). It includes third-party components under their own licences: see [THIRD-PARTY-NOTICES.txt](THIRD-PARTY-NOTICES.txt).
