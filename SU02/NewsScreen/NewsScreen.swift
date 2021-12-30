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
            list.onAppear {
                newsViewModel.loadNextPage()
            }
        }
    }
    
    var list: some View {
        List {
            Section {
                ForEach(newsViewModel.articles) { article in
                    NewsArticleCell(article: article)
                        .showActivityIdicator(newsViewModel.isPageLoading && newsViewModel.articles.isLast(article))
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
}

struct NewsArticleCell: View {
    @EnvironmentObject var routModel: NavigationContainerViewModel
    @EnvironmentObject var detailViewModel: DetailViewModel
    @State var scale: Bool = false
    var article: Article
    
    var body: some View {
        Text(article.title ?? article.id)
            .scaleEffect(scale ? 2.0 : 1.0)
            .onTapGesture {
                transferDataToDetailView(article)
                withAnimation(Animation.easeInOut(duration: 1.1)) {
                    scale.toggle()
                }
                withAnimation(Animation.default.delay(1.1)) {
                    routModel.push(screeView: DetailScreen().lazy.toAnyView())
                }
            }
    }
    
    func transferDataToDetailView(_ article: Article) {
        detailViewModel.data.author = article.author
        detailViewModel.data.content = article.content
        detailViewModel.data.articleName = article.title
        detailViewModel.data.pictureURL = article.urlToImage
    }
}
