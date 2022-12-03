//
//  BuyButton.swift
//  ARKite
//
//  Created by Amalia . on 02/12/22.
//

import SwiftUI

struct BuyButton: View {
    let coins : Int
    var body: some View {
        ZStack {
            CoinIndicatorPath()
                .fill(Color.init(hex: "106514"))
                .frame(width: 110, height: 37, alignment: .center)
                .padding(.top, 6)
                .padding(.trailing, 5)
            CoinIndicatorPath()
                .fill(.linearGradient(colors: [Color.init(hex: "15B10F"), Color.init(hex: "0F7B20")], startPoint: .top, endPoint: .bottom))
                .frame(width: 110, height: 37, alignment: .center)
                .overlay {
                    HStack {
                        Spacer()
                            .frame(width: 20)
                        Text("\(coins)")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .heavy, design: .rounded))
                            .padding(.top, 5)
                    }
                }
            Image("KoinBaru")
                .resizable()
                .frame(width: 58, height: 58)
                .offset(x: -50)
        }
    }
}



struct BuyButton_Previews: PreviewProvider {
    static var previews: some View {
        BuyButton(coins: 1500)
    }
}
