//
//  DrinkEntryForm.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 23/10/2025.
//

import SwiftUI
import Foundation



//let drinkTypeOptions = ["Beer", "Ale", "Mixed Drink", "Shot", "Wine", "Other"]

let ELEMENT_BG_COLOUR: Color = Color(.black).opacity(0.3)
let SELECTED_BG_COLOUR: Color = Color(.white).opacity(0.1)


struct FormEntryStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(ELEMENT_BG_COLOUR)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(colour.accent.primary, lineWidth:2)
            )
    }
}


struct DrinkEntryForm: View {
    @Binding var isShowAddDrinkSheet: Bool
    
    @StateObject private var dataManager = DataManager()
    @State private var drinkName = ""
    @State private var volume = ""
    @State private var ABV = ""
    @State private var note = ""
    
    @State private var selectedDrinkType: String = "Other"
    @State private var selectedVolume: String = "0"
    
    func resetForm() {
        drinkName = ""
        volume = ""
        ABV = ""
        note = ""
    }
    
    var body: some View {
        ScrollView { // temp
            VStack {
                
                DrinkTypeSelection(selectedDrinkType: $selectedDrinkType)
                Separator(opacity: 0.25).padding()
                
                VolumeSelection(selectedVolume: $selectedVolume)
                Separator(opacity: 0.25).padding()
                
                
                TextField("Alcohol Volume", text: $volume)
                    .keyboardType(.numberPad)
                    .textFieldStyle(FormEntryStyle())
                TextField("ABV", text: $ABV)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(FormEntryStyle())
                TextField("Drink Name (optional)", text: $drinkName)
                    .textFieldStyle(FormEntryStyle())
                TextField("Note (optional)", text: $note, axis: .vertical)
                    .multilineTextAlignment(strategy: .writingDirectionBased)
                    .frame(height: 100, alignment: .topLeading)
                    .textFieldStyle(FormEntryStyle())
                
                
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
                    isShowAddDrinkSheet = false
                    
                    self.resetForm()
                    
                }
                .disabled(volume.isEmpty || ABV.isEmpty)
            }
            //        .foregroundStyle(.black)
            .padding(.horizontal)
        }
             
    }
}

