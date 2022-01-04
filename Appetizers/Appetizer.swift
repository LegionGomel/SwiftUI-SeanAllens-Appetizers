//
//  Appetizer.swift
//  Appetizers
//
//  Created by Yuri Ershov on 4.01.22.
//

import Foundation

struct Appetizer: Decodable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}
