//
//  Information.swift
//  CollapseCells
//
//  Created by Fabio Miciano on 19/09/19.
//  Copyright © 2019 Fabio Miciano. All rights reserved.
//

import Foundation

struct Information {
    let title: String
    let description: String
    var expandle: Bool
    
    init(title: String, description: String, expandle: Bool) {
        self.title = title
        self.description = description
        self.expandle = expandle
    }
}
