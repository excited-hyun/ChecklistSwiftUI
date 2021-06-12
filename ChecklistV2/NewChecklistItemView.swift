//
//  NewChecklistItemView.swift
//  ChecklistV2
//
//  Created by 신나현 on 2021/06/12.
//

import SwiftUI

struct NewChecklistItemView: View {
    
    var checklist: Checklist
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Add new item")
            Form{
                //Text("Enter item name")
                TextField("Enter new item name here", text: $newItemName)
                Button(action: {
                    let newChecklistItem = ChecklistItem(name: self.newItemName)
                    self.checklist.items.append(newChecklistItem)
                    //self.checklist.printChecklistContent()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }// end of HStack
                }//end of Button
                .disabled(newItemName.count == 0)
            } //end of Form
            Text("Swipe down to cancel.")
        }//end of VStack
        .onAppear() {
            print("NewChecklistItemView has appeared!")
        }
        .onDisappear() {
            print("NewChecklistItemView has disappeared!")
        }
    }//end of body
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
