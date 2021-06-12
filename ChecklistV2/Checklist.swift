//
//  Checklist.swift
//  ChecklistV2
//
//  Created by 신나현 on 2021/06/03.
//

import Foundation

class Checklist: ObservableObject {
    
    //initialization
    init() {
        loadChecklistItems()
    }
    /*
    @Published var items = [
        ChecklistItem(name: "Walk the dog", isChecked: false),
        ChecklistItem(name: "Brush my teeth", isChecked: false),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice", isChecked: false),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]*/
    @Published var items: [ChecklistItem] = []

    func printChecklistContent(){
        for item in items {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
        printChecklistContent()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContent()
    }
    
    // Data persistance
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let directory = paths[0]
        print("Documents directory is: \(directory)")
        return directory
    }
    
    func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("Checklist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
    
    //Saving the file
    func saveChecklistItem() {
        print("Saving checklist items")
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            print("Checklist items saved")
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    //Load the file
    func loadChecklistItems() {
        print("Loading checklist items")
        
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([ChecklistItem].self, from: data)
                print("checklist items loaded")
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
}
