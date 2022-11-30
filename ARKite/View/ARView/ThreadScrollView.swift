//
//  ThreadScrollView.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 30/11/22.
//

import SwiftUI

struct ThreadScrollView: View {
    @State var whatScroll : CGFloat = 0.0
    @State var position = CGSize.zero
    @State var isDragging = false
    @State var color = Color.blue
    @ObservedObject var vm = ARViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
            }
            Spacer()
        }
        .background(color)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    if position.height > 0 {
                        color = Color.green
                    }else if position.height < 0 {
                        color = Color.red
                    }
                    position = value.translation
                    isDragging = true
                })
                .onEnded(({ value in
                    position = .zero
                    color = Color.blue
                    isDragging = false
                })
            )
        )
    }
}

struct ThreadScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadScrollView()
    }
}
