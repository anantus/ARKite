//
//  TestView.swift
//  ARKite
//
//  Created by Ricky Silitonga on 09/12/22.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            
            
            Image("CloudNew1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * (6.5/5),height: UIScreen.main.bounds.height * (4.25/5))
                .position(x: UIScreen.main.bounds.width * (4/5),y: UIScreen.main.bounds.height * (-1.8/5))
            .blur(radius: 5)
        }

        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .foregroundColor(.black)
        .background(Color.red)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
