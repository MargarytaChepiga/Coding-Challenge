//
//  File.swift
//  CodingChallenge
//
//  Created by margaret on 2019-06-26.
//  Copyright © 2019 margaret. All rights reserved.
//

import Foundation

struct Article {
    let title: String
    let content: String
    let thumbnailUrl: URL?
    
    static func parseArticles(from payload: RedditPayload) -> [Article] {
        let payloadArticles = payload.data.children
        var articles = [Article]()
        
        for payloadArticle in payloadArticles {
            let data = payloadArticle.data
            articles.append(Article(title: data.title, content: data.selftext, thumbnailUrl: URL(string: data.thumbnail)))
        }
        
        return articles
    }
}
