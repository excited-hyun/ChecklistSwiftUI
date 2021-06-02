//
//  ContentView.swift
//  ChecklistV2
//
//  Created by 신나현 on 2021/05/27.
//

import SwiftUI

struct ChecklistItem: Identifiable {    //unique한 이름이 필요함
    let id = UUID()     //unidue한 id
    var name: String
    var isChecked: Bool = false
}

struct ContentView: View {
    //@State var checklistItems = ["Walk the dog","Brush my teeth", "Learn iOS development", "Soccer practice", "Eat ice cream"]
    
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog", isChecked: false),
        ChecklistItem(name: "Brush my teeth", isChecked: false),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice", isChecked: false),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]
    
    var body: some View {
        NavigationView{
            List {
                ForEach(checklistItems){
                    checklistItem in
                    HStack{
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" : "⬛️")
                        /*
                        if checklistItem.isChecked {
                            Text("✅")
                        } else {
                            Text("⬛️")
                        }*/
                    }// End of HStack
                    .background(Color.white)    //그 줄의 어딜 눌러도 clickable
                    .onTapGesture {
                        if let matchingIndex = self.checklistItems.firstIndex(where: {
                            $0.id == checklistItem.id
                        }){
                            self.checklistItems[matchingIndex].isChecked.toggle()
                        }
                        self.printChecklistContent()
                    }
                    
                }//End of ForEach
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
                
            }//End of list
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("CheckList")
            .onAppear(){
                self.printChecklistContent()
            }
        }// End of navigationview
    }//end of body
    
    
    //Methed
    func printChecklistContent(){
        for item in checklistItems {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        checklistItems.remove(atOffsets: whichElement)
        printChecklistContent()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContent()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
