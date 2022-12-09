//
//  DashboardViewV2.swift
//  ARKite
//
//  Created by Amalia . on 01/12/22.
//
import GameKit
import SwiftUI

struct DashboardView: View {
    @State var showSettingNonARView = false
    @EnvironmentObject var collectVM : CollectionViewModel
    @EnvironmentObject var coordinator : Coordinator
    
    
    //ANIMATION SETUP
    @State private var cloudPos = 1.5
    @State private var reverseCloudAnimation = true
    @State private var kitePos = 0.9
    @State private var reverseKiteAnimation = true
    @State private var invalidateTimer = false
    
    //Buat GameKit
    let localPlayer = GKLocalPlayer.local
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ZStack {
                        Image("CloudNew2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width * (6.5/5),height: UIScreen.main.bounds.height * (4.25/5))
                            .position(x: UIScreen.main.bounds.width * (-cloudPos + 0.5) ,y: UIScreen.main.bounds.height * (3.4/5))
                        Image("RumahMainPage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .position(x: UIScreen.main.bounds.width * (2.5/5),y: UIScreen.main.bounds.height * (4.25/5))
                            .opacity(0.8)
                    }
                    .blur(radius: showSettingNonARView ? 5 : 0 )
                    ZStack{
                        Image("CloudNew1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width * (6.5/5),height: UIScreen.main.bounds.height * (4.25/5))
                        
                            // kananMax = 1.5
                            // kiri max = -0.5
                        
                            // pergerakan dari kanan ke kiri => 1.5 to -0.5
                            // setelah itu reverse
                            .position(x: UIScreen.main.bounds.width * cloudPos ,y: UIScreen.main.bounds.height * (-1.8/5))
                        
                        
                        
                        Image("LayanganMainPage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width * (6.5/5),height: UIScreen.main.bounds.height * (4.25/5))
                            // position 0.8 - 0.9
                            .position(x: UIScreen.main.bounds.width * kitePos, y: UIScreen.main.bounds.height * (0/5))
                            .onAppear {
                                let kiteStep = 0.00018
                                let animationInterval = 0.01
                                let maxPos = 0.9
                                let minPos = 0.8
                                
                                // animation timer
                                    _ = Timer.scheduledTimer(withTimeInterval: animationInterval, repeats: true, block: { animationTimer in
                                        
                                        if reverseKiteAnimation {
                                            if kitePos >= minPos {
                                                reverseKiteAnimation.toggle()
                                                _ = Timer.scheduledTimer(withTimeInterval: animationInterval, repeats: true, block: { moveToLeft in
                                                    kitePos -= kiteStep
                                                    
                                                    if kitePos <= minPos {
                                                        moveToLeft.invalidate()
                                                        reverseKiteAnimation.toggle()
                                                    }
                                                })
                                            } else {
                                                reverseKiteAnimation.toggle()
                                                _ = Timer.scheduledTimer(withTimeInterval: animationInterval, repeats: true, block: { moveToRight in
                                                    kitePos += kiteStep
                                                    
                                                    if kitePos >= maxPos {
                                                        moveToRight.invalidate()
                                                        reverseKiteAnimation.toggle()
                                                    }
                                                })
                                            }
                                        }
                                        
                                        if invalidateTimer {
                                            animationTimer.invalidate()
                                        }
                                    })
                            }
                        HStack(spacing: 200){
                            Button {
                                self.showSettingNonARView.toggle()
                            } label: {
                                SettingButton()
                            }
                            CoinIndicatorFrame(coinCount: collectVM.coins)
                        }.position(x: UIScreen.main.bounds.width * (2.5/5),y: UIScreen.main.bounds.height * (-2/5))
                        
                        
                    }
                    .blur(radius: showSettingNonARView ? 5 : 0 )
                    
                    
                }
                if !showSettingNonARView {

                    VStack{
                        Button{
                            coordinator.displayChooseKite()
                        } label: {
                            MainMenuButton(firstColor: "0099BB", secondColor: "00608B", bgColor: "00496B", width: 262, height: 78, text: "MAIN")
                        }
                        
                        Button{
                            coordinator.displayKoleksiView()
                        }label:{
                            KoleksiMenuButton(firstColor: "15B10F", secondColor: "0F7B20", bgColor: "106514", width: 264, height: 82, text: "KOLEKSI")
                        }
                        
                    }
                    .offset(y: 50)
                }
                
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color("BGMainPage1"), Color("BGMainPage2")]), startPoint: .top, endPoint: .bottom))
            .onAppear {
                let cloudStep = 0.002
                let animationInterval = 0.05
                let maxPos = 1.5
                let minPos = -0.5
                
                    _ = Timer.scheduledTimer(withTimeInterval: animationInterval, repeats: true, block: { animationTimer in
                        
                        if reverseCloudAnimation {
                            if cloudPos >= minPos {
                                reverseCloudAnimation.toggle()
                                _ = Timer.scheduledTimer(withTimeInterval: animationInterval, repeats: true, block: { moveToLeft in
                                    cloudPos -= cloudStep
                                    
                                    if cloudPos <= minPos {
                                        moveToLeft.invalidate()
                                        reverseCloudAnimation.toggle()
                                    }
                                })
                            } else {
                                reverseCloudAnimation.toggle()
                                _ = Timer.scheduledTimer(withTimeInterval: animationInterval, repeats: true, block: { moveToRight in
                                    cloudPos += cloudStep
                                    
                                    if cloudPos >= maxPos {
                                        moveToRight.invalidate()
                                        reverseCloudAnimation.toggle()
                                    }
                                })
                            }
                        }
                        if invalidateTimer {
                            animationTimer.invalidate()
                        }
                    })
            }
            .onDisappear {
                invalidateTimer.toggle()
            }
        }
        .onAppear{
            authenticateUser()
            GKAccessPoint.shared.location = .bottomLeading
            GKAccessPoint.shared.showHighlights = true
            GKAccessPoint.shared.isActive = true
        }
        .onDisappear{
            GKAccessPoint.shared.isActive = false
        }
        .modifier(
            Popup(isPresented: showSettingNonARView,
                  alignment: .center,
                  content: {
                      SettingNonARView(showSettingNonARView: $showSettingNonARView, collectVM: collectVM)
                  }
            )
        )
        
    }
    
    func authenticateUser() {
        localPlayer.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            GKAccessPoint.shared.isActive = localPlayer.isAuthenticated
        }
    }
    
    
}





struct DashboardViewV2_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8", "iPhone 8 Plus", "iPhone 13", "iPhone XS", "iPhone 11 Pro Max", "iPhone 12 Pro Max", "iPhone 14 Pro", "iPhone 14 Pro Max"], id: \.self) { deviceName in
                       DashboardView()
                            .previewDevice(PreviewDevice(rawValue: deviceName))
                            .previewDisplayName(deviceName)
                            .environmentObject(CollectionViewModel())
                  }
    }
}
