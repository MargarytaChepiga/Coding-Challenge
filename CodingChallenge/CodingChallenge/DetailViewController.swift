//
//  DetailViewController.swift
//  CodingChallenge
//
//  Created by margaret on 2019-06-25.
//  Copyright © 2019 margaret. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedArticle: Article?
    
    var titleLabel: UILabel!
    var textView: UITextView!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(titleLabel)
        
        textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .left
        textView.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            //textView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor)
            textView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
        
        // for testing purposes
        // titleLabel.backgroundColor = UIColor.red
        // textView.backgroundColor = UIColor.green
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let selectedArticle = selectedArticle else { return }
        
        titleLabel.text = selectedArticle.title
        textView.text = selectedArticle.content
        
        print(selectedArticle.content)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
