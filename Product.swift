//
//  Product.swift
//  newPod
//
//  Created by internet on 5/22/15.
//  Copyright (c) 2015 jvm corp. All rights reserved.
//

import UIKit
import ObjectMapper
class Product: Mappable {
    var id:Int?
    var articulo:String!
    var marca:String!
    var precio:String!
    var relacion:String!
    var imagen:String!
    //init(){}
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    // Mappable
    func mapping(map: Map) {
        id    <- map["id"]
        articulo         <- map["articulo"]
        marca      <- map["marca"]
            precio <- map["precio"]
            relacion <- map["relacion"]
         imagen      <- map["imagen"]
    }
}
