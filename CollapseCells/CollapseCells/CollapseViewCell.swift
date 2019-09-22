//
//  CollapseViewCell.swift
//  CollapseCells
//
//  Created by Fabio Miciano on 21/09/19.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import UIKit

class CollapseViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var information: UILabel!
    
    func set(content: Information) {
        self.title.text = content.title
        self.information.text = content.expandle ? content.description : ""
    }
}
