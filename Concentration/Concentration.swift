//
//  Concentration.swift
//  Concentration
//
//  Created by xiaoYu on 2018/4/25.
//  Copyright © 2018年 XiaoYu. All rights reserved.
//

import Foundation


struct Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard:Int? {
        get {
            
            var foundIndex:Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index:Int) {
        
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                if  cards[matchIndex] == cards[index]  {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true

            }else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards:Int) {
        
        var tempcards = [Card]()
        
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            tempcards += [card, card]
        }
        
        // TODO: Shuffle the cards
        
        for _ in 1...numberOfPairsOfCards*2 {
            let randomIndex = Int(arc4random_uniform(UInt32(tempcards.count)))
            let card = tempcards[randomIndex]
            tempcards.remove(at: randomIndex)
            cards.append(card)
        }
    }
}
