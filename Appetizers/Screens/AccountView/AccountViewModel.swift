//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Yuri Ershov on 7.01.22.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        // Check if there is a values in all fields
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        print("save")
    }
}
