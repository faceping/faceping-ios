// swift-tools-version:5.9
// FacePing for iOS: offline face verification with liveness. Binary package: the FacePing.xcframework attached to this
// repo's GitHub release (Swift API, the FacePing native core in Rust, Microsoft's ONNX Runtime and the face models).
import PackageDescription

let package = Package(
    name: "FacePing",
    platforms: [.iOS("15.1")],
    products: [
        .library(name: "FacePing", targets: ["FacePing"]),
    ],
    targets: [
        .binaryTarget(
            name: "FacePing",
            url: "https://github.com/faceping/faceping-ios/releases/download/1.0.0-preview.1/FacePing.xcframework.zip",
            checksum: "cbfb7be848bf49d6c6d53173cd965c17b265784cbf99e2da8bca16b4943fc85a"
        ),
    ]
)
