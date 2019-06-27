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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // unwrapp the detailItem if it has a value
        // guard let selectedArticle = selectedArticle else { return }
        
       
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
