//
//  CardThumbnail.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

struct CardThumbnail: View {
    
    let card: Card
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(card.backgroundColor)
            .frame(
             width: Settings.thumbnailSize.width,
             height: Settings.thumbnailSize.height)
    }
}

#Preview {
    CardThumbnail(card: initialCards[0])
}
