//
//  Order.swift
//  Appetizers
//
//  Created by Yuri Ershov on 8.01.22.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
}
