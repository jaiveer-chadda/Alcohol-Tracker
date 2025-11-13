//
//  VolumeSelection.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 13/11/2025.
//

import SwiftUI
import Foundation

let VOLUME_TYPE_IMAGES: [String: String] = [
    "Pint": "mug.fill",
    "Half Pint": "mug",
    "Bottle": "mug",
    "Can": "mug",
    "Small Can": "mug",
    "Custom": "questionmark.app.dashed"
]

struct VolumeOption: View {
    var volumeType: String
    
    @Binding var selectedVolume: String
    private var isSelected: Bool { selectedVolume == volumeType }
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundStyle(isSelected ? SELECTED_BG_COLOUR : ELEMENT_BG_COLOUR)
            VStack {
                Image(systemName: VOLUME_TYPE_IMAGES[volumeType] ?? "questionmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 25)
                    .padding(.top, 2)
                Spacer()
                Text(volumeType)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 2)
            }
            .padding()
        }
        .frame(height: 100)
        .onTapGesture { selectedVolume = volumeType }
    }
}


struct VolumeSelection: View {
    @Binding var selectedVolume: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(" Volume")
                .font(.title2)
            HStack {
                VolumeOption(volumeType: "Pint", selectedVolume: $selectedVolume)
                VolumeOption(volumeType: "Half Pint", selectedVolume: $selectedVolume)
                VolumeOption(volumeType: "Bottle", selectedVolume: $selectedVolume)
            }
            HStack {
                VolumeOption(volumeType: "Can", selectedVolume: $selectedVolume)
                VolumeOption(volumeType: "Small Can", selectedVolume: $selectedVolume)
                VolumeOption(volumeType: "Custom", selectedVolume: $selectedVolume)
            }
        }
    }
}
