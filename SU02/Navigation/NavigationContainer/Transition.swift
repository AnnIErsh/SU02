//
//  Transition.swift
//  SU02
//
//  Created by Anna Ershova on 23.12.2021.
//

import Foundation
import SwiftUI

enum Transition {
    case none
    case custom(AnyTransition)
}

enum NavigationType {
    case pop
    case push
    case popToRoot
}
