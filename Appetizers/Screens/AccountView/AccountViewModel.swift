//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Yuri Ershov on 7.01.22.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    
    @Published var user = User()
    
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        // Check if there is a values in all fields
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
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
