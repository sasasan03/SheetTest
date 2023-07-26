//
//  ContentView.swift
//  SheetTest
//
//  Created by sako0602 on 2023/07/23.
//

import SwiftUI

struct Fruit: Identifiable {
    let id = UUID()
    var name: String
}

struct ContentView: View {
    
    @State private var fruits = [
        Fruit(name: "りんご"),
        Fruit(name: "もも"),
        Fruit(name: "レモン"),
        Fruit(name: "ぶどう")
    ]
    @State private var isSheetPresented = false
    @State private var fruitsIndex =  0
    @State private var editFruit: Fruit? = nil
    
    var body: some View {
        let _ = print("1️⃣",fruitsIndex)
        NavigationStack{
            //🟦 id: \.selfを付与すると警告は出てこなくなる
//            List(fruits) { fruit in
//                    HStack{
//                        Text(fruit.name)
//                        Spacer()
//                        Button {
//                            editFruit = fruit
//                        } label: {
//                            Image(systemName: "info.circle.fill")
//                        }
//
//                    }
//
//            }
            //MARK: -
            List(fruits.indices, id: \.self) { index in
                    HStack{
                        Text(fruits[index].name)
                        Spacer()
                        Button {
                            print("2️⃣",fruitsIndex)
                            fruitsIndex = index
                            print("3️⃣",fruitsIndex)
                            isSheetPresented = true
                        } label: {
                            Image(systemName: "info.circle.fill")
                        }
                    }
            }
            //MARK: - 引数が『isPresented』
            .sheet(isPresented: $isSheetPresented) {
                let _ = print("🍔isSheetPresented",fruitsIndex)
                SheetView(
                    fruitNewItem: fruits[fruitsIndex].name
                      )
            }
            //MARK: - 引数が『item』
//            .sheet(item: $editFruit) { editFruit in
//                SheetView(
//                    fruitNewItem: editFruit.name
//                )
//            }
            //MARK: -
        }
    }
}

struct SheetView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var fruitNewItem: String
    
    var body: some View {
        NavigationStack{
            HStack{
                Text("名前")
                TextField("", text: $fruitNewItem)
                    .frame(width: 210,height: 50)
                    .border(Color.black)
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
