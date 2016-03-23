//
//  Restaurant+CoreDataProperties.swift
//  Food
//
//  Created by Samuelhuang on 22/3/2016.
//  Copyright © 2016年 Samuelhuang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Restaurant {

    @NSManaged var type: String?
    @NSManaged var name: String?
    @NSManaged var location: String?
    @NSManaged var rating: String?
    @NSManaged var isVisited: NSNumber?
    @NSManaged var image: NSData?

}
