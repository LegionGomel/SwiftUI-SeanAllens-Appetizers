//
//  AccountView.swift
//  Appetizers
//
//  Created by Yuri Ershov on 4.01.22.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            Text("Account view")
                .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
