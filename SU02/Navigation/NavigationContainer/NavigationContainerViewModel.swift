//
//  NavigationContainerViewModel.swift
//  SU02
//
//  Created by Anna Ershova on 20.12.2021.
//

import SwiftUI
import Foundation

final class NavigationContainerViewModel: ObservableObject {
    @Published var currentScreen: Screen?
    var navigationType: NavigationType = .push
    
    var screenStack = NavigationStack() {
        didSet {
            self.currentScreen = screenStack.top()
        }
    }
    
    init() {}
    
    func push(screeView: AnyView) {
        self.navigationType = .push
        let screen = Screen(view: screeView)
        screenStack.push(screen)
    }
    
    func pop() {
        self.navigationType = .pop
        screenStack.pop()
    }
    
    func popToRoot() {
        self.navigationType = .popToRoot
        screenStack.popToRoot()
    }
}
