//
//  TableViewController.swift
//  XMLParser
//
//  Created by Ivan Kholod on 01.09.2018.
//  Copyright © 2018 Ivan Kholod. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
   var rssItems: [RSSItem]?
   var rssURL = "https://developers.apple.com/news/rss/news.rss"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableViewAutomaticDimension

        fetchData()
    }
    
    private func fetchData() {
        let feedParser = FeedParser()
        feedParser.parseFeed(url:rssURL) { (rssItem) in
            self.rssItems = rssItem
            OperationQueue.main.addOperation {
                 self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let rssItems = rssItems else {
            return 0
        }
        
        return rssItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        if let item = rssItems?[indexPath.item] {
            cell.item = item
        }
            return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "FullNewsViewController") as? FullNewsViewController else {return}
        
        guard let cell = tableView.cellForRow(at: indexPath) as? TableViewCell else {return}
        
        vc.titleForLabel = cell.titleLabel.text ?? "Sorry :("
        vc.descriptionForLabel = cell.descriptionLabel.text ?? "No info"
        vc.pubDateForLabel = cell.pubDateLabel.text ?? "No info"
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
