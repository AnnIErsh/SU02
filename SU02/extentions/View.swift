//
//  View.swift
//  SU02
//
//  Created by Anna Ershova on 23.12.2021.
//

import Foundation
import SwiftUI

extension View {
    var lazy: some View {
        LazyView(self)
    }
    
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
