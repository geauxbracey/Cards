//
//  ResizableView.swift
//  Cards
//
//  Created by Kaitlyn Bracey on 10/1/24.
//

import SwiftUI

struct ResizableView: ViewModifier {
    
    @Binding var transform: Transform
    @State private var previousOffset: CGSize = .zero
    @State private var previousRotation: Angle = .zero
    //configures rotation
    @State private var scale: CGFloat = 1.0
    //this property holds the current scale

    
    func body(content: Content) -> some View {
        content
            .onAppear {
                previousOffset = transform.offset
            }
            .frame(
                width: transform.size.width,
                height: transform.size.height)
            .rotationEffect(transform.rotation)
            .scaleEffect(scale)
            .offset(transform.offset)
            .gesture(dragGesture)
            .gesture(SimultaneousGesture(rotationGesture, scaleGesture))
        //can perform two gestures at same time with SimultaneousGesture
        //gesture must go after positioning modifiers
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                transform.offset = value.translation + previousOffset
            }
            .onEnded { _ in
                previousOffset = transform.offset
            }
    }
    
    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { rotation in
                transform.rotation += rotation - previousRotation
                previousRotation = rotation
            }
            .onEnded { _ in
                previousRotation = .zero
            }
        }
    
    var scaleGesture: some Gesture {
        MagnificationGesture()
            .onChanged { scale in
                self.scale = scale
            }
            .onEnded { scale in
                transform.size.width *= scale
                transform.size.height *= scale
                self.scale = 1.0
            }
        }
}

struct ResizableView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangle(cornerRadius: 30.0)
            .foregroundColor(Color.blue)
            .resizableView(transform: .constant(Transform()))
        //passes in a new transform instance as a binding
    }
}

extension View {
    func resizableView(transform: Binding<Transform>) -> some View {
        modifier(ResizableView(transform: transform))
    }
}
