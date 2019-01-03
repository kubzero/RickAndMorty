//
//  File.swift
//  rrick
//
//  Created by Andrew on 03/10/2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

import Foundation

struct Heroes: Decodable {
    
    let results: [Hero]
}
struct Hero: Decodable {
    var id: Int
    var name: String
    var url:String
    var species:String
    var image:String
    var gender: String
    var status: String
}
