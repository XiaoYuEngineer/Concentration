//
//  Concentration.swift
//  Concentration
//
//  Created by xiaoYu on 2018/4/25.
//  Copyright © 2018年 XiaoYu. All rights reserved.
//

import Foundation


class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard:Int?
    
    func chooseCard(at index:Int) {
        
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                if  cards[matchIndex].identifier == cards[index].identifier  {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil

            }else {

                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
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
