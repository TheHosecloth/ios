//
//  TrackMapping+CoreDataProperties.swift
//  Playlist
//
//  Created by Marc Hosecloth on 4/21/17.
//  Copyright © 2017 Marc Hosecloth. All rights reserved.
//

import Foundation
import CoreData


extension TrackMapping {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrackMapping> {
        return NSFetchRequest<TrackMapping>(entityName: "TrackMapping");
    }

    @NSManaged public var name: String?
    @NSManaged public var path: String?

}
