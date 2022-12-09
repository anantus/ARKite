//
//  Popup.swift
//  ARKite
//
//  Created by Amalia . on 04/12/22.
//

import SwiftUI

struct Popup<T: View>: ViewModifier {
    let popup: T
    let isPresented: Bool
    let alignment: Alignment // (*)
    
    // 1.
    init(isPresented: Bool, alignment: Alignment, @ViewBuilder content: () -> T) {
        self.isPresented = isPresented
        self.alignment = alignment // (*)
        
        popup = content()
    }
    
    // 2.
    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }
    
    // 3.
    @ViewBuilder private func popupContent() -> some View {
        GeometryReader { geometry in
            if isPresented {
                popup
                    .animation(.spring()) // 1.
                    .transition(.offset(x: 0, y: geometry.belowScreenEdge)) // 2.
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: alignment) // (*)
            }
        }
    }
}


private extension GeometryProxy {
    var belowScreenEdge: CGFloat {
        UIScreen.main.bounds.height - frame(in: .global).minY
    }
}

