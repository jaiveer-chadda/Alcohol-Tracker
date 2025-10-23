//
//  CalendarInit.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 18/10/2025.
//

import SwiftUI
import Foundation


var calendarMatrix: [[Int]] = []



func daysIn(month: Int, year: Int) -> Int {
    var dateComponents = DateComponents(year: year, month:month)
    dateComponents.year = year
    dateComponents.month = month
    
    let calendar = Calendar(identifier: .gregorian)
    
    if let date = calendar.date(from: dateComponents),
       let range = calendar.range(of: .day, in: .month, for: date) {
        return range.count
    }
    
    return 0
}


func getDayOfWeek(year: Int, month: Int, day: Int) -> Int {
    /*
     Return the day of the week of the given date.
     With 0 representing Monday, and 6 representing Sunday.
     */
    
    let DATE_COMPONENTS: DateComponents = DateComponents(
        year: year,
        month: month,
        day: day
    )
    let GIVEN_DATE: Date? = CALENDAR.date(from: DATE_COMPONENTS)
    
    let DAY_OF_WEEK_SUN_1: Int? = CALENDAR.dateComponents([.weekday], from: GIVEN_DATE!).weekday
    let DAY_OF_WEEK_MON_0: Int? = (DAY_OF_WEEK_SUN_1!+5)%DAYS_IN_WEEK
    
    return DAY_OF_WEEK_MON_0 ?? -1
}


func getFirstDayOfMonth(year: Int, month: Int) -> Int {
    /*
     Return the day of the week that the 1st of the given month occurred on.
     With 0 representing Monday, and 6 representing Sunday.
     */
    
    return getDayOfWeek(year: year, month: month, day: 1)
}


func emptyCalendar() -> Void {
    calendarMatrix = []
    for _ in 0...MAX_WEEKS_IN_MONTH-1 {calendarMatrix.append(EMPTY_CALENDAR_ROW)}
}


func populateCalendar(year: Int, month: Int) -> Void {
    emptyCalendar()
    //    print("a")
    
    let FIRST_DAY_OF_MONTH: Int = getFirstDayOfMonth(year: year, month: month)
    let DAYS_IN_MONTH: Int = daysIn(month: month, year: year)
    
    var row: Int = 0
    var column: Int = FIRST_DAY_OF_MONTH-1
    for _ in 0...DAYS_IN_MONTH-1 {
        column += 1
        
        if column >= DAYS_IN_WEEK {
            row += 1
            column = 0
        }
        // I know this looks like magic or insanity, but it's an easy way I calculated to flatten a row and column value into a single number
        print(row, column)
        calendarMatrix[row][column] = (7*row) + column + 1 - FIRST_DAY_OF_MONTH
    }
    
    
    // remove the last line of the calendar if it's completely empty
    if calendarMatrix.last == EMPTY_CALENDAR_ROW {
        calendarMatrix.removeLast()
    }
    
}
