//
//  ContentView.swift
//  ChecklistV2
//
//  Created by 신나현 on 2021/05/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List {
                Text("Walk the dog")
                Text("Brush my teeth")
                Text("Learn iOS development")
                Text("Soccer practice")
                Text("Eat ice cream")
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
