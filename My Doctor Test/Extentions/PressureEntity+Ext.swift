//
//  PressureEntity+Ext.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 30.10.2024.
//

import Foundation
import CoreData

extension PressureEntity {
    //    Request
    static func fetch() -> NSFetchRequest<PressureEntity> {
        let request = NSFetchRequest<PressureEntity>(entityName: "PressureEntity")
        
        request.predicate = NSPredicate.all
        request.sortDescriptors = [NSSortDescriptor(keyPath: \PressureEntity.diastPressure_, ascending: true)]
        return request
    }
    
    // Syntax Sugar
    var diastPressure: String {
        get { diastPressure_ ?? "120" }
        set { diastPressure_ = newValue }
    }
    
    var systPressure: String {
        get { systPressure_ ?? "80" }
        set { systPressure_ = newValue }
    }
}
