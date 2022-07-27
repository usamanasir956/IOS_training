//
//  ApiModel.swift
//  MapleHR
//
//  Created by Dev on 19/07/2022.
//

import Foundation

protocol Objectable {
    
}


protocol Model: Codable, Objectable {
    
}

struct ApiModel<D: Model>: Model {
    var success: Bool
    var message: String
    var data: D
}
