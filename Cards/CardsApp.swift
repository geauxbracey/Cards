//
//  CardsApp.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

@main
struct CardsApp: App {
    
    @StateObject var store = CardStore(defaultData: true)
    
    var body: some Scene {
        WindowGroup {
            CardsListView()
                .environmentObject(store)
        }
    }
}
