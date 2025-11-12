//
//  DailyCards.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 12/11/2025.
//

import SwiftUI
import Foundation


struct DailyCardsView: View {
    @StateObject private var dataManager = DataManager()
    
    var body: some View {
        // Daily Cards Container
        VStack(spacing: 16) {
            // Daily Cards
            ForEach(dataManager.entries) { entry in // Replace with your data model here
                DailyCard(dataEntry: entry)
            }
            .onDelete(perform: dataManager.deleteEntry)
            
        }
        .padding(.top)
        .onAppear {
            dataManager.loadEntries()
        }
    }
}


struct CardTitle: View {
    var drinkName: String
    var date: Date
    
    var body: some View {
        // Name & Date
        HStack {
            if drinkName != "none_given" {
                Text(drinkName)
            } else {
                Text("Drink")
            }
            Spacer()
            Text(date, style: .date)
        }
        .font(.system(size: 20, weight: .medium))
        .padding(.vertical)
    }
}



//struct DetailLine: View {
//    var title: String
//    var info: String
//    
//    var body: some View {
//        HStack {
//            Text(title)
//            Spacer()
//            Text(info)
////                .lineLimit(0)
//        }
//        .font(.system(size: 16, weight: .regular))
//        .padding(.vertical)
//    }
//}


struct CardDetails: View {
    var time: Date
    var volume: Int
    var abv: Double
    var note: String
    
    
    
    var body: some View {
        // Entries
        HStack {
            Text("Time")
            Spacer()
            Text("\(Text(time, style: .time))  (\(Text(time, style: .relative)) ago)")
        }
        .font(.system(size: 16, weight: .regular))
        .padding(.vertical)
        
        HStack {
            Text("Volume")
            Spacer()
            Text("\(volume) ml")
        }
        .font(.system(size: 16, weight: .regular))
        .padding(.vertical)
        
        HStack {
            Text("ABV")
            Spacer()
            Text("\(String(format: "%.1f", abv))%")
        }
        .font(.system(size: 16, weight: .regular))
        .padding(.vertical)
        if note != "none_given" {
            HStack {
                Text("Note")
                Spacer()
                Text("\(Text(note).italic())")
            }
            .font(.system(size: 16, weight: .regular))
            .padding(.vertical)
        }
        
    }
}


struct DailyCard: View {
    var dataEntry: Entry
    
    
    var body: some View {
        // Daily Card
        VStack(spacing: 0) {
            
            CardTitle(drinkName: dataEntry.drinkName, date: dataEntry.date)
            CardDetails(time: dataEntry.date, volume: dataEntry.volume, abv: dataEntry.abv, note: dataEntry.note)
            
        }
        .padding(.horizontal)
        .background(colour.background.secondary)
        .cornerRadius(20)
    }
}
