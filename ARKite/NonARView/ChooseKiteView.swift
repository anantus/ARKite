//
//  ChooseKiteView.swift
//  ARKite
//
//  Created by Amalia . on 12/11/22.
//

import SwiftUI

struct ChooseKiteView: View {
    @Environment(\.presentationMode) var showChooseKite
    @State var isUsed = false
    //    @State var showChooseKite: Bool = false
    //    @State var showDashboard: Bool = false
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("Bekgron"), Color("Bekgron2")]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 400, height: 140)
                    .cornerRadius(29)
                    .overlay(
                        RoundedRectangle(cornerRadius: 29).stroke(Color("Bekgron"), lineWidth: 8))
                    .shadow(color: Color("ChooseShadow") ,radius: 3, y: 3)
                StrokeText(text: "Choose Kite", width: 1, color: Color("ChooseBorder"))
                    .foregroundColor(Color("Choose"))
                    .font(.system(size: 34, weight: .heavy, design: .rounded))
                    .shadow(color: Color("ChooseShadow") ,radius: 2)
                    .offset(y: 20)
            }
            .position(x: 195, y: 65)
            ZStack{
                Image("Cloud3")
                    .position(x: 300, y: 370)
                VStack{
                    HStack{
                        ZStack{
                            FrameKuning()
                            VStack{
                                Image("KITE 1")
                                    .resizable()
                                    .frame(width: 107, height: 135)
                                    .rotationEffect(.degrees(30))
                                    .shadow(radius: 3, y: 3)
                                UseButton()
                            }
                            .position(x: 75, y: 80)
                        }
                        .padding()
                        ZStack{
                            FrameKuning()
                            VStack{
                                Image("KITE 2")
                                    .resizable()
                                    .frame(width: 107, height: 135)
                                    .rotationEffect(.degrees(30))
                                    .shadow(radius: 3, y: 3)
                                if isUsed {
                                    SelectedButton()
                                } else {
                                    UseButton()
                                }
                                
                                //                                isUsed ? SelectedButton() : UseButton()
                                
                            }.onTapGesture {
                                withAnimation {
                                    isUsed.toggle()
                                }
                            }
                            .position(x: 75, y: 80)
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    HStack{
                        ZStack{
                            FrameIjo()
                            VStack{
                                Image("KITE 3")
                                    .resizable()
                                    .frame(width: 107, height: 135)
                                    .rotationEffect(.degrees(30))
                                    .shadow(radius: 3, y: 3)
                                ZStack{
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color("Kite"), Color("Kite2")]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 99, height: 31)
                                        .cornerRadius(28)
                                        .shadow(color: Color("KiteShadow"),radius: 2, y: 5)
                                    StrokeText(text: "500", width: 1, color: Color("KiteBorder"))
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .heavy, design: .rounded))
                                        .shadow(color: Color("KiteShadow") ,radius: 2)
                                    Image("dollar")
                                        .resizable()
                                        .frame(width: 39, height: 41)
                                        .offset(x: -40)
                                }
                            }
                            .position(x: 75, y: 80)
                        }
                        .padding()
                        ZStack{
                            FrameIjo()
                            VStack{
                                Image("KITE 3")
                                    .resizable()
                                    .frame(width: 107, height: 135)
                                    .rotationEffect(.degrees(30))
                                    .shadow(radius: 3, y: 3)
                                ZStack{
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color("Kite"), Color("Kite2")]), startPoint: .top, endPoint: .bottom))
                                        .frame(width: 99, height: 31)
                                        .cornerRadius(28)
                                        .shadow(color: Color("KiteShadow"),radius: 2, y: 5)
                                    StrokeText(text: "700", width: 1, color: Color("KiteBorder"))
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .heavy, design: .rounded))
                                        .shadow(color: Color("KiteShadow") ,radius: 2)
                                    Image("dollar")
                                        .resizable()
                                        .frame(width: 39, height: 41)
                                        .offset(x: -40)
                                }
                            }
                            .position(x: 75, y: 80)
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    .padding()
                    Button {
                        self.showChooseKite.wrappedValue.dismiss()
                    } label: {
                        
                        ZStack{
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color("Settings"), Color("Settings2")]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 185, height: 65)
                                .cornerRadius(28)
                                .shadow(color: Color("SettingShadow"),radius: 2, y: 5)
                            StrokeText(text: "BACK", width: 1, color: Color("SettingBorder"))
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .heavy, design: .rounded))
                                .shadow(color: Color("SettingShadow") ,radius: 2)
                        }
                    }
                    
                    //                    }
                    //                    HStack{
                    //                        ZStack{
                    //                            FrameIjo()
                    //                            VStack{
                    //                                Image("KITE 3")
                    //                                    .resizable()
                    //                                    .frame(width: 107, height: 135)
                    //                                    .rotationEffect(.degrees(30))
                    //                                    .shadow(radius: 3, y: 3)
                    //                                ZStack{
                    //                                    Rectangle()
                    //                                        .fill(LinearGradient(gradient: Gradient(colors: [Color("Kite"), Color("Kite2")]), startPoint: .top, endPoint: .bottom))
                    //                                        .frame(width: 99, height: 31)
                    //                                        .cornerRadius(28)
                    //                                        .shadow(color: Color("KiteShadow"),radius: 2, y: 5)
                    //                                    StrokeText(text: "1000", width: 1, color: Color("KiteBorder"))
                    //                                        .foregroundColor(.white)
                    //                                        .font(.system(size: 17, weight: .heavy, design: .rounded))
                    //                                        .shadow(color: Color("KiteShadow") ,radius: 2)
                    //                                    Image("dollar")
                    //                                        .resizable()
                    //                                        .frame(width: 39, height: 41)
                    //                                        .offset(x: -45)
                    //                                }
                    //                            }
                    //                            .position(x: 75, y: 80)
                    //                        }
                    //                        .padding()
                    //                        ZStack{
                    //                            FrameIjo()
                    //                            VStack{
                    //                                Image("KITE 3")
                    //                                    .resizable()
                    //                                    .frame(width: 107, height: 135)
                    //                                    .rotationEffect(.degrees(30))
                    //                                    .shadow(radius: 3, y: 3)
                    //                                ZStack{
                    //                                    Rectangle()
                    //                                        .fill(LinearGradient(gradient: Gradient(colors: [Color("Kite"), Color("Kite2")]), startPoint: .top, endPoint: .bottom))
                    //                                        .frame(width: 99, height: 31)
                    //                                        .cornerRadius(28)
                    //                                        .shadow(color: Color("KiteShadow"),radius: 2, y: 5)
                    //                                    StrokeText(text: "2000", width: 1, color: Color("KiteBorder"))
                    //                                        .foregroundColor(.white)
                    //                                        .font(.system(size: 17, weight: .heavy, design: .rounded))
                    //                                        .shadow(color: Color("KiteShadow") ,radius: 2)
                    //                                    Image("dollar")
                    //                                        .resizable()
                    //                                        .frame(width: 39, height: 41)
                    //                                        .offset(x: -45)
                    //                                }
                    //                            }
                    //                            .position(x: 75, y: 80)
                    //                        }
                    //                        .padding(.horizontal)
                    //                    }
                    //                    .padding()
                }
                .position(x: 195, y: 40)
            }
            
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("Bekgron"), Color("Bekgron2")]), startPoint: .top, endPoint: .bottom))
        .navigationBarBackButtonHidden(true)
    }
}

struct ChooseKiteView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseKiteView()
    }
}
