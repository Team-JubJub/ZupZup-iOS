//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by YeongJin Jeong on 2022/11/03.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "App",
    platform: .iOS,
    product: .app,
    dependencies: [
        .project(target: "DesignSystem", path: "../DesignSystem"),
        .project(target: "ZupZupNetwork", path: "../ZupZupNetwork"),
        .external(name: "SnapKit"),
        .external(name: "RxSwift"),
        .external(name: "RxCocoa"),
        .external(name: "FlexLayout")
    ],
    resources: ["Resources/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
