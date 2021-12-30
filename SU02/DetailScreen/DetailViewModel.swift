//
//  DetailViewModel.swift
//  SU02
//
//  Created by Anna Ershova on 29.12.2021.
//

import Foundation

struct DetailModel {
    var author: String?
    var content: String?
    var articleName: String?
    var pictureURL: String?
}

final class DetailViewModel: ObservableObject {
    @Published var title = "DetailViewModel"
    var data = DetailModel()
}
