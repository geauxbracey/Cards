//
//  CardsListView.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

struct CardsListView: View {
    @State private var isPresented = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            //creates 10 rectangles to scroll through
            //showIndicators being false gets rid of the scroll bar
            VStack {
                ForEach(0..<10) { _ in
                    CardThumbnail()
                        .onTapGesture {
                         isPresented = true
                        }
                }
            }
            
        }
        .fullScreenCover(isPresented: $isPresented) {
         SingleCardView()
        }
    }
}

#Preview {
    CardsListView()
}


