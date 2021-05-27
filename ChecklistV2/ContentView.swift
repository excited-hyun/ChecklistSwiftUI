//
//  ContentView.swift
//  ChecklistV2
//
//  Created by 신나현 on 2021/05/27.
//

import SwiftUI

struct ContentView: View {
    @State var checklistItems = ["Walk the dog","Brush my teeth", "Learn iOS development", "Soccer practice", "Eat ice cream"]
    
    var body: some View {
        NavigationView{
            List {
                ForEach(checklistItems, id: \.self){
                    item in Text(item)
                       // .onTapGesture {
                         //   let indexesToRemove = IndexSet(integersIn:  0...4)
                            //print("indexesToRemove=", indexesToRemove)
                         //   self.checklistItems.remove(atOffsets: indexesToRemove)
                            //self.checklistItems.append(item)
                        //    self.printChecklistContent()
                      //  }
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
