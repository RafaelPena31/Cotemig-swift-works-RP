//
//  ErrorModel.swift
//  CotemigRP
//
//  Created by Rafael Augusto Mesquita on 08/11/21.
//

import Foundation
import Firebase

enum CreateUserError: String, Error {
    case badFormat = "The email address is badly formatted."
    case alreadyUse = "The email address is already in use by another account."
    case passwordInvalid = "The password is invalid or the user does not have a password."
    case userNotExist = "There is no user record corresponding to this identifier. The user may have been deleted."
}
