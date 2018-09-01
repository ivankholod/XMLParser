//
//  TableViewCell.swift
//  XMLParser
//
//  Created by Ivan Kholod on 01.09.2018.
//  Copyright © 2018 Ivan Kholod. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pubDateLabel: UILabel!
    
    var item: RSSItem! {
        didSet {
            titleLabel.text = item.title
            descriptionLabel.text = item.description
            pubDateLabel.text = item.pubDate
        }
    }
    
}
