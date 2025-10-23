//
//  WeeklyOverviewView.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 20/10/2025.
//

import SwiftUI
import Foundation


struct WeeklyOverviewView: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                .fill(Color(OVERVIEW_BACKGROUND_COLOUR))
            
            Text("Weekly Overview")
        }
        .frame(maxHeight: 200)
        .padding(EdgeInsets(top: 20, leading: LEFT_RIGHT_MARGIN, bottom: 20, trailing: LEFT_RIGHT_MARGIN))
    }
    
}
