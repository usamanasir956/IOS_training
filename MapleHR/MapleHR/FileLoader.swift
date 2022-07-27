//
//  FileLoader.swift
//  MapleHR
//
//  Created by Dev on 15/07/2022.
//

import Foundation

protocol FileTypable {
    var name: String {get}
    var ext: String {get}
}


enum DataFormate: FileTypable {
    case json(String), xml(String)
    
    var name: String {
        switch self {
        case .json(let string):
            return "\(string)"
        case .xml(let string):
            return "\(string)"
        }
    }
    var ext: String {
        switch self {
        case .json(_):
            return "json"
        case .xml(_):
            return "xml"
        }
    }
}

enum DataImage: FileTypable {
    case png(String), jpeg(String)
    
    var name: String {
        switch self {
        case .png(let string):
            return "\(string)"
        case .jpeg(let string):
            return "\(string)"
        }
    }
    var ext: String {
        switch self {
        case .png(_):
            return "png"
        case .jpeg(_):
            return "jpeg"
        }
    }
}

struct FileLoader<F: FileTypable> {
    func load(type: F) -> Data? {
        guard let url = Bundle.main.url(forResource: type.name, withExtension: type.ext) else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
}
