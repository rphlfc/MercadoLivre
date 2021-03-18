//
//  MenuItem.swift
//  MercadoLivre
//
//  Created by Raphael Cerqueira on 18/03/21.
//

import Foundation

struct MenuItem: Identifiable {
    let id = UUID().uuidString
    let image: String
    let title: String
}
