//
//  ItemDetail.swift
//  iDine
//
//  Created by Michael Sweeney on 2/3/23.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .font(.caption)
                    .background(.black)
                    .foregroundColor(.white)
                    .offset(x: -4, y: -4)
            }
            Text(item.description)
                .padding()
            
            Button("Add to order") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)

            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
