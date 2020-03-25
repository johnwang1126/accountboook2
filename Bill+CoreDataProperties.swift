//
//  Bill+CoreDataProperties.swift
//  accountboook2
//
//  Created by 王天诚 on 2020/3/24.
//  Copyright © 2020 wtc. All rights reserved.
//
//

import Foundation
import CoreData


extension Bill {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bill> {
        return NSFetchRequest<Bill>(entityName: "Bill")
    }

    @NSManaged public var name: String?
    @NSManaged public var info: String?
    @NSManaged public var amount: Double
    @NSManaged public var date: Date?
    @NSManaged public var imagename: String?

}
