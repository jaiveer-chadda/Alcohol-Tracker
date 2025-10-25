//
//  AddedDrinksPage.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 25/10/2025.
//

import SwiftUI
import Foundation



struct AddedDrinksPageView: View {
    @StateObject private var dataManager = DataManager()
    
    var body: some View {
        List {
            ForEach(dataManager.entries) { entry in
                VStack(alignment: .leading) {
                    if entry.drinkName != "none_given" {
                        Text("Name:\t\t\(entry.drinkName)")
                    }
                    Text("Date:\t\t\(Text(entry.date, style: .date))")
                    Text("Time:\t\t\(Text(entry.date, style: .time))")
                    Text("Volume:\t\(entry.volume)")
                    if entry.note != "none_given" {
                        Text("Note:\t\t\(entry.note)")
                    }

                }
            }
            .onDelete(perform: dataManager.deleteEntry)
        }
    }
}
