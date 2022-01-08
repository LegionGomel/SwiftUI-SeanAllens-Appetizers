//
//  User.swift
//  Appetizers
//
//  Created by Yuri Ershov on 8.01.22.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
