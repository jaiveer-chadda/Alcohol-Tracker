//
//  Logo.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 25/10/2025.
//

import SwiftUI
import Foundation


let LOGO_TEXT_COLOUR: Color = colour.text.highlight


struct LogoView: View {
    var body: some View {
        // placeholder for actual logo
        
        VStack {
            
            HStack {
                
                Image(systemName: "wineglass.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 48)
                    .bold()
                    .padding(.trailing, 5)
                    .padding(.bottom, 2)
                
                Text("AlcTrack")
                    .font(.system(size: 60, weight: .bold))
                
                Spacer()
                
            }
            .foregroundStyle(LOGO_TEXT_COLOUR)
            .padding(.top, 12).padding(.bottom, 8)
            .padding(.leading, 30)
            
//            Capsule()
//                .padding(.horizontal, 30)
//                .frame(height: 2)
//                .padding(.bottom, 12)
//                .foregroundStyle(LOGO_TEXT_COLOUR.exposureAdjust(-2))
            
        }
    }
}
