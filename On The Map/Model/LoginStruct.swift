//
//  LoginStruct.swift
//  On The Map
//
//  Created by Emil Haroutunian on 4/9/21.
//

import Foundation
import UIKit


struct LoginSession: Codable {
    let account: Account
    let session: Session
}

struct Account: Codable {
    let registered: Bool
    let key: String
}

struct Session: Codable {
    let id: String
    let expiration: String
}
