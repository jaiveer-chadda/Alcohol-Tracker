//
//  DrinkEntryForm.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 23/10/2025.
//

import SwiftUI
import Foundation


struct DrinkEntryForm: View {
    @Binding var isShowAddButtonView: Bool
    
    @StateObject private var dataManager = DataManager()
    @State private var drinkName = ""
    @State private var volume = ""
    @State private var ABV = ""
    @State private var note = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Drink Name (optional)", text: $drinkName)
            }
            Section {
                TextField("Volume", text: $volume)
                    .keyboardType(.numberPad)
                TextField("ABV", text: $ABV)
                    .keyboardType(.decimalPad)
            }
            TextField("Note (optional)", text: $note, axis: .vertical)
                .multilineTextAlignment(strategy: .writingDirectionBased)
//                .lineLimit(6)
                .frame(height: 100, alignment: .topLeading)
            
            Section {
                Button("Save Entry") {
                    let newEntry = Entry(
                        id: UUID(),
                        date: CURRENT_DATE,
                        
                        drinkName: drinkName.isEmpty == false ? drinkName : "none_given",
                        volume: Int(volume) ?? -1,
                        abv: Double(ABV) ?? -1.0,
                        note: note.isEmpty == false ? note : "none_given"
                        
                    )
                    dataManager.addEntry(newEntry)
                    isShowAddButtonView = false
                    
                    drinkName = ""
                    volume = ""
                    ABV = ""
                    note = ""
                    
                }
            }
        }
        .scrollContentBackground(.hidden)
             
    }
}

