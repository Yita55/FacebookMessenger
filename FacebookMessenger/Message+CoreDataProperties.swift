//
//  Message+CoreDataProperties.swift
//  FacebookMessenger
//
//  Created by James Rochabrun on 2/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var text: String?
    @NSManaged public var friend: Friend?

}
