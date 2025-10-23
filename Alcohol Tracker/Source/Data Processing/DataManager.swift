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
