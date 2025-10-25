//
//  AddDrinkPage.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 23/10/2025.
//

import SwiftUI
import Foundation


let CANCEL_BUTTON_TEXT_COLOUR: Color = colour.accent.primary
let CANCEL_BUTTON_BACKGROUND_COLOUR: Color = Color(.systemGray6) // 28, 28, 30

let PAGE_BACKGROUND_COLOUR: Color = colour.accent.primary.exposureAdjust(-1)


struct AddDrinkPageTopBar: View {
    @Binding var isShowAddDrinkSheet: Bool
    
    var body: some View {
        HStack {
            Button {
                isShowAddDrinkSheet.toggle()
            } label: {
                ZStack {
                    Capsule()
                        .foregroundStyle(CANCEL_BUTTON_BACKGROUND_COLOUR)
                        .frame(maxWidth: 90, maxHeight: 40)
                    Text("Cancel")
                        .foregroundStyle(CANCEL_BUTTON_TEXT_COLOUR)
                }
                .padding(.leading).padding(.top)
            }
            
            Spacer()
        }
        
    }
}



struct AddDrinkPage: View {
    @Binding var isShowAddDrinkSheet: Bool
    @State private var showTopBar = true
    var source: String = ""
    
    var body: some View {
        
        
        VStack {
            if showTopBar {
                AddDrinkPageTopBar(isShowAddDrinkSheet: $isShowAddDrinkSheet)
            }
            DrinkEntryForm(isShowAddDrinkSheet: $isShowAddDrinkSheet)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(PAGE_BACKGROUND_COLOUR)
        .onAppear {
            switch source {
                case "MainView":
                    showTopBar = false
                default:
                    showTopBar = true
            }
        }
        
        
    }
}

#Preview {
    AddDrinkPage(isShowAddDrinkSheet: .constant(true))
}
