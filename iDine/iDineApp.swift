//
//  iDineApp.swift
//  iDine
//
//  Created by Michael Sweeney on 1/25/23.
//

import SwiftUI

@main
struct iDineApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
