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
            url: "https://github.com/faceping/faceping-ios/releases/download/1.0.0-preview.2/FacePing.xcframework.zip",
            checksum: "fb11eb4e2e610fe99e80499b30b7e6e9f91fc3eb2b36f5bc9dea3738f8cebbcd"
        ),
    ]
)
