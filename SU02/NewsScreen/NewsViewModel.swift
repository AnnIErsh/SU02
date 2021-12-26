//
//  NewsViewModel.swift
//  SU02
//
//  Created by Anna Ershova on 23.12.2021.
//

import Networking
import SwiftUI

final class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isPageLoading: Bool = false
    @Published var currentHeading: String?
    var page: Int = 0
    var totalResults: Int = Int.max
    var headings = HeadingManager.shared.heads
    var toCange: String {
        get{
            currentHeading ?? ""
        }
        set {
            currentHeading = newValue
        }
    }
        
    init() {}
    
    func loadNextPage() {
        guard !isPageLoading && totalResults > articles.count else {
            print("Nothing to load \(self.articles.count)/\(self.totalResults)")
            return
        }
        isPageLoading = true
        page += 1
        DispatchQueue.global(qos: .background).async { [self] in
            ArticlesAPI.everythingGet(q: currentHeading ?? "Cars",
                                      from: "2021-12-23",
                                      sortBy: "publishedAt",
                                      language: "en",
                                      //apiKey: "a59e5f24831a4322b535578654582973",
                                      apiKey: "86346ae4bf054d819cc1d938a0ba75d7",
                                      //apiKey: "aebbd82e5b604687a498d79cc7dc24f1",
                                      page: self.page) { list, error in
                self.totalResults = list?.totalResults ?? Int.max
                self.articles.append(contentsOf: list?.articles ?? [])
                self.isPageLoading = false
            }
        }
    }
    
    func refreshList() {
        articles = []
        isPageLoading = false
        page = 0
        totalResults = Int.max
    }
}
