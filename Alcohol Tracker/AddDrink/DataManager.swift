//
//  DataManager.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 20/10/2025.
//

import SwiftUI
import Combine
import Foundation


struct Entry: Codable, Identifiable {
    let id: UUID
    var name: String
//    var date: Date
    var value1: Int
}


class DataManager: ObservableObject {
    @Published var entries: [Entry] = []
    private let fileName = "entries.json"
    
    init() {
        loadEntries()
        print("Documents directory:", getFileURL().path)
    }
    
    func addEntry(_ entry: Entry) {
        entries.append(entry)
        saveEntries()
    }
    
    func deleteEntry(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
        saveEntries()
    }
    
    private func getFileURL() -> URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documents.appendingPathComponent(fileName)
    }
    
    func saveEntries() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let data = try? encoder.encode(entries) {
            try? data.write(to: getFileURL())
        }
    }
    
    func loadEntries() {
        let url = getFileURL()
        guard let data = try? Data(contentsOf: url) else { return }
        let decoder = JSONDecoder()
        if let decoded = try? decoder.decode([Entry].self, from: data) {
            entries = decoded
        }
    }
    
    
}


struct AddDrinkFormView: View {
    @StateObject private var dataManager = DataManager()
    @State private var name = ""
    @State private var value1 = ""
//    @State private var value2 = ""
//    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Name", text: $name)
//                    DatePicker("Date", selection: $date)
                    TextField("Value 1", text: $value1)
                        .keyboardType(.decimalPad)
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
            }
        }
    }
}



