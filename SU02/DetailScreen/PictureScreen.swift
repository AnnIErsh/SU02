//
//  PictureScreen.swift
//  SU02
//
//  Created by Anna Ershova on 30.12.2021.
//

import SwiftUI

struct PictureScreen: View {
    @EnvironmentObject var detailViewModel: DetailViewModel
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    var body: some View {
        VStack {
            let text = detailViewModel.data.author
            let url = detailViewModel.data.pictureURL
            Text(text ?? "unknown")
                .font(.largeTitle)
                .padding()
            AsyncImage(url: URL(string: url ?? "")) { img in
                img.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 250, maxHeight: 250)
            } placeholder: {
                ProgressView()
            }
            Button {
                withAnimation {
                    routeModel.popToRoot()
                }
            } label: {
                Text("Back To News")
                    .padding()
                    .background(Color.purple.opacity(0.8))
                    .foregroundColor(.white)
            }
        }
    }
}
