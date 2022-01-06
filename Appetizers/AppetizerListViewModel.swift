//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Yuri Ershov on 6.01.22.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        // To not to use everytime self word (self.alettItem, for example)
        // we can use [self] in closures
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    // here we MUST use self because of same naming
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidResponce:
                        alertItem = AlertContext.invalidResponce
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
}
