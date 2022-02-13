//
//  Extension.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import Foundation
extension Data {
    
    func jsonObject <T:Codable> (ofType type:T.Type) ->T? {
        var typeAny:T?
            do {
                let decoder = JSONDecoder()
                typeAny = try decoder.decode(type, from: self)
            } catch{
                print(error)
            }
        
        return typeAny
    }
}
