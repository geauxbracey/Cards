//
//  CardStore.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

//main data store and single source of truth

import SwiftUI

class CardStore: ObservableObject {
    @Published var cards: [Card] = []
    
    init(defaultData: Bool = false) {
        if defaultData {
            cards = initialCards
        }
    }
    
    func index(for card: Card) -> Int? {
        cards.firstIndex { $0.id == card.id }
    }
    //this method finds the first card in the array that matches the selected card’s id and returns the array index if there is one
}


