//
//  Yanggo.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 07/12/22.
//

import SwiftUI

struct Yanggo: View {
    @ObservedObject var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            DashboardView()
                .navigationDestination(for: Destination.self) { destination in
                    ViewFactory.destinationToView(destination)
                        .onAppear{
                            print(coordinator.path.count)
                        }
                }
        }
        .environmentObject(coordinator)
    }
}

struct Yanggo_Previews: PreviewProvider {
    static var previews: some View {
        Yanggo()
    }
}
