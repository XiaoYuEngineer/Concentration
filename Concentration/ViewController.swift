//
//  ViewController.swift
//  Concentration
//
//  Created by xiaoYu on 2018/4/25.
//  Copyright © 2018年 XiaoYu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    
    var numberOfPairsOfCards:Int {
//        get {
            return (cardButtons.count+1)/2
//        }
    }
    
    
    var flipCount = 0 {
        didSet {
            flipLabel.text = "Flips:\(flipCount)"
        }
    }
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["👻","🎃","👹","🤡","👿","👾","💩","👁","👨🏻‍✈️","🐼"]
    var emoji = [Card:String]()
    
    func emoji(for card:Card) -> String{
        
        if  emoji[card] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card] ?? "?"
    }
}

