//
//  WeeklyOverviewWidget.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 20/10/2025.
//

import SwiftUI
import Foundation


let OVERVIEW_BACKGROUND_COLOUR: Color = colour.background.tertiary
let PROGRESS_BAR_BACKGROUND_COLOUR: Color = colour.background.tertiary


struct WeeklyOverviewView: View {
    
    var body: some View {
        
        HStack {
            
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                    .fill(Color(OVERVIEW_BACKGROUND_COLOUR))
                
                Text("Weekly Overview")
            }
            
            Capsule()
                .fill(Color(PROGRESS_BAR_BACKGROUND_COLOUR))
                .frame(maxWidth: 50)
                .padding(.leading)
            
        }
        .frame(maxHeight: 220)
        .padding(.horizontal, LEFT_RIGHT_MARGIN)
        .padding(.vertical)
        
    }
    
}
