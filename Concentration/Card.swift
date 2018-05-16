//
//  Card.swift
//  Concentration
//
//  Created by xiaoYu on 2018/4/25.
//  Copyright © 2018年 XiaoYu. All rights reserved.
//

import Foundation

struct Card : Hashable {
    
    var hashValue:Int {return identifier}
    
    //Equatable Protocol
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier:Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        identifier = Card.getUniqueIdentifier()
    }
}
