//
//  HomePage.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 17/10/2025.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            CalendarView(year: CURRENT_YEAR, month: CURRENT_MONTH)

            Spacer()
            
//            WeeklyOverviewView()
            
            Spacer()
            
            AddDrinkButtonView()
            
            Spacer()
                        
        }
        
        AddDrinkFormView()
        
    }
}

#Preview {
    HomePage()
}
