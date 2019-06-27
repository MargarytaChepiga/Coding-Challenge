//
//  Articles.swift
//  CodingChallenge
//
//  Created by margaret on 2019-06-25.
//  Copyright © 2019 margaret. All rights reserved.
//

import Foundation

struct RedditPayload: Codable {
    var data: Articles
    
    struct Articles: Codable {
        var children: [Article]
        
        struct Article: Codable {
            var data: ArticleData
            
            struct ArticleData: Codable {
                var title: String
                var selftext: String
                var thumbnail: String
            }
        }
    }
}





