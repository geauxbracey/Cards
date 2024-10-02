//
//  CardElementView.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

struct CardElementView: View {
    let element: CardElement
    
    var body: some View {
        if let element = element as? ImageElement {
            ImageElementView(element: element)
        }
        if let element = element as? TextElement {
            TextElementView(element: element)
        }
    }
}
//finds out whether element is image or text depending on type

struct ImageElementView: View {
    let element: ImageElement
    
    var body: some View {
        element.image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
//uses stored image as the view

struct TextElementView: View {
    let element: TextElement
    
    var body: some View {
        if !element.text.isEmpty {
            Text(element.text)
                .font(.custom(element.textFont, size: 200))
                .foregroundColor(element.textColor)
                //.scalableText()
        }
    }
}
//uses stored text, color, and font

#Preview {
    CardElementView(element: initialElements[0])
}
