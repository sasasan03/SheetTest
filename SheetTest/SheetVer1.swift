//
//  SheetVer1.swift
//  SheetTest
//
//  Created by sako0602 on 2023/07/26.
//

import SwiftUI

struct SheetVer1: View {
    
    @State private var fruits = [
        Fruit(name: "りんご"),
        Fruit(name: "もも"),
        Fruit(name: "レモン"),
        Fruit(name: "ぶどう")
    ]
    @State private var isSheetPresented = false
    @State private var fruitsIndex =  0
    
    var body: some View {
//        let _ = print("1️⃣",fruitsIndex)
        NavigationStack{
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
        }
    }
}

struct SheetVer1_Previews: PreviewProvider {
    static var previews: some View {
        SheetVer1()
    }
}
