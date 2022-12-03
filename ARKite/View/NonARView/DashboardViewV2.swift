//
//  DashboardViewV2.swift
//  ARKite
//
//  Created by Amalia . on 01/12/22.
//

import SwiftUI

struct DashboardViewV2: View {
    
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    Image("CloudNew2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * (6.5/5),height: UIScreen.main.bounds.height * (4.25/5))
                        .position(x: UIScreen.main.bounds.width * (1.8/5),y: UIScreen.main.bounds.height * (3.4/5))
                    Image("RumahMainPage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .position(x: UIScreen.main.bounds.width * (2.5/5),y: UIScreen.main.bounds.height * (4.25/5))
                }
                ZStack{
                    Image("CloudNew1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * (6.5/5),height: UIScreen.main.bounds.height * (4.25/5))
                        .position(x: UIScreen.main.bounds.width * (4/5),y: UIScreen.main.bounds.height * (-1.8/5))
                    Image("LayanganMainPage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * (6.5/5),height: UIScreen.main.bounds.height * (4.25/5))
                        .position(x: UIScreen.main.bounds.width * (4/5),y: UIScreen.main.bounds.height * (0/5))
                        MainMenuButton(firstColor: "0099BB", secondColor: "00608B", bgColor: "00496B", width: 262, height: 78)
                            .position(x: UIScreen.main.bounds.width * (2.5/5),y: UIScreen.main.bounds.height * (-0.1/5))
                    KoleksiMenuButton(firstColor: "15B10F", secondColor: "0F7B20", bgColor: "106514", width: 264, height: 82, text: "KOLEKSI")
                        .position(x: UIScreen.main.bounds.width * (2.5/5),y: UIScreen.main.bounds.height * (0.5/5))
                    SettingButton()
                        .position(x: UIScreen.main.bounds.width * (0.5/5),y: UIScreen.main.bounds.height * (-2/5))
                    CoinIndicatorFrame(coinCount: 0)
                        .position(x: UIScreen.main.bounds.width * (4.2/5),y: UIScreen.main.bounds.height * (-2/5))
                    
                        
                }
            }
            
            
                
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("BGMainPage1"), Color("BGMainPage2")]), startPoint: .top, endPoint: .bottom))
    }
}

struct DashboardViewV2_Previews: PreviewProvider {
    static var previews: some View {
        DashboardViewV2()
    }
}
