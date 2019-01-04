//
//  ViewController.swift
//  Concentration
//
//  Created by BHAVANASINGH on 02/01/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairOfCards: (cardButtons.count+1) / 2)
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBAction func restartGame(_ sender: UIButton) {
        
    }
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardCount = cardButtons.index(of: sender)!
        game.chooseCard(at: cardCount)
        updateViewFromModel()
    }
   
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ?#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        
    }
   
    var emojis = ["👻","🎃","🍭","🤡","🍕","🧚‍♀️","🐼","🦋","🙉","🍸","🍿","🦄","❄️","🏀","🍹","⭐️","🎾"]
    var emojiChoice = [Int:String]()
    
    func emoji(for card: Card) -> String{
        let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
        if emojiChoice[card.identifier] == nil, emojis.count > 0 {
            emojiChoice[card.identifier] = emojis.remove(at: randomIndex)
        }
        return emojiChoice[card.identifier] ?? "?"
    }
    
    
    
    
    
    
}

