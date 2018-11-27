//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

var wordToGuess = String()
var wins = 0
var losses = 0
var numberOfWrongGuess = 0
var allGuesses = String()
var guessesLeft = 7
var answer = ""
var guess = String()
var gameInProgress = true
var hiddenWordtext = ""
var userFoundLetter = false
 var foundIndexes = [Int]()
var guessIndex = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var playerOneInputTextField: UITextField!
    @IBOutlet weak var playerTwoInputTextField: UITextField!
    @IBOutlet weak var NewGame: UIButton!
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var hiddenWord: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerOneInputTextField.delegate = self
        playerTwoInputTextField.delegate = self
    }
    
    func updateHangmanImage() {
        if userFoundLetter == false { // change if person gets wrong letter
            guessesLeft -= 1
            switch guessesLeft {
            case 7:
                hangmanImage.image = UIImage.init(named: "hang1")
            case 6:
                hangmanImage.image = UIImage.init(named: "hang2")
            case 5:
                hangmanImage.image = UIImage.init(named: "hang3")
            case 4:
                hangmanImage.image = UIImage.init(named: "hang4")
            case 3:
                hangmanImage.image = UIImage.init(named: "hang5")
            case 2:
                hangmanImage.image = UIImage.init(named: "hang6")
            case 1:
                hangmanImage.image = UIImage.init(named: "hang7")
            default: break
                
            }
            
        } else {
            userFoundLetter = true
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if playerOneInputTextField.isEnabled == true {
        wordToGuess = playerOneInputTextField.text!
        playerOneInputTextField.resignFirstResponder()
            hiddenWordtext = wordToGuess.map{_ in return "_ "}.reduce("", +)
        print(wordToGuess)
//        if textField == playerTwoInputTextField {
//
//            print("playerTwo textfield")
//        }
        

            // label
            print(hiddenWord)
            hiddenWord.text = hiddenWordtext
            hiddenWord.isHidden = false
            playerOneInputTextField.isEnabled = false

//        print("user entered \(textField.text ?? "nothing entered")")
        }
        guess.append(playerTwoInputTextField.text!)
        allGuesses.append(guess)

        for (index,letter) in wordToGuess.enumerated() {
            if letter.description == guess {
                print("letter \(letter) is in the random word at index \(index)")
                foundIndexes.append(index)
                userFoundLetter = true
            
        }
            for index in foundIndexes {
                let currentIndex = hiddenWordtext.index(hiddenWordtext.startIndex, offsetBy: index)
                hiddenWordtext.remove(at: currentIndex)
                hiddenWordtext.insert(Character(guess), at: currentIndex)
                hiddenWord.text = hiddenWordtext
                guess.removeAll()

            }
            
        }

        return true
    
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if playerOneInputTextField == textField {
            updateHangmanImage()

        }
        if playerTwoInputTextField == textField {
    
    }
//            for (index, letter) in wordToGuess.enumerated() {
//                if letter == Character(string) {
//                    print("letter \(letter) is in the random word at index \(index)")
//                    foundIndexes.append(index)
//                    userFoundLetter = true
//                }
//            }

        
            print(hiddenWord)
        
        
        return true

        }
    
    
}
