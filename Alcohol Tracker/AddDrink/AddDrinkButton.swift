//
//  AddDrinkButton.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 20/10/2025.
//

import SwiftUI
import Foundation


struct AddDrinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
//            .padding()
            .font(Font.system(size: 40, weight: .bold))
            .background(Color(ADD_DRINK_BUTTON_COLOUR))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}


struct AddDrinkButtonView: View {
    var body: some View {
        
        Button {
            // Action
        } label: {
            Text("Add Drink")
                .frame(width: 300, height: 80)
        }
        .buttonStyle(AddDrinkButtonStyle())


    }
}
