//
//  ToolbarSelection.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import Foundation

enum ToolbarSelection: CaseIterable, Identifiable {
    //now able to iterate through the values using ToolbarSelection.allCases
    case photoModal, frameModal, stickerModal, textModal
    
    var id: Int {
        hashValue
        //enum identifier
    }
    //id for identifiable
    
}
