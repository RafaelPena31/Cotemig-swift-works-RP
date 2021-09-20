//
//  Product.swift
//  ProductListRP
//
//  Created by Rafael Augusto Mesquita on 20/09/21.
//

public struct Product: Equatable, Decodable {
    let id: String
    let name: String
    let description: String
    let price: String
}
