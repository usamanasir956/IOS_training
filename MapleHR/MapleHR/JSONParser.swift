//
//  JSONParser.swift
//  MapleHR
//
//  Created by Dev on 15/07/2022.
//

import Foundation
import UIKit

protocol Parsable {
    associatedtype Modeling
    associatedtype ParserType: Parser
    
    init(data: ParserType.Byte)
    func get() throws -> Modeling
}

protocol Parser {
    associatedtype Byte: Bytable
    associatedtype ModelType: Objectable
    init()
    func parse(_ to: ModelType.Type, from: Byte) throws -> ModelType
}

protocol Bytable {
}

extension Data: Bytable {
    
}

//we provide Model to which convert
//and converter
//verify that data is same as it acceptable by converter(Parser)
struct Parse<P: Parser>: Parsable{
    typealias Modeling = P.ModelType
    typealias ParserType = P
    
    fileprivate var data: P.Byte
    fileprivate var parser: P
    
    init(data: P.Byte) {
        self.data = data
        self.parser = P.init()
    }
    func get() throws -> P.ModelType {
        return try parser.parse(Modeling.self, from: data)
    }
}


class MyJSONDecoder<M: Model>: JSONDecoder, Parser {
    typealias ModelType = M
    
    typealias Byte = Data
    
    required override init() {
        super.init()
    }
    func parse(_ to: M.Type, from: Data) throws -> M {
        return try decode(to, from: from)
    }
}


struct PNGImageDecoder: Parser {
    typealias ModelType = UIImage
    
    typealias Byte = Data
    func parse(_ to: ModelType.Type, from: Data) throws -> ModelType {
        guard let image = to.init(data: from) else {
            fatalError("Data to Image Error in PNGImageDecorder")
        }
        return image
    }
}

typealias MJSONP_User = Parse<MyJSONDecoder<ApiModel<User>>>
typealias MJSONP_Home = Parse<MyJSONDecoder<ApiModel<Home>>>
typealias PNGP_Image = Parse<PNGImageDecoder>


extension UIImage: Objectable {
    
}


protocol ThreeDable: Objectable {
    init(with: String)
}

struct ThreeD_Renderer {
    
}

struct ThreeDee: ThreeDable {
    init(with: String) {
        
    }
}
struct ThreeD_RendererParser<M: ThreeDable>: Parser {
    typealias Byte = String
    typealias ModelType = M
    
    func parse(_ to: M.Type, from: String) throws -> M {
        return to.init(with: from)
    }
    
}
extension String: Bytable {
    
}
