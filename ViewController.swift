//
//  ViewController.swift
//  Utilities Swift
//
//  Created by Don Paul on 06/03/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit

struct Section {
    var name: String!
    var items: [String]!
    var itemsId:[String]!
    var collapsed: Bool!
    
    init(name: String, items: [String], itemsId:[String], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.itemsId = itemsId
        self.collapsed = collapsed
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
       override func viewDidLoad() {
        super.viewDidLoad()
           
           // enter the data as shown below 
           
        sections = [
            Section(name: "Cleaing", items: ["Car cleanig", "House cleaning"]),
            Section(name: "Constraction", items: ["Mesonary", "carpentry", "Painting", "Polishing", "Electrical"])
            
        ]
           
           // sample

   }
  
    
}
extension ViewController {
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    // Cell
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell? ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        
        
        let a = "       "
        let b = sections[indexPath.section].items[indexPath.row]
        cell.textLabel?.text =  "\(a)\(b)"
        cell.contentView.backgroundColor = UIColor.clear
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].collapsed! ? 0 : 40.0
    }
    
    // Header
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        
        
        header.titleLabel.text = sections[section].name
        header.arrowLabel.text = ">"
        let fontSize =  19.0
        header.arrowLabel.font = UIFont(name: "Zapfino 17.0", size: CGFloat(fontSize))
        header.arrowLabel.font = UIFont.boldSystemFont(ofSize: 19.0)
        
        header.setCollapsed(sections[section].collapsed)
        
        header.section = section
        header.delegate = self
    
        return header
    }
    
    
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
}

//
// MARK: - Section Header Delegate
//
extension ViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        // Adjust the height of the rows inside the section
        
        table.beginUpdates()
        for i in 0 ..< sections[section].items.count {
            table.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        table.endUpdates()
        
    }
    
    
}
    
