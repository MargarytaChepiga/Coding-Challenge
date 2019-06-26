//
//  DetailViewController.swift
//  CodingChallenge
//
//  Created by margaret on 2019-06-25.
//  Copyright © 2019 margaret. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    var webView: WKWebView!
    var selectedArticle: ArticleInfo?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // unwrapp the detailItem if it has a value
        guard let selectedArticle = selectedArticle else { return }
        
        let html = """
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <style>
                    body {
                        font-size: 150%;
        background-color: #F8F9F9;
                    }
                    h4 {
                        text-align: center;
                    }
                    div {
                        margin-left: 20px;
                        margin-right: 20px;
                        padding: 5px 10px 5px 10px;
                        border: 1px solid #ABB2B9  ;
                        background-color: white;
                        box-shadow: 10px 10px #D6DBDF;
                    }
        
            </style>
        </head>
        <body>
            <div>
                <h4>\(selectedArticle.data.title)</h4>
                <hr>
                <p>
                    \(selectedArticle.data.selftext)
                </p>
            </div>
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
        
    }
    


}
