//
//  Date + Ext.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 30.10.2024.
//

import Foundation

extension Date {
    /// Форматирование даты в формате \месяц ГГГГ г.\
    func formattedMonthYYYYRus() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "LLLL yyyy 'г.'"
            dateFormatter.locale = Locale(identifier: "ru_RU")
            return dateFormatter.string(from: self)
        }
}
