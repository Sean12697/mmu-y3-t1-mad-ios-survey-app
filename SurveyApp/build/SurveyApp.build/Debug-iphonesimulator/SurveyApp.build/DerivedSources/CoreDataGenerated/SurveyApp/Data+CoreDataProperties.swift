//
//  Data+CoreDataProperties.swift
//  
//
//  Created by Yap Moi Hoon on 1/28/19.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Data {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Data> {
        return NSFetchRequest<Data>(entityName: "Data")
    }

    @NSManaged public var id: String?
    @NSManaged public var q1: String?
    @NSManaged public var q2: String?

}
