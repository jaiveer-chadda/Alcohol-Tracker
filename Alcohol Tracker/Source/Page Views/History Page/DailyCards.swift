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
                DailyCard(data: entry)
            }
            .onDelete(perform: dataManager.deleteEntry)
            
        }
        .padding(.vertical)
        .onAppear {
            dataManager.loadEntries()
        }
    }
}


struct DailyCard: View {
    var data: Entry
    
    var body: some View {
        
        let name: String = data.drinkName
        let date_time: Date = data.date
        let volume: Int = data.volume
        let abv: Double = data.abv
        let note: String = data.note
        
        let units: Double = getUnits(abv: abv, volume_ml: volume)
        
        let formattedDate: String = dateFormatter.string(from: date_time)
        let formattedTime: String = timeFormatter.string(from: date_time)
        let relativeTime: String = relativeFormatter.localizedString(for: date_time, relativeTo: Date())
        
        VStack(alignment: .leading, spacing: 20) {
            
            Spacer().frame(height: 0)
            
            
            
//            CardTitle(drinkName: data.drinkName, date: data.date)
            HStack {
                Text(name != "none_given" ? name : "Drink").lineLimit(0)
                Spacer()
                Text(formattedDate)
            }
            .font(.system(size: 22, weight: .medium))
            
            Capsule()
                .frame(height: 1)
                .opacity(0.4)
            
            HStack {
                Text(formattedTime)
                Spacer()
                Text("(\(relativeTime))")
            }
            
            HStack {
                Text("\(volume)ml of \(String(format: "%.1f", abv))% drink")
                Spacer()
                Text("(\(String(format: "%.1f", units)) units)")
            }
            
            if note != "none_given" {
                Capsule()
                    .frame(height: 1)
                    .opacity(0.1)
                
                Text(note)
                
            }
            
            
            
            
            Spacer().frame(height: 0)
        }
        .padding(.horizontal)
        .background(colour.background.secondary)
        .cornerRadius(20)
    }
}
