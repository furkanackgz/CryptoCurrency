//
//  SignUpResponse.swift
//  CryptoCurrency
//
//  Created by Furkan Açıkgöz on 12.09.2022.
//

import Foundation

struct SignUpResponse {
    var isEmailVerified: Bool?
    var email: String?
    var name: String?
    var phoneNumber: String?
    var uid: String?
    var error: String?
}
