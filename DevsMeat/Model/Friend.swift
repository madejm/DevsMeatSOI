//
//  Friend.swift
//  DevsMeat
//
//  Created by marcin on 12/5/16.
//  Copyright © 2016 SoInteractive. All rights reserved.
//

import Foundation
import ObjectMapper

class Friend: Mappable {
    
    var name: String = ""
    var surname: String = ""
    var gender: String = ""
    var region: String = ""
    var quote: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
        surname <- map["surname"]
        gender <- map["gender"]
        region <- map["region"]
    }
}
