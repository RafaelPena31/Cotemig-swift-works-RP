//
//  AuthError.swift
//  Notas RP
//
//  Created by Rafael Augusto Mesquita on 22/11/21.
//

import Foundation
import Firebase

enum CreateUserError: String, Error {
    case badFormat = "The email address is badly formatted."
    case alreadyUse = "The email address is already in use by another account."
    case passwordInvalid = "The password is invalid or the user does not have a password."
    case userNotExist = "There is no user record corresponding to this identifier. The user may have been deleted."
}
