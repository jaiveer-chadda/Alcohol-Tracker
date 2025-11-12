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
            
//            ForEach(dataManager.entries) { entry in
//                VStack(alignment: .leading) {
//                    if entry.drinkName != "none_given" {
//                        Text("\(Text("Name:").bold())\t\t\(entry.drinkName)")
//                        Text("")
//                    }
//                    Text("Date:\t\t\(Text(entry.date, style: .date))")
//                    Text("Time:\t\t\(Text(entry.date, style: .time))  (\(Text(entry.date, style: .relative)) ago)")
//                    Text("")
//                    Text("Volume:\t\(entry.volume) ml")
//                    Text("ABV:\t\t\(String(format: "%.1f", entry.abv))%")
//                    if entry.note != "none_given" {
//                        Text("")
//                        Text("Note:\t\t\(Text(entry.note).italic())")
//                    }
//
//                }
//            }
//            .onDelete(perform: dataManager.deleteEntry)
        }
        .padding(.top)
    }
}


struct CardTitle: View {
    var drinkName: String
    var date: Date
    
    var body: some View {
        // Day & Price
        HStack {
//            Text("24 Feb - Thursday")
            if drinkName != "none_given" {
                Text(drinkName)
            } else {
                Text("Drink")
            }
            Spacer()
//            Text("$86")
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
    
//    Text("Time:\t\t\(Text(entry.date, style: .time))  (\(Text(entry.date, style: .relative)) ago)")
//    Text("")
//    Text("Volume:\t\(entry.volume) ml")
//    Text("ABV:\t\t\(String(format: "%.1f", entry.abv))%")
//    if entry.note != "none_given" {
//        Text("")
//        Text("Note:\t\t\(Text(entry.note).italic())")
//    }
    
    var body: some View {
        // Transaction Entries
//        ForEach(0..<5) { _ in // Replace with your data model here
//            DetailLine()
//        }
        
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
        

//        let timeInfo: String = "\(Text(time, style: .time))  (\(Text(time, style: .relative)) ago)"
//        DetailLine(title: "Time", info: timeInfo)
//        let volumeInfo: String = "\(volume) ml"
//        DetailLine(title: "Volume", info: volumeInfo)
//        let abvInfo: String = "\(String(format: "%.1f", abv))%"
//        DetailLine(title: "ABV", info: abvInfo)
//        if note != "none_given" {
//            let noteInfo: String = "\(Text(note).italic())"
//            DetailLine(title: "Note", info: noteInfo)
//        }
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
