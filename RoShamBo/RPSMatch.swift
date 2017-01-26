//
//  RPSMatch.swift
//  RoShamBo
//
//  Created by Hector Montero on 12/26/16.
//  Copyright © 2016 Hector Montero. All rights reserved.
//

import Foundation

struct RPSMatch {
    
    let p1: RPS
    let p2: RPS
    
    init(p1: RPS, p2: RPS) {
        self.p1 = p1
        self.p2 = p2
    }
    
    var winner: RPS {
        get {
            return p1.defeats(opponent: p2) ? p1 : p2
        }
    }
    
    var loser: RPS {
        get {
            return p1.defeats(opponent: p2) ? p2 : p1
        }
    }
}
