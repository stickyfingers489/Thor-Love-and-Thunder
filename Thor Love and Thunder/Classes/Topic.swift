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
        self.topicSymbol = name
    }
    
}

let topics = [
    Topic(name: "Thesis", Icon: "books.vertical.circlr"),
    Topic(name: "Dissetation", Icon: "book.fill.circle"),
    Topic(name: "PHD Project", Icon: "graduationcap.fill")
]
