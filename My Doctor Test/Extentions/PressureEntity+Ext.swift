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
    var diastPressure: Int16 {
        get { diastPressure_ }
        set { diastPressure_ = newValue }
    }
    
    var systPressure: Int16 {
        get { systPressure_ }
        set { systPressure_ = newValue }
    }
}
