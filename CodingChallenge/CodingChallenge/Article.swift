//
//  Article.swift
//  CodingChallenge
//
//  Created by margaret on 2019-06-25.
//  Copyright © 2019 margaret. All rights reserved.
//

import Foundation

struct Article: Codable {
    var children: [ArticleInfo]
}

struct ArticleInfo: Codable {
    var data: ArticleData
}

struct ArticleData: Codable {
    var title: String
    var subreddit: String
    var selftext: String
    var thumbnail_height: Int?
    var thumbnail_width: Int?
    var thumbnail: String
    
    
}
