//
//  String+Ext.swift
//  Appetizers
//
//  Created by Yuri Ershov on 7.01.22.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailFormat     = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailpredicate  = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailpredicate.evaluate(with: self)
    }
}
