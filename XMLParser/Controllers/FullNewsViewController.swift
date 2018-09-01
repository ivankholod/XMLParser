//
//  FullNewsViewController.swift
//  XMLParser
//
//  Created by Ivan Kholod on 01.09.2018.
//  Copyright © 2018 Ivan Kholod. All rights reserved.
//

import UIKit

class FullNewsViewController: UIViewController {
    
    var titleForLabel: String?
    var descriptionForLabel: String?
    var pubDateForLabel: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInfo()
    }

    func updateInfo() {
        self.titleLabel.text = titleForLabel
        self.descriptionLabel.text = descriptionForLabel
        self.dateLabel.text = pubDateForLabel
    }
}
