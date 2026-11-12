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
            url: "https://github.com/faceping/faceping-ios/releases/download/1.0.0-preview.5/FacePing.xcframework.zip",
            checksum: "f1f7869cdeafed34cc98349bd84f3bfbf928190fe99bd2aef037e7837b4a45d9"
        ),
    ]
)
