//
//  DashboardView.swift
//  ARKite
//
//  Created by Amalia . on 12/11/22.
//

import SwiftUI

struct DashboardView: View {
    @State var showChooseKite: Bool = false
    @State var showSettingView: Bool = false
    @State var showContentView: Bool = false
    @State var showDashboard: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Image("Background")
                    .aspectRatio(contentMode: .fit)
                    .position(x: 78, y: 554)
                ZStack(alignment: .trailing){
                    Text("25")
                        .font(.system(size:25, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .background(.black)
                        .cornerRadius(3)
                    Image("dollar")
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 50)
                }
                .position(x: 300, y: 50)
                VStack{
                    NavigationLink(destination: ContentView(), isActive: self.$showContentView, label: {
                        ZStack{
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color("Play"), Color("Play2")]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 252, height: 65)
                                .cornerRadius(28)
                                .shadow(color: Color("PlayShadow"),radius: 2, y: 10)
                            StrokeText(text: "PLAY", width: 1, color: Color("PlayBorder"))
                                .foregroundColor(.white)
                                .font(.system(size: 34, weight: .heavy, design: .rounded))
                                .shadow(color: Color("PlayShadow") ,radius: 2)
                        }
                        .onTapGesture{
                            self.showContentView = true
                        }
                    }
                    )
                    
                    NavigationLink(destination: ChooseKiteView(), isActive: self.$showChooseKite, label: {
                        ZStack{
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color("Kite"), Color("Kite2")]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 185, height: 65)
                                .cornerRadius(28)
                                .shadow(color: Color("KiteShadow"),radius: 2, y: 10)
                            StrokeText(text: "KITE", width: 1, color: Color("KiteBorder"))
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .heavy, design: .rounded))
                                .shadow(color: Color("KiteShadow") ,radius: 2)
                        }
                        .onTapGesture {
                            self.showChooseKite = true
                        }
                    })
                    NavigationLink(destination: SettingView(), isActive: self.$showSettingView, label: {
                        ZStack{
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color("Settings"), Color("Settings2")]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 185, height: 65)
                                .cornerRadius(28)
                                .shadow(color: Color("SettingShadow"),radius: 2, y: 10)
                            StrokeText(text: "SETTINGS", width: 1, color: Color("SettingBorder"))
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .heavy, design: .rounded))
                                .shadow(color: Color("SettingShadow") ,radius: 2)
                        }
                        .onTapGesture {
                            self.showSettingView = true
                        }})
                    }
                
                
                .position(x: 200, y: 500)
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color("Bekgron"), Color("Bekgron2")]), startPoint: .top, endPoint: .bottom))
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
