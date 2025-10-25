//
//  AddDrinkPage.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 23/10/2025.
//

import SwiftUI
import Foundation


let CANCEL_BUTTON_TEXT_COLOUR: Color = colour.accent.primary
let CANCEL_BUTTON_BACKGROUND_COLOUR: Color = .black

let PAGE_BACKGROUND_COLOUR: Color = colour.accent.primary.exposureAdjust(-1)


struct AddDrinkPageTopBar: View {
    @Binding var isShowAddButtonView: Bool
    
    var body: some View {
        HStack {
            Button {
                isShowAddButtonView.toggle()
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
    @Binding var isShowAddButtonView: Bool
    
    
    var body: some View {
        VStack {
            AddDrinkPageTopBar(isShowAddButtonView: $isShowAddButtonView)
            DrinkEntryForm(isShowAddButtonView: $isShowAddButtonView)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(PAGE_BACKGROUND_COLOUR)
    }
}

#Preview {
    AddDrinkPage(isShowAddButtonView: .constant(true))
}
