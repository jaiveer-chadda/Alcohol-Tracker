//
//  CalendarSetup.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 17/10/2025.
//

import Foundation
import SwiftUI


let MAX_WEEKS_IN_MONTH: Int = 6
let DAYS_IN_WEEK: Int = 7


let EMPTY_CALENDAR_ROW: [Int] = [0,0,0,0,0,0,0]

let DAYS_OF_THE_WEEK: [String] = ["M","T","W","T","F","S","S"]

let CURRENT_DATE = Date()
let CALENDAR = Calendar.current

let CURRENT_YEAR = CALENDAR.component(.year, from: CURRENT_DATE)
let CURRENT_MONTH = CALENDAR.component(.month, from: CURRENT_DATE)
let CURRENT_DAY = CALENDAR.component(.day, from: CURRENT_DATE)


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



struct DayIconView: View {
    var year: Int
    var month: Int
    var day: Int
    
    var body: some View {
        
        if day==0 {
            Text("")
        } else {
            
            ZStack {
                
                Circle()
                    .foregroundStyle(
                        day <= CURRENT_DAY
                        ?
                        DRINK_COLOURS[Int.random(in: 0...DRINK_COLOURS.count-1)]
                        :
                        CALENDAR_BACKGROUND_COLOUR
                    )
                    .aspectRatio(1, contentMode: .fill)
                
                if day == CURRENT_DAY {
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.black)
                }
                
                Text(String(day))
                    .foregroundStyle(NORMAL_DAY_COLOUR)
            }
            
        }
        
    }
}



struct DaysOfWeekLabelsView: View {
    var body: some View {
        /* Days of the week labels */
        HStack {
            Spacer()
                .frame(maxWidth: INTERNAL_CALENDAR_MARGIN_HOR)
            ForEach(DAYS_OF_THE_WEEK, id: \.self) { item in
                Text(item)
                    .frame(maxWidth: .infinity)
                    .font(.body).bold()
            }
            Spacer()
                .frame(maxWidth: INTERNAL_CALENDAR_MARGIN_HOR)
        }
    }
}



struct MonthDatesView: View {
    var year: Int
    var month: Int
    
    init(year: Int, month: Int) {
        self.year = year
        self.month = month
        populateCalendar(year: year, month: month) // 6, 2025
    }
    
    var body: some View {
        /* Actual dates in the month */
        VStack {
            Spacer()
            ForEach(calendarMatrix, id: \.self) { calendarRow in
                
                HStack {
                    Spacer().frame(maxWidth: INTERNAL_CALENDAR_MARGIN_HOR)
                    
                    /* print each date into its own Text object */
                    ForEach(calendarRow, id: \.self) { calendarColumn in
                        DayIconView(year: self.year, month: self.month, day: calendarColumn)
                    }
                    .frame(maxWidth: .infinity)

                    Spacer().frame(maxWidth: INTERNAL_CALENDAR_MARGIN_HOR)
                }
                if calendarRow != calendarMatrix.last {
                    Spacer()
                }
                
            } /* ForEach */
        } /* VStack */
        
        
    }
}



struct CalendarView: View {
    var year: Int
    var month: Int
    
    var body: some View {
//        print("b")
        
        ZStack {
            Color(CALENDAR_BACKGROUND_COLOUR)
            VStack {
                Spacer().frame(maxHeight: INTERNAL_CALENDAR_MARGIN_VER)

                /* Days of the week labels */
                DaysOfWeekLabelsView()
                Spacer().frame(maxHeight: GAP_BETWEEN_DAYS_AND_NUMS)
                
                /* Actual dates in the month */
                MonthDatesView(year: year, month: month)
                Spacer().frame(maxHeight: INTERNAL_CALENDAR_MARGIN_VER)
            }
        }
        .cornerRadius(30)
        .frame(height: 250)
        .padding()
        .padding(EdgeInsets(top: INTERNAL_CALENDAR_MARGIN_VER, leading: 0, bottom: 0, trailing: 0))
        
    }
}


//populateCalendar(month: 10, year: CURRENT_YEAR)
//
//for row in calendarMatrix {
//    for column in row {
//        var toPrint: String = ""
//        var colStr: String = String(column)
//        
//        if colStr.count==1 {
//            toPrint = " "+colStr
//            
//            if column == 0 {
//                toPrint = "  "
//            }
//        } else {
//            toPrint = colStr
//        }
//        
//        print(toPrint, terminator: "\t")
//    }
//    print()
//}
