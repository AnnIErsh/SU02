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
        NewsScreen(currentHead: $currentHeadTag)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
