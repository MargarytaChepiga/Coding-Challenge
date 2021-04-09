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
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "r/swift"
        
        // fetch json on the background thread
        performSelector(inBackground: #selector(fetchJSON), with: nil)
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    // to fix the line under the image
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
       
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.textLabel?.accessibilityIdentifier = "tableView title"
        
        if let url = article.thumbnailUrl,
            let data = try? Data(contentsOf: url) {
            cell.imageView?.image = UIImage(data: data)
        }
        
        return cell
    }
    
    @objc func fetchJSON() {

        guard let url = URL(string: DATA_SOURCE) else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
            return
        }

        if let data = try? Data(contentsOf: url) {
            print("Data: \(data)")
            parse(json: data)
        } else {
            // show error on the main thread
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }

    }

    func parse(json: Data) {
        let decoder = JSONDecoder()

        guard let redditPayload = try? decoder.decode(RedditPayload.self, from: json) else { return }
        
        articles = Article.parseArticles(from: redditPayload)
        print("Parsed downloaded payload into \(articles.count) items: \n\(articles)")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        //tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
    }
 
    @objc func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc =  DetailViewController()
        vc.selectedArticle = articles[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }


}

