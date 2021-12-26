//
//  NewsScreen.swift
//  SU02
//
//  Created by Anna Ershova on 23.12.2021.
//

import Networking
import SwiftUI

struct NewsScreen: View {
    @StateObject var newsViewModel: NewsViewModel = .init()
    @Binding var currentHead: String
    var body: some View {
        VStack {
            Button {
                newsViewModel.loadNextPage()
            } label: {
                Text("Load News")
                    .background(Color.gray)
                    .foregroundColor(.white)
            }
        }
        list
    }
    
    var list: some View {
        List {
            Section {
                ForEach(newsViewModel.articles) { article in
                    NewsArticleCell(article: article)
                        .onAppear {
                            if newsViewModel.articles.isLast(article) {
                                newsViewModel.loadNextPage()
                            }
                        }
                }
            } header: {
                heading
            }
        }
        .listStyle(.plain)
    }
    
    var heading: some View {
        VStack {
            Picker("Show heading:", selection: $currentHead, content: {
                ForEach(newsViewModel.headings.indices) { i in
                    Text("\(newsViewModel.headings[i])")
                        .tag(newsViewModel.headings[i])
                }
            })
                .onChange(of: currentHead, perform: { newValue in
                    print(newValue)
                    newsViewModel.toCange = newValue
                    newsViewModel.refreshList()
                    newsViewModel.loadNextPage()
                })
                .pickerStyle(.segmented)
            Text("Let's read about \(currentHead)")
        }
    }
}

struct NewsArticleCell: View {
    var article: Article
    
    var body: some View {
        Text(article.title ?? "")
    }
}
