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
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView{
            List {
                ForEach(checklist.items){
                    index in
                    RowView(checklistItem: self.$checklist.items[index])
                    
                }//End of ForEach
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
                
            }//End of list
            .navigationBarItems(
                leading: Button(action: { self.newChecklistItemViewIsVisible = true}){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    } //HStack
                }
                ,trailing: EditButton())
            .navigationBarTitle("CheckList", displayMode: .inline)
            //.onAppear(){
              //  self.checklist.printChecklistContent()
            //}
        }// End of navigationview
        .sheet(isPresented: $newChecklistItemViewIsVisible) {
            //Text("New item screen coming soon!")
            NewChecklistItemView(checklist: self.checklist)
        } //display pop up
        .onAppear() {
            print("ChecklistView has appeared!")
        }
        .onDisappear() {
            print("ChecklistView has disappeared!")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) {
            _ in print("willResignActionNotification")
            self.checklist.saveChecklistItem()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) {
            _ in print("didEnterBackgroundNotification")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) {
            _ in print("willEnterForegroundNotification")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) {
            _ in print("didBecomeActiveNotification")
        }
    }//end of body
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
