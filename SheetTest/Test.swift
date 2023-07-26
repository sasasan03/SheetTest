//
//  Test.swift
//  SheetTest
//
//  Created by sako0602 on 2023/07/26.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var name: String
}

struct Test: View {
    
    @State var items = [
        Item(name: "あ"),
        Item(name: "い"),
        Item(name: "う")
    ]
    @State var index = 0
    @State var isPresented = false
    
    var body: some View {
        NavigationStack{
            List(items.indices){ index in
                HStack{
                    Text(items[index].name)
                    Button {
                        self.index = index
                        isPresented = true
                    } label: {
                        Image(systemName: "info")
                    }

                }
            }
            .sheet(isPresented: $isPresented) {
                sheetView(text: items[index].name)
            }
        }
        
    }
}

struct sheetView: View {
    
    @State var text: String
    
    var body: some View {
        TextField("", text: $text)
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
