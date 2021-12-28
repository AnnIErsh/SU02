//
//  ContentView.swift
//  SU02
//
//  Created by Anna Ershova on 20.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State var currentHeadTag: String = "Cars"
    
    var body: some View {
        NavigationContainerView(transition: Transition.custom(.slide)) {
            NewsScreen(currentHead: $currentHeadTag)
        }
        .environmentObject(NavigationContainerViewModel())
    }
}
