//
//  Colours.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 17/10/2025.
//

import SwiftUI


// temp until I figure out a way to automate it
let DRINK_COLOURS: [Color] = [
    Color(UIColor(0, 107, 61)),
    Color(UIColor(99, 151, 84)),
    Color(UIColor(123, 182, 98)),
    Color(UIColor(255, 211, 1)),
    Color(UIColor(224, 60, 50)),
    Color(UIColor(214, 31, 31))
]


struct AppColours {
    
    struct Accent {
        let primary: Color = .accentColor
        let secondary: Color = .accentSecondary
        let contrast: Color = .accentContrast
    }
    let accent = Accent()
    
    
    struct Background {
        let primary: Color = .backgroundPrimary
        let secondary: Color = .backgroundSecondary
        let tertiary: Color = .backgroundTertiary
    }
    let background = Background()
    
    
    struct Text {
        let primary: Color = .textPrimary
        let contrast: Color = .textContrast
    }
    let text = Text()
        
}

let colour: AppColours = AppColours()
