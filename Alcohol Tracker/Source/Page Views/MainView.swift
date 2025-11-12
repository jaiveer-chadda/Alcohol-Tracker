//
//  MainView.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 25/10/2025.
//

import SwiftUI
import Foundation


var isShowExtraDetail: Bool = userSettings.displayExtraDetail


func TabLabel(_ title: String, _ icon: String) -> some View {
    Label {
        Text(isShowExtraDetail ? title : "")
    } icon: {
        Image(systemName: icon)
    }
    .environment(\.symbolVariants, .none)
}


struct MainView: View {
    var body: some View {
        TabView {
            
            Tab { /* Overview */
                OverviewPageView()
            } label: { TabLabel("Overview", "sparkle.text.clipboard") }
            
            Tab { /* Calendar */
                defaultPage("cal")
            } label: { TabLabel("Calendar", "calendar") }
            
            Tab { /* Add Drink */
                AddDrinkPage(isShowAddDrinkSheet: .constant(true), source: "MainView")
            } label: { TabLabel("Add Drink", "plus.app") }
            
            Tab { /* Added Drinks (History) */
                HistoryPageView()
            } label: { TabLabel("History", "calendar.day.timeline.left") }
            
            Tab { /* Settings */
                defaultPage("set")
            } label: { TabLabel("Settings", "gear") }
            
        }
            
    }
}


struct defaultPage: View {
    var pageName: String
    
    init(_ pageName: String) {
        self.pageName = pageName
    }
    
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

