//
//  Cat.swift
//  Star Wars Cats
//
//  Created by Brandon Jemison on 12/19/21.
//

import Foundation

struct Cats: Codable {
    let results: [Cat]
}

struct Cat: Codable, Hashable {
    let name: String
    let height : String?
    let mass : String?
    let hairColor : String?
    let skinColor : String?
    let eyeColor : String?
    let birthYear : String?
    let gender : String?
    let image : String
}
