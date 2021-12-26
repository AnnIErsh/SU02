//
//  Article.swift
//  SU02
//
//  Created by Anna Ershova on 23.12.2021.
//

import Foundation
import Networking

extension Article: Identifiable {
    public var id: String {
        url
    }
}
