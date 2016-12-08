//
//  Repository.swift
//  LearnRxSwift
//
//  Created by Piotr on 29/11/2016.
//  Copyright © 2016 Piotr Więcaszek. All rights reserved.
//

import Mapper

struct Repository: Mappable {
    
    let identifier: Int
    let language: String
    let name: String
    let fullName: String
    
    init(map: Mapper) throws {
        try identifier = map.from("id")
        try language = map.from("language")
        try name = map.from("name")
        try fullName = map.from("full_name")
    }
}
