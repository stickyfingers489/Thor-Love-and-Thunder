//
//  Course.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 27/07/2022.
//

import UIKit
 
class Course {
    var courseTitle: String
    var courseSubtitle: String
    var courseDescription: String
    var courseIcon: UIImage
    var courseBanner: UIImage
    var courseAuthor: [String]?
    var courseGradient: [CGColor]?
    var courseBackground: UIImage?
    var sections: [Section]?
    
    init(title: String!, subtitle: String!, description: String!, icon: UIImage!, banner: UIImage!, authors: [String]? = nil, colors: [CGColor]? = nil, background: UIImage? = nil, sections: [Section]){
        self.courseTitle = title
        self.courseIcon = icon
        self.courseAuthor = authors
        self.courseBanner = banner
        self.courseDescription = description
        self.courseSubtitle = subtitle
        self.courseGradient = colors
        self.courseBackground = background
        self.sections = sections
    }
}

let handbooks = [
    Course(title: "Students Handbook", subtitle: "80 Essays - 9 hours", description: "Learn how to write Essays in MLA,APA HAVARD, and more", icon: UIImage(named: "Logo SwiftUI"), banner: UIImage(named: "Illustration 2"), authors: ["Stickyfingers"], colors: [
        UIColor(red: 0.387, green: 0.041, blue: 0.55, alpha: 1.0).cgColor,
        UIColor(red: 0.251, green: 0.555, blue: 0.835, alpha: 1.0).cgColor
    ], sections: sections),
    Course(title: "Dissertation Handbook", subtitle: "30 Examples - 3 hours", description: "A comprehensive series of tutorials on Dissertations and more!", icon: UIImage(named: "Logo React"), banner: UIImage(named: "Illustration 4"), authors: ["Familiaressays"], colors: [
        UIColor(red: 0.51, green: 0.255, blue: 0.737, alpha: 1.0).cgColor,
        UIColor(red: 0.883, green: 0.283, blue: 0.523, alpha: 1.0).cgColor,
        UIColor(red: 0.984, green: 0.647, blue: 0.545, alpha: 1.0).cgColor
    ], sections: sections)
]

let courses = [
    Course(title: "High School ", subtitle: "NEW VIDEO", description: "Learn how to write a Thesis Statement and more!", icon: UIImage(named: "Logo SwiftUI")!, banner: UIImage(named: "Illustration 4")!, authors: ["Stickyfingers489"],background: UIImage(named: "Background 3"), sections: sections),
    Course(title: "College", subtitle: "20 sections - 3 hours", description: "Build How to write and Essay following the key priciples of Topic Sentence and more!", icon: UIImage(named: "Logo Flutter")!, banner: UIImage(named: "Illustration 1")!, authors: ["Naughty Professor"], background: UIImage(named: "Background 4"), sections: sections),
    Course(title: "Masters", subtitle: "10 sections - 3 hours", description: "Write your Project paper and more!", icon: UIImage(named: "Logo React")!, banner: UIImage(named: "Illustration 2")!, authors: ["Ash"], background: UIImage(named: "Background 5"), sections: sections),
    Course(title: "PHD", subtitle: "5 sections - 3 hours", description: "Write your Doctrate Project paper and more!", icon: UIImage(named: "Logo React")!, banner: UIImage(named: "Illustration 2")!, authors: ["Victor Karani"], background: UIImage(named: "Background 5"), sections: sections)
]
