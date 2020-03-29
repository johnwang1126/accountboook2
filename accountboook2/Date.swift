//
//  Date.swift
//  accountboook2
//
//  Created by 王天诚 on 2020/3/29.
//  Copyright © 2020 wtc. All rights reserved.
//

import Foundation
var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US")
    formatter.dateFormat = " yy/MM/dd"
    return formatter
}
    
extension Date {
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }

    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
}
