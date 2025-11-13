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

let VOLUME_NAMES: [String: Int] = [
    "Pint": 568,
    "Half Pint": 284,
    "Bottle": 330,
    "Can": 440,
    "Small Can": 355,
    "Custom": -1
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
                VStack {
                    if volumeType == "Custom" { Spacer() }
                    Text(volumeType)
                        .multilineTextAlignment(.center)
                    
                    if volumeType != "Custom" {
                        Text("\(String(VOLUME_NAMES[volumeType] ?? -1))ml")
                            .font(.subheadline)
                            .foregroundStyle(.primary.opacity(0.5))
                    } else {
                        Spacer()
                    }
                }
            }
            .padding()
        }
        .frame(minHeight: 100)
        .onTapGesture { selectedVolume = volumeType }
    }
}


struct VolumeSelection: View {
    @Binding var selectedVolume: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
//            Text(" Volume")
//                .font(.title2)
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
