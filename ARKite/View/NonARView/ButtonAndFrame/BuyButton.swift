//
//  BuyButton.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct BuyButton: View {
    let price : Int
    var body: some View {
        ZStack {
            CoinIndicatorPath()
            .fill(.linearGradient(colors: [Color.init(hex: "15B10F"), Color.init(hex: "0F7B20")], startPoint: .top, endPoint: .bottom))
            .frame(width: 93, height: 44, alignment: .center)
            .overlay {
                HStack {
                    Spacer()
                        .frame(width: 10)
                    Text("\(price)")
                        .foregroundColor(.white)
                        .font(.system(.title3, design: .default, weight: .heavy))
                }
            }
            Image("KoinBaru")
                .resizable()
                .frame(width: 60, height: 60)
                .offset(x: -50)
    }
    }
}



struct BuyButton_Previews: PreviewProvider {
    static var previews: some View {
        BuyButton(price: 1000)
    }
}
