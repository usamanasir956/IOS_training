//
//  Api.swift
//  MapleHR
//
//  Created by Dev on 15/07/2022.
//

import Foundation
import UIKit

struct Api {
    func login(email: String, password: String, callback: (ApiModel<User>?, Error?)->()) {
        guard let loadedData = FileLoader<DataFormate>().load(type: .json("login_\(email)")) else {
            _ = callback(nil, MapleError(localizedDescription: "Invalid Email"))
            return
        }
        do {
            let model = try MJSONP_User.init(data: loadedData).get()
            _ = callback(model, nil)
        }
        catch let err {
            _ = callback(nil, err)
        }
        
    }
    func home(callback: (ApiModel<Home>?, Error?)->()) {
        guard let loadedData = FileLoader<DataFormate>().load(type: .json("home")) else {
            _ = callback(nil, MapleError(localizedDescription: "Invalid Email"))
            return
        }
        do {
            let model = try MJSONP_Home.init(data: loadedData).get()
            _ = callback(model, nil)
        }
        catch let err {
            _ = callback(nil, err)
        }
    }
    
    func abc() {
        let imageData = FileLoader<DataImage>().load(type: .png("google"))!
//        let image = try! PNGP_Image(data: imageData).get()
//        image
    }
}


struct MapleError: Error {
    var localizedDescription: String
}
