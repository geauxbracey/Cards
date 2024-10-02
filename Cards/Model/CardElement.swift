//
//  CardElement.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//


//this file describes the card's elements

import SwiftUI

protocol CardElement {
    var id: UUID { get }
    var transform: Transform { get set }
    //creates a blueprint containing each card element type will have unique id and transform
    
    
}

extension CardElement {
    func index(in array: [CardElement]) -> Int? {
        array.firstIndex { $0.id == id }
    }
}

struct ImageElement: CardElement {
 let id = UUID()
 var transform = Transform()
    var image: Image {
     Image(
     uiImage: uiImage ??
     UIImage(named: "error-image") ??
     UIImage())
    }
    var uiImage: UIImage?
}

struct TextElement: CardElement {
    let id = UUID()
    var transform = Transform()
    var text = ""
    var textColor = Color.black
    var textFont = "Gill Sans"
}
