// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "EasyStack",
	platforms: [
		.iOS(.v13)
	],
	products: [
		.library(
			name: "EasyStack",
			targets: ["EasyStack"]),
	],
	dependencies: [ ],
	targets: [
		.binaryTarget(
			name: "EasyStack",
			path: "./Sources/EasyStack.xcframework"),
	]
)
