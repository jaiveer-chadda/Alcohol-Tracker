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
            .padding()
            .background(Color(UIColor(143, 109, 196)))
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}


struct AddDrinkButtonView: View {
    var body: some View {
        
        Button {
            // Action
        } label: {
            Text("Add Drink")
                .font(Font.system(size: 40, weight: .bold))
                .frame(width: 300, height: 80)
                .background(Color(UIColor(143, 109, 196)))
                .foregroundColor(.white)
                .cornerRadius(.infinity)
//                .padding(EdgeInsets(top: 50, leading: 0, bottom: 20, trailing: 0))
                .padding()
        }

    }
}
