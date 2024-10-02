//
//  CardsListView.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var store: CardStore
    @State private var selectedCard: Card?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            //creates 10 rectangles to scroll through
            //showIndicators being false gets rid of the scroll bar
            VStack {
                ForEach(store.cards) { card in
                    CardThumbnail(card: card)
                        //passes current card to thumbnail view
                        .onTapGesture {
                            selectedCard = card
                        }
                }
            }
            
        }
        .fullScreenCover(item: $selectedCard) { card in
            if let index = store.index(for: card) {
             SingleCardView(card: $store.cards[index])
            } else {
             fatalError("Unable to locate selected card")
            }
            // works out the array index of the selected card in the data store’s cards array and passes it as a binding to SingleCardView
        }
    }
}

#Preview {
    CardsListView()
        .environmentObject(CardStore(defaultData: true))
}


