//
//  Validation.swift
//  LoginScreen
//
//  Created by Shereena Sunny on 15/04/22.
//

import Foundation

class Validation: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""

    func isPasswordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^(?=.*[a-z]).{4,}$")
        return passwordTest.evaluate(with: password)
    }
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    
    var isLoginComplete: Bool { return isPasswordValid() && isEmailValid() }
    
    var emailPrompt: String { return isEmailValid() ? "" : "Enter a valid email address" }
    
    var passwordPrompt: String { return isPasswordValid() ? "" : "Enter a valid email address" }
}
