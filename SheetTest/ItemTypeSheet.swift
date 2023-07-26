//
//  ItemTypeSheet.swift
//  SheetTest
//
//  Created by sako0602 on 2023/07/24.
//

import SwiftUI

struct ItemTypeSheet: View {
    @State private var sheetDetail: InventoryItem?
    
    var body: some View {
        Button("Show Part Details") {
            sheetDetail = InventoryItem(
                id: "0123456789",
                partNumber: "Z-1234A",
                quantity: 100,
                name: "Widget")
        }
        .sheet(item: $sheetDetail,
               onDismiss: didDismiss) { detail in
            VStack(alignment: .leading, spacing: 20) {
                Text("Part Number: \(detail.partNumber)")
                Text("Name: \(detail.name)")
                Text("Quantity On-Hand: \(detail.quantity)")
            }
            .onTapGesture {
                sheetDetail = nil
            }
        }
    }
    
    
    func didDismiss() {
        // Handle the dismissing action.
    }
}
struct InventoryItem: Identifiable {
    var id: String
    let partNumber: String
    let quantity: Int
    let name: String
}

struct ItemTypeSheet_Previews: PreviewProvider {
    static var previews: some View {
        ItemTypeSheet()
    }
}
