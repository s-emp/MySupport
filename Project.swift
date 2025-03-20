import ProjectDescription

let project = Project(
    name: "MySupport",
    targets: [
        .target(
            name: "MySupport",
            destinations: .macOS,
            product: .app,
            bundleId: "io.tuist.MySupport",
            infoPlist: .default,
            sources: ["MySupport/Sources/**"],
            resources: ["MySupport/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "MySupportTests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "io.tuist.MySupportTests",
            infoPlist: .default,
            sources: ["MySupport/Tests/**"],
            resources: [],
            dependencies: [.target(name: "MySupport")]
        ),
    ]
)
