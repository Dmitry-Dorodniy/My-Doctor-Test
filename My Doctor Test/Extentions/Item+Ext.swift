//
//  Item + Ext.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 30.10.2024.
//

import Foundation
import CoreData

extension Item {
    
//    Request
    static func fetch() -> NSFetchRequest<Item> {
        let request = NSFetchRequest<Item>(entityName: "Item")
        
        request.predicate = NSPredicate.all
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Item.timestamp_, ascending: true)]
        return request
        
    }
    
    // Syntax Sugar
    var timestamp: Date {
        get { timestamp_ ?? Date() }
        set { timestamp_ = newValue }
    }
}
