

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
