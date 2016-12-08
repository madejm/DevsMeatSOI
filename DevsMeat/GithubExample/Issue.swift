//
//  Issue.swift
//  LearnRxSwift
//
//  Created by Piotr on 29/11/2016.
//  Copyright © 2016 Piotr Więcaszek. All rights reserved.
//

import Mapper

struct Issue: Mappable {
    
    let identifier: Int
    let number: Int
    let title: String
    let body: String
    
    init(map: Mapper) throws {
        try identifier = map.from("id")
        try number = map.from("number")
        try title = map.from("title")
        try body = map.from("body")
    }
}
