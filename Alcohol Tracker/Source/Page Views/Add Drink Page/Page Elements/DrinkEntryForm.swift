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

let DRINK_TYPE_IMAGES: [String: String] = [
    "Beer": "mug",
    "Cider": "cup.and.saucer",
    "Wine": "wineglass",
    "Spirits": "drop",
    "Cocktail": "waterbottle",
    "Other": "questionmark.app.dashed"
]


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


struct DrinkOption: View {
    var drinkType: String
    
    @Binding var selectedType: String
    private var isSelected: Bool { selectedType == drinkType }
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundStyle(isSelected ? SELECTED_BG_COLOUR : ELEMENT_BG_COLOUR)
            VStack {
                Image(systemName: DRINK_TYPE_IMAGES[drinkType] ?? "wineglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 25)
                    .padding(.top, 2)
                Spacer()
                Text(drinkType)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 2)
            }
            .padding()
        }
        .frame(height: 100)
        .onTapGesture { selectedType = drinkType }
    }
}


struct DrinkTypeSelection: View {
    @Binding var selectedType: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(" Drink Type")
                .font(.title2)
            HStack {
                DrinkOption(drinkType: "Beer", selectedType: $selectedType)
                DrinkOption(drinkType: "Cider", selectedType: $selectedType)
                DrinkOption(drinkType: "Wine", selectedType: $selectedType)
            }
            HStack {
                DrinkOption(drinkType: "Spirits", selectedType: $selectedType)
                DrinkOption(drinkType: "Cocktail", selectedType: $selectedType)
                DrinkOption(drinkType: "Other", selectedType: $selectedType)
            }
        }
        .padding(.top)
    }
}



struct DrinkEntryForm: View {
    @Binding var isShowAddDrinkSheet: Bool
    
    @StateObject private var dataManager = DataManager()
    @State private var drinkName = ""
    @State private var volume = ""
    @State private var ABV = ""
    @State private var note = ""
    
    @State private var selectedType: String = "Other"
    
    func resetForm() {
        drinkName = ""
        volume = ""
        ABV = ""
        note = ""
    }
    
    var body: some View {
        
        VStack {
            
            DrinkTypeSelection(selectedType: $selectedType)
            
//            Menu {
//                Picker("Option", selection: $selectedOption) {
//                    ForEach(drinkTypeOptions, id: \.self) { option in
//                        Text(option).tag(option)
//                    }
//                }
//            } label: {
//                Text(selectedOption)
//                    .multilineTextAlignment(.leading)
//            }
            
            Separator(opacity: 0.25)
                .padding()
            
            
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

