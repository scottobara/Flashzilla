//
//  Card.swift
//  Flashzilla
//
//  Created by Scott Obara on 13/3/21.
//

import Foundation

struct Card {
    let prompt: String
    let answer: String

    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
