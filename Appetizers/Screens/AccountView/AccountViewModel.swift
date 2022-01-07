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
    
}
