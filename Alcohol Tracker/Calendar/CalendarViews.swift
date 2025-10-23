//
//  CalendarViews.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 17/10/2025.
//


import SwiftUI
import Foundation


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
                    // this foregroundStyle is temp
                    .foregroundStyle(day <= CURRENT_DAY ? DRINK_COLOURS[Int.random(in: 0...DRINK_COLOURS.count-1)] : CALENDAR_BACKGROUND_COLOUR)
                    .aspectRatio(1, contentMode: .fill) // there's something weird going on with this aspect ratio - may have to change it later
                
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
                Spacer().frame(height: INTERNAL_CALENDAR_MARGIN_VER)

                /* Days of the week labels */
                DaysOfWeekLabelsView()
                Spacer().frame(height: GAP_BETWEEN_DAYS_AND_NUMS)
                
                /* Actual dates in the month */
                MonthDatesView(year: year, month: month)
                Spacer().frame(height: INTERNAL_CALENDAR_MARGIN_VER)
            }
        }
        .cornerRadius(30)
        .frame(maxHeight: 250)
        .padding(EdgeInsets(top: INTERNAL_CALENDAR_MARGIN_VER+20, leading: 20, bottom: 20, trailing: 20))
        
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
