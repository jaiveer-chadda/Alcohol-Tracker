//
//  BarGraph.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 12/11/2025.
//

import SwiftUI
import Foundation


struct BarGraphView: View {
    var body: some View {
        // Bar Graph
        HStack {
            HStack(alignment: .bottom, spacing: 2) {
                // Repeated Bars
                ForEach(0..<30) { _ in // Replace with your data model here
                    Capsule(style: .continuous)
                        .foregroundStyle(colour.accent.primary)
                        .frame(height: CGFloat(Int.random(in: 1..<30)*5))
                }
            }
        }
        .padding()
        .background(colour.background.secondary)
        .cornerRadius(20)
    }
}
