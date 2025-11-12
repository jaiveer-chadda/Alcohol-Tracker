//
//  DailyCards.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 12/11/2025.
//

import SwiftUI
import Foundation

// Formatters
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

        let timeString = timeFormatter.string(from: time)
        let relativeString = relativeFormatter.localizedString(for: time, relativeTo: Date())

        let baseRows: [(title: String, value: String, isNote: Bool)] = [
            ("Time", "\(timeString) (\(relativeString))", false),
            ("Volume", "\(volume) ml", false),
            ("ABV", "\(String(format: "%.1f", abv))%", false)
        ]
        let includeNote = note != "none_given" && !note.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let rows: [(title: String, value: String, isNote: Bool)] = includeNote
            ? baseRows + [("Note", note, true)]
            : baseRows

        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(rows.enumerated()), id: \.offset) { _, row in
                HStack {
                    Text(row.title)
                    Spacer()
                    let valueText = Text(row.value)
                    (row.isNote ? valueText.italic() : valueText)
                }
                .font(.system(size: 16, weight: .regular))
                .padding(.vertical)
            }
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

