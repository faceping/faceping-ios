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
            url: "https://github.com/faceping/faceping-ios/releases/download/1.0.0-preview.4/FacePing.xcframework.zip",
            checksum: "87846f22419eb38d67fb556cd489d70e193ccdc69952a86c56d09ee07d9351ec"
        ),
    ]
)
