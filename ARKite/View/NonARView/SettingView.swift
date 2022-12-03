////
////  SettingView.swift
////  ARKite
////
////  Created by Amalia . on 12/11/22.
////
//
//import SwiftUI
//
//struct SettingView: View {
//    @State var showSettingView: Bool = false
//    var body: some View {
//        ZStack{
//            Rectangle()
//                .fill(LinearGradient(gradient: Gradient(colors: [Color("Bekgron"), Color("Bekgron2")]), startPoint: .top, endPoint: .bottom))
//                .frame(width: 346, height: 415)
//                .cornerRadius(29)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 29).stroke(Color("Bekgron"), lineWidth: 8))
//                .shadow(color: Color("ChooseShadow") ,radius: 3, y: 3)
//            VStack{
//                ZStack{
//                    Rectangle()
//                        .fill(LinearGradient(gradient: Gradient(colors: [Color("Bekgron"), Color("Bekgron2")]), startPoint: .top, endPoint: .bottom))
//                        .frame(width: 146, height: 56)
//                        .cornerRadius(16)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 16).stroke(Color("Bekgron"), lineWidth: 5))
//                        .shadow(color: Color("ChooseShadow") ,radius: 3, y: 3)
//                    StrokeText(text: "Settings", width: 1, color: Color("ChooseBorder"))
//                        .foregroundColor(Color("Choose"))
//                        .font(.system(size: 22, weight: .heavy, design: .rounded))
//                        .shadow(color: Color("ChooseShadow") ,radius: 2)
//                }
//                            .offset(y: -50)
//                HStack{
//                    VStack(alignment: .leading, spacing: 50){
//                        Text("Music")
//                            .font(.system(size: 22, weight: .heavy, design: .rounded))
//                            .foregroundColor(.white)
//                        Text("Effect")
//                            .font(.system(size: 22, weight: .heavy, design: .rounded))
//                            .foregroundColor(.white)
//                        
//                        Text("Controls")
//                            .font(.system(size: 22, weight: .heavy, design: .rounded))
//                            .foregroundColor(.white)
//                    }
//                    .padding()
//                    VStack(spacing: 50){
//                        Text(":")
//                            .font(.system(size: 22, weight: .heavy, design: .rounded))
//                            .foregroundColor(.white)
//                        Text(":")
//                            .font(.system(size: 22, weight: .heavy, design: .rounded))
//                            .foregroundColor(.white)
//                        Text(":")
//                            .font(.system(size: 22, weight: .heavy, design: .rounded))
//                            .foregroundColor(.white)
//                    }
//                    VStack(spacing: 50){
//                        Rectangle()
//                            .fill(Color("ChooseShadow"))
//                            .frame(width: 170, height: 29)
//                            .cornerRadius(8)
//                        Rectangle()
//                            .fill(Color("ChooseShadow"))
//                            .frame(width: 170, height: 29)
//                            .cornerRadius(8)
//                        Rectangle()
//                            .fill(Color("ChooseShadow"))
//                            .frame(width: 170, height: 29)
//                            .cornerRadius(8)
//                    }
//                    
//                }
//                Spacer()
//                    .frame(height: 30)
//                ZStack{
//                    Rectangle()
//                        .fill(LinearGradient(gradient: Gradient(colors: [Color("Settings"), Color("Settings2")]), startPoint: .top, endPoint: .bottom))
//                        .frame(width: 223, height: 65)
//                        .cornerRadius(28)
//                        .shadow(color: Color("SettingShadow"),radius: 2, y: 5)
//                    StrokeText(text: "Close", width: 1, color: Color("SettingBorder"))
//                        .foregroundColor(.white)
//                        .font(.system(size: 28, weight: .heavy, design: .rounded))
//                        .shadow(color: Color("SettingShadow") ,radius: 2)
//                }
//                
//                
//                
//            }
//        }
//    }
//}
//
//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//    }
//}
