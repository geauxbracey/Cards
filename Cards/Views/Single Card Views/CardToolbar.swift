//
//  CardToolbar.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//


import SwiftUI

struct CardToolbar: ViewModifier {
 
    @Environment(\.dismiss) var dismiss
    @Binding var currentModal: ToolbarSelection?
    @Binding var card: Card
    @State private var stickerImage: UIImage?
    //receives current card from the parent view and holds current sticker chosen from StickerModal

  func body(content: Content) -> some View {
    content
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") {
            dismiss()
          }
        }
        ToolbarItem(placement: .bottomBar) {
          BottomToolbar(modal: $currentModal)
        }
      }
      .sheet(item: $currentModal) { item in
        switch item {
        case .stickerModal:
            StickerModal(stickerImage: $stickerImage)
             .onDisappear {
             if let stickerImage = stickerImage {
             card.addElement(uiImage: stickerImage)
                 //error popped up at page 459
             }
             stickerImage = nil
             }
        default:
          Text(String(describing: item))
        }
      }
  }
}
