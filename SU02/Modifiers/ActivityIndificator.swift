//
//  ActivityIndificator.swift
//  SU02
//
//  Created by Anna Ershova on 29.12.2021.
//

import SwiftUI

struct ActivityIndificator: ViewModifier {
    var isLoading: Bool
    
    func body(content: Content) -> some View {
        if isLoading {
            withLoading(content: content)
        } else {
            withoutLoading(content: content)
        }
    }
    
    func withoutLoading(content: Content) -> some View {
        content
    }
    
    func withLoading(content: Content) -> some View {
        print("withLoading")
        return VStack {
            content
            Divider()
            HStack {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                Spacer()
            }
        }
    }
}
