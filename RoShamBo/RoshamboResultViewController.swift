//
//  RoshamboResultViewController.swift
//  RoShamBo
//
//  Created by Hector Montero on 12/26/16.
//  Copyright © 2016 Hector Montero. All rights reserved.
//

import UIKit

class RoshamboResultViewController: UIViewController {
    
    @IBOutlet weak var resultImageView: UIImageView!
    
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var match: RPSMatch!
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        loadResult()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.5, animations: {
            self.resultImageView.alpha = 1
        })
    }
    
    func loadResult() {
        resultImageView.image = getResultImageMatch()
        resultTextLabel.text = getResultTextMatch()
    }
    
    func getResultTextMatch() -> String {
        var resultText: String = ""
        
        
        switch (match.p1, match.p2) {
        case (.Rock, .Scissors), (.Scissors, .Rock):
            resultText = "Rock crushes scissors, "
            
        case (.Scissors, .Paper), (.Paper, .Scissors):
            resultText = "Scissors cut paper, "
            
        case (.Paper, .Rock), (.Rock, .Paper):
            resultText = "Paper covers rock, "
            
        default:
            resultText = "It's a tie!!!"
        }
        
        if match.winner == match.p1 {
            resultText += "You Win!!!"
        } else if match.winner == match.p2 {
            resultText += "You Lose"
        }
        
        return resultText
    }
    
    func getResultImageMatch() -> UIImage {
        switch (match.p1, match.p2) {
        case (.Rock, .Scissors), (.Scissors, .Rock):
            return UIImage(named: "RockCrushesScissors")!
            
        case (.Scissors, .Paper), (.Paper, .Scissors):
            return UIImage(named: "ScissorsCutPaper")!
            
        case (.Paper, .Rock), (.Rock, .Paper):
            return UIImage(named: "PaperCoversRock")!
            
        default:
            return UIImage(named: "itsATie")!
        }
    }
    
    @IBAction func playAgain(sender: UIButton) {
        /*
        let roshamboVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RoshamboViewController") as! RoshamboViewController
        self.present(roshamboVC, animated: true, completion: nil)
        */
        dismiss(animated: true, completion: nil)
    }
    
}
