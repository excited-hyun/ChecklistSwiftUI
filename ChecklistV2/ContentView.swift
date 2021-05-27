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
                Text(checklistItems[0])
                    .onTapGesture {
                        self.checklistItems[0] = "Take the dog to the vet" }
                Text(checklistItems[1])
                Text(checklistItems[2])
                Text(checklistItems[3])
                Text(checklistItems[4])
            }//End of list
            .navigationBarTitle("CheckList")
        }// End of navigationview
    }//end of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
