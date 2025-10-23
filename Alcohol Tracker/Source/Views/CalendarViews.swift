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
                    //      (waiting until there's actual data to display)
                    .foregroundStyle(day <= CURRENT_DAY ? DRINK_COLOURS[Int.random(in: 0...DRINK_COLOURS.count-1)] : CALENDAR_BACKGROUND_COLOUR)
                    .aspectRatio(1, contentMode: .fill) // there's something weird going on with this aspect ratio - may have to change it later
                
                /* Highlight today's date with a circle around it */
                if day == CURRENT_DAY {
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundStyle(TODAY_BORDER_COLOUR)
                }
                
                
                    
                Text(String(day))
                    .foregroundStyle(day <= CURRENT_DAY ? .black : NORMAL_DAY_COLOUR)
                
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
        
        ZStack {
            
            RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                .fill(Color(CALENDAR_BACKGROUND_COLOUR))
                
            VStack {

                /* Days of the week labels */
                DaysOfWeekLabelsView()
                    .padding(.top, INTERNAL_CALENDAR_MARGIN_VER)
                    .padding(.bottom, GAP_BETWEEN_DAYS_AND_NUMS)
                
                /* Actual dates in the month */
                MonthDatesView(year: year, month: month)
                    .padding(.bottom, INTERNAL_CALENDAR_MARGIN_VER)
            }
            
        }
        .frame(height: 250)
        .padding(EdgeInsets(top: CAL_MARGIN_END, leading: LEFT_RIGHT_MARGIN, bottom: CAL_MARGIN_END, trailing: LEFT_RIGHT_MARGIN))
        
    }
}
