//
//  LoginResponse.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 6.09.2022.
//

import Foundation

struct LoginResponse {
    var isEmailVerified: Bool?
    var email: String?
    var name: String?
    var phoneNumber: String?
    var uid: String?
    var error: String?
}
