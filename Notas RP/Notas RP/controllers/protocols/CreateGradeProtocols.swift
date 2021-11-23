//
//  CreateGradeProtocols.swift
//  Notas RP
//
//  Created by Rafael Augusto Mesquita on 23/11/21.
//

import Foundation

protocol CreateGradeDelegate: AnyObject {
    func saveNewGrade(_ newGrade: Grade)
}
