//
//  NewsScreen.swift
//  SU02
//
//  Created by Anna Ershova on 23.12.2021.
//

import Networking
import SwiftUI

struct NewsScreen: View {
    @ObservedObject var newsViewModel: NewsViewModel = .init()
    @EnvironmentObject var detailViewModel: DetailViewModel
    @Binding var currentHead: String
    @EnvironmentObject var routModel: NavigationContainerViewModel
    var body: some View {
        VStack {
            Button {
                newsViewModel.loadNextPage()
            } label: {
                Text("Load News")
                    .background(Color.gray)
                    .foregroundColor(.white)
            }
            list.onAppear {
                newsViewModel.loadNextPage()
            }
        }
    }
    
    var list: some View {
        List {
            Section {
                ForEach(newsViewModel.articles.lazy) { article in
                    NewsArticleCell(article: article)
                        .showActivityIdicator(newsViewModel.isPageLoading && newsViewModel.articles.isLast(article))
                        .onTapGesture {
                            transferDataToDetailView(article)
                            routModel.push(screeView: DetailScreen().toAnyView())
                        }
                        .onAppear {
                            if newsViewModel.articles.isLast(article) {
                                newsViewModel.loadNextPage()
                                print("on page: \(newsViewModel.page)")
                            }
                        }
                }
            } header: {
                heading
            }
        }
        .listStyle(.plain)
        .onAppear {
            newsViewModel.toCange = currentHead
        }
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
    
    func transferDataToDetailView(_ article: Article) {
        detailViewModel.data.author = article.author
        detailViewModel.data.content = article.content
        detailViewModel.data.articleName = article.title
        detailViewModel.data.pictureURL = article.urlToImage
    }
}

struct NewsArticleCell: View {
    var article: Article
    
    var body: some View {
        Text(article.title ?? article.id)
    }
}

struct NewsArticleDetail2: View {
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    var body: some View {
        
        VStack {
            Text("Article info2")
                .padding()
                .foregroundColor(.red)
            Button {
                self.routeModel.popToRoot()
            } label: {
                Text("back")
            }
        }
    }
}
