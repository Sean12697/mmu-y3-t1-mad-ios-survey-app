//
//  dataStruct.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 19/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import Foundation

struct dataStruct : Codable {
    var id:String? = "12345";
    var dob:Date? = Date();
    var q1:Bool? = true;
    var q2a:String? = "NaN";
    var q2b:Int? = 2;
    var q3:Bool? = true;
    var lat:Float? = 0.0;
    var long:Float? = 0.0;
}
