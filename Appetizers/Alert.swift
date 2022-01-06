//
//  Alert.swift
//  Appetizers
//
//  Created by Yuri Ershov on 6.01.22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data received from the user was invalid. Please contact support."),
                                            dismissButton: .default(Text("Ok")))
    static let invalidResponce  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid responce from the server. Please try again later or contact support."),
                                            dismissButton: .default(Text("Ok")))
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("The was an issue connecting to the server. If this persists, please contact support."),
                                            dismissButton: .default(Text("Ok")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("Ok")))
}
