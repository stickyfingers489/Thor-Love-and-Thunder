//
//  Topic.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 10/08/2022.
//

import UIKit

class Topic {
    var topicName: String
    var topicSymbol: String
    
    init(name: String!, Icon: String!){
        self.topicName = name
        self.topicSymbol = Icon
    }
    
}

let topics = [
    Topic(name: "Thesis", Icon: "books.vertical.circle"),
    Topic(name: "Dissertation", Icon: "books.vertical.circle"),
    Topic(name: "PHD Project", Icon: "graduationcap.circle")
]

let librarySettings = [
    Topic(name: "History", Icon: "clock.fill"),
    Topic(name: "Favorites", Icon: "star.fill"),
    Topic(name: "Downloads", Icon: "square.and.arrow.down.fill")
]
