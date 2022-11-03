//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by YeongJin Jeong on 2022/11/03.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "DesignSystem",
    product: .framework,
    dependencies: [
        .external(name: "SnapKit")
    ],
    resources: ["Resources/**"]
)
