//
//  MainView.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 25/10/2025.
//

import SwiftUI
import Foundation


var isShowExtraDetail: Bool = userSettings.displayExtraDetail



struct MainView: View {
    var body: some View {
        TabView {
            Tab(isShowExtraDetail ? "Overview" : "", systemImage: "platter.2.filled.iphone") {
                OverviewPageView()
            }
            
            Tab(isShowExtraDetail ? "Calendar" : "", systemImage: "calendar") {
                defaultPage(pageName: "Calendar")
            }
            
            Tab(isShowExtraDetail ? "Add Drink" : "", systemImage: "plus") {
                AddDrinkPage(isShowAddButtonView: .constant(true) /* the const is temp */)
            }
            
            
            Tab(isShowExtraDetail ? "Added Drinks" : "", systemImage: "calendar.day.timeline.left") {
                defaultPage(pageName: "Added Drinks")
            }
            
            Tab(isShowExtraDetail ? "Settings" : "", systemImage: "gear") {
                defaultPage(pageName: "Settings")
            }
        }
        .tint(ADD_DRINK_TAB_COLOUR)
        
    }
}


struct defaultPage: View {
    var pageName: String
    
    var body: some View {
        
        ZStack {
            
            Color(MAIN_BACKGROUND_COLOUR)
                .ignoresSafeArea()
                .frame(width: .infinity, height: .infinity)
         
            
            Text(pageName)
            
        }

    }
}


#Preview {
    MainView()
}
