//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Marc Hosecloth on 5/7/17.
//  Copyright © 2017 Marc Hosecloth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    var gameTiles = [UIButton]()
    
    var userVictory : Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.isHidden = true
        newGameButton.isHidden = true
        getGameTiles()
        
    }
    
    func getGameTiles() {
        for i in 1..<10 {
            gameTiles.append(self.view.viewWithTag(i) as! UIButton)
        }
    }

    @IBAction func gameTileClicked(_ sender: Any) {
        let gameTile = sender as! UIButton
        
        if gameTile.currentImage == nil {
            gameTile.setImage(#imageLiteral(resourceName: "tic-tac-toe-X") , for: .normal)
            
            checkForUserVictory()
            
            if !userVictory {
                makeAIMove()
            }
            
            checkForTie()
        }
    }
    
    func checkForUserVictory() {
        if (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[1].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            
            (gameTiles[3].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[5].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            
            (gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[7].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            
            (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[3].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            
            (gameTiles[1].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[7].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            
            (gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[5].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            
            (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
                
            (gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) {
            
            gameOverLabel.text = "X Wins"
            gameOverLabel.isHidden = false
            
            newGameButton.isHidden = false
            
            userVictory = true
        }
    }
    
    func makeAIMove() {
        
        // winning plays
        
        if (gameTiles[1].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[3].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) {
            
            if gameTiles[0].currentImage == nil {
                
                gameTiles[0].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                announceAIVictory()
                return
            }
        }
        
        if (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[7].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) {
            
            if gameTiles[1].currentImage == nil {
                gameTiles[1].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                announceAIVictory()
                return
            }
        }
        
        if (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[1].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[5].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) {
            
            if gameTiles[2].currentImage == nil {
                gameTiles[2].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                announceAIVictory()
                return
            }
        }
        
        if (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[5].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) {
            
            if gameTiles[3].currentImage == nil {
                gameTiles[3].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                announceAIVictory()
                return
            }
        }
        
        if (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[1].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[7].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[3].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[5].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) {
            
            if gameTiles[4].currentImage == nil {
                gameTiles[4].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                announceAIVictory()
                return
            }
        }
        
        if (gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[3].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) {
            
            if gameTiles[5].currentImage == nil {
                gameTiles[5].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                announceAIVictory()
                return
            }
        }
        
        if (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[3].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[7].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) {
            
            if gameTiles[6].currentImage == nil {
                gameTiles[6].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                announceAIVictory()
                return
            }
        }
        
        if (gameTiles[1].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) {
            
            if gameTiles[7].currentImage == nil {
                gameTiles[7].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                announceAIVictory()
                return
            }
        }
        
        if (gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[5].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) ||
            (gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O") && gameTiles[7].currentImage == #imageLiteral(resourceName: "tic-tac-toe-O")) {
            
            if gameTiles[8].currentImage == nil {
                gameTiles[8].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                announceAIVictory()
                return
            }
        }
        
        // blocking plays
        
        if (gameTiles[1].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[3].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) {
            
            if gameTiles[0].currentImage == nil {
                gameTiles[0].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                return
            }
        }
        
        if (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[7].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) {
            
            if gameTiles[1].currentImage == nil {
                gameTiles[1].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                return
            }
        }
        
        if (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[1].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[5].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) {
            
            if gameTiles[2].currentImage == nil {
                gameTiles[2].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                return
            }
        }
        
        if (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[5].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) {
            
            if gameTiles[3].currentImage == nil {
                gameTiles[3].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                return
            }
        }
        
        if (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[1].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[7].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[3].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[5].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) {
            
            if gameTiles[4].currentImage == nil {
                gameTiles[4].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                return
            }
        }
        
        if (gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[3].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) {
            
            if gameTiles[5].currentImage == nil {
                gameTiles[5].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                return
            }
        }
        
        if (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[3].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[7].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) {
            
            if gameTiles[6].currentImage == nil {
                gameTiles[6].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                return
            }
        }
        
        if (gameTiles[1].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[8].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) {
            
            if gameTiles[7].currentImage == nil {
                gameTiles[7].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                return
            }
        }
        
        if (gameTiles[2].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[5].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[0].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[4].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) ||
            (gameTiles[6].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X") && gameTiles[7].currentImage == #imageLiteral(resourceName: "tic-tac-toe-X")) {
            
            if gameTiles[8].currentImage == nil {
                gameTiles[8].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
                return
            }
        }

        /*
            best non-winning/non-blocking plays (in order)
        */
        
        // center
        
        if gameTiles[4].currentImage == nil {
            gameTiles[4].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
            return
        }
        
        // corners
        
        if gameTiles[0].currentImage == nil {
            gameTiles[0].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
            return
        }
        
        if gameTiles[2].currentImage == nil {
            gameTiles[2].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
            return
        }
        
        if gameTiles[6].currentImage == nil {
            gameTiles[6].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
            return
        }
        
        if gameTiles[8].currentImage == nil {
            gameTiles[8].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
            return
        }
        
        // edges
        
        if gameTiles[1].currentImage == nil {
            gameTiles[1].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
            return
        }
        
        if gameTiles[3].currentImage == nil {
            gameTiles[3].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
            return
        }
        
        if gameTiles[5].currentImage == nil {
            gameTiles[5].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
            return
        }
        
        if gameTiles[7].currentImage == nil {
            gameTiles[7].setImage(#imageLiteral(resourceName: "tic-tac-toe-O"), for: .normal)
            return
        }
    }
    
    func announceAIVictory() {
        gameOverLabel.text = "O Wins"
        gameOverLabel.isHidden = false
        
        newGameButton.isHidden = false
    }
    
    func checkForTie() {
        if gameTiles[0].currentImage != nil && gameTiles[1].currentImage != nil && gameTiles[2].currentImage != nil &&
            gameTiles[3].currentImage != nil && gameTiles[4].currentImage != nil && gameTiles[5].currentImage != nil &&
            gameTiles[6].currentImage != nil && gameTiles[7].currentImage != nil && gameTiles[8].currentImage != nil{
            
            gameOverLabel.text = "Tie Game"
            gameOverLabel.isHidden = false
            
            newGameButton.isHidden = false
            
        }
    }

    @IBAction func newGameButtonClicked(_ sender: Any) {
        gameOverLabel.isHidden = true
        newGameButton.isHidden = true
        
        for gameTile in gameTiles {
            gameTile.setImage(nil, for: .normal)
        }
        
        userVictory = false
    }
}

