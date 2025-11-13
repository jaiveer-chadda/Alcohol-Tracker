//
//  LayoutViews.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 13/11/2025.
//

import SwiftUI
import Foundation


struct Separator: View {
    var opacity: Double
    
    var body: some View {
        Capsule()
            .frame(height: 1)
            .opacity(opacity)
    }
}
