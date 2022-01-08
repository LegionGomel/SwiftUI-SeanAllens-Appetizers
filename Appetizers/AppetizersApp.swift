//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Yuri Ershov on 4.01.22.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    // Creating Order object, that will be used in our app anywhere
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            // Injecting order object to view and all of its subviews
            AppetizerTabView().environmentObject(order)
        }
    }
}
