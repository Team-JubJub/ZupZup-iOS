//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by YeongJin Jeong on 2022/11/03.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ZupZupNetwork",
    product: .staticFramework,
    packages: [
        .remote(
            url: "https://github.com/firebase/firebase-ios-sdk", requirement: .upToNextMajor(from: "10.0.0")
        )
    ],
    dependencies: [
        .external(name: "Moya"),
        .external(name: "RxMoya"),
        .package(product: "FirebaseFirestore"),
        .package(product: "FirebaseFirestoreSwift")
    ]
)
