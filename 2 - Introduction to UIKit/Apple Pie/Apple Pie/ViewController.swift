//
//  ViewController.swift
//  Apple Pie
//
//  Created by Kaan Baylas on 30.08.2019.
//  Copyright © 2019 Kaan Baylas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    var listOfWords : [String] = ["apple", "kaan", "drawing"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    {
        didSet
        {
            newRound()
        }
    }
    var totalLosses = 0
    {
        didSet
        {
            newRound()
        }
    }
    
    var score = 0
    
    var currentGame: Game!
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var scoringTable: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        newRound()
    }

    @IBAction func buttonPressed(_ sender: UIButton)
    {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        scoringUpdate(letter: letter)
        updateGameState()
    }
    
    func newRound()
    {
        
        if !listOfWords.isEmpty{
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        enableLetterButtons(true)
        updateUI()
        }
        else
        {
            enableLetterButtons(false)
        }
    }
    
    func updateUI()
    {
        var letters = [String]()
        
        letters = [String(currentGame.formattedWord.map{$0})]
        
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        scoringTable.text = "Score: \(score)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    func updateGameState()
    {
        if currentGame.incorrectMovesRemaining == 0
        {
            totalLosses += 1
        }
        else if currentGame.word == currentGame.formattedWord
        {
            totalWins += 1
            score += 2
            updateUI()
        }
        else
        {
            updateUI()
        }
    }
    
    func enableLetterButtons(_ enable: Bool)
    {
        for button in letterButtons
        {
            button.isEnabled = enable
        }
    }
    
    func scoringUpdate(letter: Character)
    {
        if currentGame.word.contains(letter)
        {
            score += 1
        }
    }
    
    @IBAction func fullWordGuessed(_ sender: UITextField)
    {
        let text = sender.text
        
        if text?.lowercased() == currentGame.word.lowercased()
        {
            totalWins += 1
        }
    }
    
    
}
