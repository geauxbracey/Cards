//
//  SingleCardView.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

struct SingleCardView: View {
   
    @Environment(\.dismiss) var dismiss
    @State private var currentModal: ToolbarSelection?
    //When you tap a button on the bottom bar the button will update this property
    @Binding var card: Card
   
    
    var body: some View {
        NavigationStack{
            CardDetailView(card: $card)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        //places done button at top right of screen
                        Button("Done") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        //places toolbar at bottom of screen
                     BottomToolbar(modal: $currentModal)
                    }
                }
                .modifier(CardToolbar(
                 currentModal: $currentModal,
                 card: $card))
        }
    }
    
    
}

#Preview {
    SingleCardView(card: .constant(initialCards[0]))
    //updates the preview with a binding to the preview data
}
