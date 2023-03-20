//
//  ContentView.swift
//  iDine
//
//  Created by Michael Sweeney on 1/25/23.
//

import SwiftUI

struct ContentView: View {
    
    let menuSection = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menuSection) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
