//
//  DataFormatting.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 12/11/2025.
//

import Foundation


// Formatters
let dateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.timeStyle = .none
    df.dateStyle = .medium
    return df
}()
let timeFormatter: DateFormatter = {
    let df = DateFormatter()
    df.timeStyle = .short
    df.dateStyle = .none
    return df
}()
let relativeFormatter: RelativeDateTimeFormatter = {
    let rf = RelativeDateTimeFormatter()
    rf.unitsStyle = .full
    return rf
}()



func getUnits(abv: Double, volume_ml: Int) -> Double {
    return (abv * Double(volume_ml)) / 1000
}
