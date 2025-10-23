//
//  AddDrinkFormView.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 23/10/2025.
//

import SwiftUI
import Foundation


struct AddDrinkFormView: View {
    @StateObject private var dataManager = DataManager()
    @State private var name = ""
    @State private var value1 = ""
    //    @State private var value2 = ""
    //    @State private var date = Date()
    
    var body: some View {
        //        NavigationView {
        //            VStack {
        Form {
            TextField("Name", text: $name)
            //                    DatePicker("Date", selection: $date)
            TextField("Value 1", text: $value1)
                .keyboardType(.numberPad)
            //                    TextField("Value 2", text: $value2)
            //                        .keyboardType(.decimalPad)
            
            Button("Save Entry") {
                let newEntry = Entry(
                    id: UUID(),
                    name: name,
                    //                            date: date,
                    value1: Int(value1) ?? 0,
                    //                            value2: Double(value2) ?? 0,
                )
                dataManager.addEntry(newEntry)
                name = ""
                value1 = ""
                //                        value2 = ""
            }
        }
        
        //                List {
        //                    ForEach(dataManager.entries) { entry in
        //                        VStack(alignment: .leading) {
        //                            Text(entry.name)
        //                                .italic()
        ////                            Text(entry.date, style: .date)
        //                            Text("Value 1: \(entry.value1)")
        ////                            Text("Value 2: \(entry.value2)")
        //                        }
        //                    }
        //                    .onDelete(perform: dataManager.deleteEntry)
        //                }
        //            }
        //        }
    }
}
