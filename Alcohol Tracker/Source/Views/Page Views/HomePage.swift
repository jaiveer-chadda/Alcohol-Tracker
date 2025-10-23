//
//  HomePage.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 17/10/2025.
//

import SwiftUI

/// To Do:
/// - colours / dark mode
///     - change the main background colour
///     - change the calendar background colour to not be hardcoded
///         - i.e. it's a transparent background instead
///     - change the date label text colours (i.e. M, T, W, etc.) so that they either:
///         - don't turn white when the app is opened on a phone in dark mode
///
///     - do all of that, OR
///         - put the app  in perpetual dark mode, so all colours can be hardcoded
///         - this is a last resort tho tbh - I want it to work in both
///
/// - functionality
///     - basic / set up / clean up
///         - remove the form from the home page
///         - create a new page with the form on it, which the 'add drink' button leads to
///
///     - features
///         - implement basic app functionality with just a pure, design-less form
///         - create a very basic page that lists all of the entires the user's entered
///
///         - then pretty everything up
///             - make a nice gui to put entries into
///             - make a nice gui to display a list of all entries
///             - (the calendar view, etc. can be done later)


struct HomePageView: View {
    var body: some View {
        VStack {
            
            Spacer()
    
            // placeholder for actual logo
            Text("Alcohol Tracker")
                .font(Font.largeTitle.bold())
                .padding(.bottom)
    
            Spacer()
            
            CalendarView(year: CURRENT_YEAR, month: CURRENT_MONTH)
            
            Spacer()
            
            WeeklyOverviewView()
            
            Spacer()
            
            AddDrinkButtonView()
                        
        }
    }
}

#Preview {
    HomePageView()
}
