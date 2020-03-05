//
//  Symptom+CoreDataProperties.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//
//

import Foundation
import CoreData


extension Symptom {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Symptom> {
        return NSFetchRequest<Symptom>(entityName: "Symptom")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var instances: NSSet?

    public var wrappedName: String {
        name ?? ""
    }
    
    
    public var instanceArray: [Instance] {
        let set = instances as? Set<Instance> ?? []
        return set.sorted {
            $0.dateTime! < $1.dateTime!
        }
    }
}

// MARK: Generated accessors for instances
extension Symptom {

    @objc(addInstancesObject:)
    @NSManaged public func addToInstances(_ value: Instance)

    @objc(removeInstancesObject:)
    @NSManaged public func removeFromInstances(_ value: Instance)

    @objc(addInstances:)
    @NSManaged public func addToInstances(_ values: NSSet)

    @objc(removeInstances:)
    @NSManaged public func removeFromInstances(_ values: NSSet)

}
