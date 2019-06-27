//
//  ViewController.swift
//  CodingChallenge
//
//  Created by margaret on 2019-06-25.
//  Copyright © 2019 margaret. All rights reserved.
//

import UIKit

class ArticlesFeedViewController: UITableViewController {
    // to store parsed data
    var articles = [ArticleInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "r/swift"
        
        // fetch json on the background thread
        performSelector(inBackground: #selector(fetchJSON), with: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = UIEdgeInsets.zero
        }
        if cell.responds(to: #selector(setter: UIView.preservesSuperviewLayoutMargins)) {
            cell.preservesSuperviewLayoutMargins = false
        }
        if cell.responds(to: #selector(setter: UIView.layoutMargins)) {
            cell.layoutMargins = UIEdgeInsets.zero
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // resetting the image to avoid image appearance in cells that shoundn't
        // have the image
        cell.imageView?.image = nil
        // TODO:
        // DO i need self here?
        let article = self.articles[indexPath.row]
        cell.textLabel?.text = article.data.title
        // Check whether a thumbnail contains an image url
        if article.data.thumbnail.contains("https") {
            print(article.data.thumbnail)
            // TODO:
            // DO I need to create an extra variable here?
            let thumbUrl = article.data.thumbnail
            // If it does, create a URL object from the remote image url string
            if let url = URL(string: thumbUrl) {
                // TODO:
                // Why did you use try?
                
                // create data object using which we can create image object
                if let data = try? Data(contentsOf: url) {
                    cell.imageView?.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
    
    @objc func fetchJSON() {
        
        let urlString = "https://www.reddit.com/r/swift.json"
       
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            } else {
                // show error on the main thread
                performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
            }
        } else {
            // show error on the main thread
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
       
        if let jsonArticles = try? decoder.decode(Articles.self, from: json) {
            
            articles = jsonArticles.data.children
            print(articles)
            print(articles.count)
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
            
        }
    }
    
    @objc func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.selectedArticle = articles[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }


}

