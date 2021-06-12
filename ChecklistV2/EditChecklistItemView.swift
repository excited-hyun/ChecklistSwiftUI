//
//  EditChecklistItemView.swift
//  ChecklistV2
//
//  Created by 신나현 on 2021/06/03.
//

import SwiftUI

struct EditChecklistItemView: View {
    
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        Form{
            TextField("Name", text: $checklistItem.name)
            Toggle("Completed:", isOn: $checklistItem.isChecked)
        }// end of Form
    }//end of body
}

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(ChecklistItem(name:"Sample item")))
    }
}
