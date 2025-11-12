//
//  HisstoryPage.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 25/10/2025.
//

import SwiftUI
import Foundation


struct HistoryTitleView: View {
    var body: some View {
        // Date & Overview
        HStack {
            Text("February 2021")
            Spacer()
            Text("$527")
        }
        .font(.system(size: 30, weight: .medium))
        .padding(.top)
    }
}



struct HistoryPageView: View {

    var body: some View {
        ScrollView {
            VStack {
                
                HistoryTitleView()
                
                BarGraphView()
                
                DailyCardsView()
                
                
            } // End Vstack
            .padding(.horizontal, LEFT_RIGHT_MARGIN)
        } // End ScrollView
        .background(colour.background.primary)
        
    }
}




//            List {
//                ForEach(dataManager.entries) { entry in
//                    VStack(alignment: .leading) {
//                        if entry.drinkName != "none_given" {
//                            Text("\(Text("Name:").bold())\t\t\(entry.drinkName)")
//                            Text("")
//                        }
//                        Text("Date:\t\t\(Text(entry.date, style: .date))")
//                        Text("Time:\t\t\(Text(entry.date, style: .time))  (\(Text(entry.date, style: .relative)) ago)")
//                        Text("")
//                        Text("Volume:\t\(entry.volume) ml")
//                        Text("ABV:\t\t\(String(format: "%.1f", entry.abv))%")
//                        if entry.note != "none_given" {
//                            Text("")
//                            Text("Note:\t\t\(Text(entry.note).italic())")
//                        }
//
//                    }
//                }
//                .onDelete(perform: dataManager.deleteEntry)
//            }
