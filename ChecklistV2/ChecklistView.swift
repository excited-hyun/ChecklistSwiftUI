//
//  ContentView.swift
//  ChecklistV2
//
//  Created by 신나현 on 2021/05/27.
//

import SwiftUI

struct ChecklistView: View {
    //@State var checklist.checklistItems = ["Walk the dog","Brush my teeth", "Learn iOS development", "Soccer practice", "Eat ice cream"]
    @ObservedObject var checklist = Checklist()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(checklist.items){
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
                        if let matchingIndex = self.checklist.items.firstIndex(where: {
                            $0.id == checklistItem.id
                        }){
                            self.checklist.items[matchingIndex].isChecked.toggle()
                        }
                        self.checklist.printChecklistContent()
                    }
                    
                }//End of ForEach
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
                
            }//End of list
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("CheckList")
            .onAppear(){
                self.checklist.printChecklistContent()
            }
        }// End of navigationview
    }//end of body
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
