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
    dependencies: [
        .external(name: "Moya"),
        .external(name: "RxMoya")
    ]
)
