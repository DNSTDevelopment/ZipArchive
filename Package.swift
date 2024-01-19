// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZipArchive",
    platforms: [
        .iOS("15.5"),
        .tvOS("15.4"),
        .macOS(.v10_15),
        .watchOS("8.4"),
        .macCatalyst("13.0")
    ],
    products: [
        .library(name: "SSZipArchive", type:.dynamic, targets: ["ZipArchive"]),
    ],
    targets: [
        .target(
            name: "ZipArchive",
            path: "SSZipArchive",
            resources: [
                .process("Supporting Files/PrivacyInfo.xcprivacy")],
            cSettings: [
                .unsafeFlags(["-enable-library-evolution","-emit-module-interface"]),
                .define("HAVE_INTTYPES_H"),
                .define("HAVE_PKCRYPT"),
                .define("HAVE_STDINT_H"),
                .define("HAVE_WZAES"),
                .define("HAVE_ZLIB"),
                .define("ZLIB_COMPAT")
            ],
            linkerSettings: [
                .unsafeFlags(["-enable-library-evolution","-emit-module-interface"]),
                .linkedLibrary("z"),
                .linkedLibrary("iconv"),
                .linkedFramework("Security"),
            ]
        )
    ]
)
