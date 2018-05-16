//
//  Card.swift
//  Concentration
//
//  Created by xiaoYu on 2018/4/25.
//  Copyright © 2018年 XiaoYu. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier:Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        identifier = Card.getUniqueIdentifier()
    }
}
