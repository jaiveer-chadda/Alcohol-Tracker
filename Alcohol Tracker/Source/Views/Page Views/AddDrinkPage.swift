//
//  AddDrinkPage.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 23/10/2025.
//

import SwiftUI
import Foundation


let CANCEL_BUTTON_TEXT_COLOUR: Color = colour.accent.primary

struct AddDrinkPageTopBar: View {
    @Binding var isShowAddButtonView: Bool
    
    var body: some View {
        HStack {
            Button {
                isShowAddButtonView.toggle()
            } label: {
                ZStack {
                    Capsule()
                        .foregroundStyle(.black)
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



struct AddDrinkPageView: View {
    @Binding var isShowAddButtonView: Bool
    
    
    var body: some View {
        VStack {
            AddDrinkPageTopBar(isShowAddButtonView: $isShowAddButtonView)
            DrinkEntryForm(isShowAddButtonView: $isShowAddButtonView)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ADD_DRINK_BUTTON_COLOUR.exposureAdjust(-1))
    }
}

#Preview {
    AddDrinkPageView(isShowAddButtonView: .constant(true))
}
