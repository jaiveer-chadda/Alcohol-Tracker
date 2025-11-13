//
//  DrinkTypeSelection.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 13/11/2025.
//

import SwiftUI
import Foundation


let DRINK_TYPE_IMAGES: [String: String] = [
    "Beer": "mug",
    "Cider": "cup.and.saucer",
    "Wine": "wineglass",
    "Spirits": "drop",
    "Cocktail": "waterbottle",
    "Other": "questionmark.app.dashed"
]

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
    @Binding var selectedDrinkType: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(" Drink Type")
                .font(.title2)
            HStack {
                DrinkOption(drinkType: "Beer", selectedType: $selectedDrinkType)
                DrinkOption(drinkType: "Cider", selectedType: $selectedDrinkType)
                DrinkOption(drinkType: "Wine", selectedType: $selectedDrinkType)
            }
            HStack {
                DrinkOption(drinkType: "Spirits", selectedType: $selectedDrinkType)
                DrinkOption(drinkType: "Cocktail", selectedType: $selectedDrinkType)
                DrinkOption(drinkType: "Other", selectedType: $selectedDrinkType)
            }
        }
        .padding(.top)
    }
}
