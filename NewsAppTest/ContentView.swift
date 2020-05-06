//
//  ContentView.swift
//  NewsAppTest
//
//  Created by George Joseph Kristian on 06/05/20.
//  Copyright © 2020 George Joseph Kristian. All rights reserved.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var newsFeed = NewsFeed()
    
    var body: some View {
        NavigationView{
            List(newsFeed) {(article: NewsListItem) in
                NewsListItemView(article: article)
                    .onAppear{
                        self.newsFeed.loadMoreArticles(currentItem: article)
                }
            }.navigationBarTitle("News")
        }
        
    }
//    var body: some View {
//        NewsFeedView()
//    }
}


struct NewsListItemView: View {
    var article: NewsListItem
    
    var body: some View{
        NavigationLink(destination: webView(item: article)){
            HStack(spacing: 10){
                
                if article.image != ""{
                    WebImage(url: URL(string: article.image), options: .highPriority, context: nil)
                    .resizable()
                    .frame(width: 100, height: 80)
                    .cornerRadius(6)
                    .scaledToFill()
                    .padding()
                }
                
                VStack(alignment: .leading){
                Text("\(article.title)").font(.headline)
                Text("\(article.author)").font(.subheadline)
                }
        }
        .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView{
            ContentView()
//            .navigationBarTitle("News")
//        }
    }
}
