//
//  NewChecklistItemView.swift
//  ChecklistV2
//
//  Created by 신나현 on 2021/06/12.
//

import SwiftUI

struct NewChecklistItemView: View {
    var body: some View {
        VStack{
            Text("Add new item")
            Form{
                Text("Enter item name")
                Button(action: {}) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }// end of HStack
                }//end of Button
            } //end of List
            Text("Swipe down to cancel.")
        }//end of VStack
    }//end of body
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView()
    }
}
