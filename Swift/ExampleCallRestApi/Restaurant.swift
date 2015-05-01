//
//  Restaurant.swift
//  newPod
//
//  Created by test on 4/28/15.
//  Copyright (c) 2015 jvm corp. All rights reserved.
//

import UIKit
import ObjectMapper
class Restaurant: Mappable {
    // optional ?
    // nullable !
    var name:String?
    var latitud:String!
    var longtitud:String!
    //init(){}
    
    required init?(_ map: Map) {
        mapping(map)
    }

    // Mappable
    func mapping(map: Map) {
        name    <- map["name"]
        latitud         <- map["latitud"]
        longtitud      <- map["logititud"]
        
    }
}
