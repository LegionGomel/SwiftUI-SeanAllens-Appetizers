//
//  OrderView.swift
//  Appetizers
//
//  Created by Yuri Ershov on 4.01.22.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(orderItems) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
                
                Button {
                    
                } label: {
                    APButton(title: "Placeholder")
                }
                .padding(.bottom, 25)
            }
            .navigationTitle("🍽 Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
