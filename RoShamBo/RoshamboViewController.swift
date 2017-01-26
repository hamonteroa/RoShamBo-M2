//
//  ViewController.swift
//  RoShamBo
//
//  Created by Hector Montero on 12/26/16.
//  Copyright © 2016 Hector Montero. All rights reserved.
//

import UIKit

class RoshamboViewController: UIViewController {

    @IBOutlet weak var PaperButton: UIButton!
    @IBOutlet weak var RockButton: UIButton!
    @IBOutlet weak var ScissorsButton: UIButton!
    
    var match: RPSMatch!
    
    @IBAction func playRoshambo(_ sender: UIButton) {
        /*
        let alert = UIAlertController(
            title: "Alert Test",
            message: "testing testing",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        */
        
        switch sender {
        case self.PaperButton:
            throwDown(move: .Paper)
            
        case self.RockButton:
            throwDown(move: .Rock)
            
        case self.ScissorsButton:
            throwDown(move: .Scissors)
            
        default:
            assert(false, "An unknow button is invoking playRoshambo()")
        }
    }
    
    func throwDown(move: RPS) {
        
        let rivalMove = RPS()
        self.match = RPSMatch(p1: move, p2: rivalMove)
        
        if move == .Rock {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let resultVC = storyboard.instantiateViewController(withIdentifier: "RoshamboResultViewController") as! RoshamboResultViewController
            
            resultVC.match = self.match
            self.present(resultVC, animated: true, completion: nil)
        
        } else if move == .Paper {
            performSegue(withIdentifier: "throwDownPaper", sender: self)
        } else if move == .Scissors {
            let resultVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RoshamboResultViewController") as! RoshamboResultViewController
            
            resultVC.match = self.match
            self.present(resultVC, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationController = segue.destination as! RoshamboResultViewController
        print("self.match p1: \(self.match.p1), p2: \(self.match.p2)")
        destinationController.match = self.match
    }

}

