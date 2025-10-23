//
//  CalendarConsts.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 18/10/2025.
//

import Foundation

let MAX_WEEKS_IN_MONTH: Int = 6
let DAYS_IN_WEEK: Int = 7

let EMPTY_CALENDAR_ROW: [Int] = [0,0,0,0,0,0,0]

let DAYS_OF_THE_WEEK: [String] = ["M","T","W","T","F","S","S"]

let CURRENT_DATE = Date()
let CALENDAR = Calendar.current

let CURRENT_YEAR = CALENDAR.component(.year, from: CURRENT_DATE)
let CURRENT_MONTH = CALENDAR.component(.month, from: CURRENT_DATE)
let CURRENT_DAY = CALENDAR.component(.day, from: CURRENT_DATE)



let INTERNAL_CALENDAR_MARGIN_HOR: CGFloat = 25.0
let INTERNAL_CALENDAR_MARGIN_VER: CGFloat = 30.0
let GAP_BETWEEN_DAYS_AND_NUMS: CGFloat = 10.0

let CAL_MARGIN_END: CGFloat = INTERNAL_CALENDAR_MARGIN_VER+GAP_BETWEEN_DAYS_AND_NUMS/2
