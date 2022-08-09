//
//  Section.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 03/08/2022.
//

import UIKit

class Section {
    var sectionTitle: String
    var sectionSubtitle: String
    var sectionDescription: String
    var sectionIcon: UIImage
    var sectionBanner: UIImage

    init(title: String!, subtitle: String!, description: String!, icon: UIImage!, banner: UIImage!) {
        self.sectionTitle = title
        self.sectionSubtitle = subtitle
        self.sectionDescription = description
        self.sectionIcon = icon
        self.sectionBanner = banner
    }
}

let sections = [
    Section(title: "Phd Project", subtitle: "Phd tricks and SHortcuts", description: "Build an design your own project.", icon: UIImage(named: "Logo SwiftUI"), banner: UIImage(named: "Illustration 3")),
    Section(title: "Topic sentence Structure", subtitle: "Annotated bibliography", description: "Learn about the New way of Writing Essays and paper formats", icon: UIImage(named: "Logo SwiftUI"), banner: UIImage(named: "Illustration 4")),
    Section(title: "Masters Group Project", subtitle: "Annotated Bibliography", description: "Read about the Annotated guidelines and how you can use main points to maximize your best results", icon: UIImage(named: "Logo Flutter"), banner: UIImage(named: "Illustration 1")),
]
