//
//  Transform.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//
import Foundation 
import SwiftUI
    struct Transform {
        var size = CGSize(
            width: Settings.defaultElementSize.width,
            height: Settings.defaultElementSize.height)
        var rotation: Angle = .zero
        var offset: CGSize = .zero
}
//defaults for size, rotation, and offset
