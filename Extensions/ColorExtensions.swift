//
//  ColorExtensions.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import Foundation
import SwiftUI

extension Color {
        static let colors: [Color] = [
            .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple
        ]
    
        static func random() -> Color {
            //this method returns random element from colors array; if colors array is empty returns black
            colors.randomElement() ?? .black
        }
    
}
//array of colors
