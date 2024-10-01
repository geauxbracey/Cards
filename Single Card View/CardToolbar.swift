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
            StickerModal()
        default:
          Text(String(describing: item))
        }
      }
  }
}
