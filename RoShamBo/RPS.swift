//
//  RPS.swift
//  RoShamBo
//
//  Created by Hector Montero on 12/26/16.
//  Copyright © 2016 Hector Montero. All rights reserved.
//

import Foundation

enum RPS {
    case Rock, Paper, Scissors
    
    init() {
        switch arc4random() % 3 {
        
        case 0:
            self = .Rock
            
        case 1:
            self = .Paper
            
        default:
            self = .Scissors
        }
    }
    
    func defeats(opponent: RPS) -> Bool {
        switch (self, opponent) {
        
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            return true
        
        default:
            return false
        }
    }
}
