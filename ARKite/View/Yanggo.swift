//
//  Yanggo.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 07/12/22.
//

import SwiftUI

struct Yanggo: View {
    @ObservedObject var coordinator = Coordinator()
    @ObservedObject var collectVM = CollectionViewModel()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            DashboardView()
                .navigationDestination(for: Destination.self) { destination in
                    ViewFactory.destinationToView(destination)
                }
        }
        .environmentObject(coordinator)
        .environmentObject(collectVM)
    }
}

struct Yanggo_Previews: PreviewProvider {
    static var previews: some View {
        Yanggo()
    }
}
