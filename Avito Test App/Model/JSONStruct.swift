//
//  JSONStruct.swift
//  Avito Test App
//
//  Created by Георгий iMac on 25.01.2021.
//

import Foundation

struct mainJSON: Decodable {
    var status  : String
    var result  : resultStruct
}

struct resultStruct: Decodable {
    var title               : String
    var actionTitle         : String
    var selectedActionTitle : String
    var list                : listStruct
}

struct listStruct: Decodable {
    var id          : String
    var title       : String
    var description : String
    var icon        : iconStruct
    var price       : String
    var isSelected  : Bool
}

struct iconStruct: Decodable {
    var icon : Dictionary<String, String>
}
