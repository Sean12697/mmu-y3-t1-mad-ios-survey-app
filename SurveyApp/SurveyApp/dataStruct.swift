//
//  dataStruct.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 19/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import Foundation

struct dataStruct : Codable {
    var id:String?
    var dob:Date?
    var q1:Bool?
    var q2a:String?
    var q2b:Int?
    var q3:Bool?
}
