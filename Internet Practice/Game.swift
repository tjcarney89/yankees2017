//
//  GameDataStore.swift
//  Internet Practice
//
//  Created by TJ Carney on 3/9/17.
//  Copyright © 2017 TJ Carney. All rights reserved.
//

import Foundation

class Game {
    
    var title: String
    var opponent: String
    var date: String
    var time: String
    var location: String
    var buyTickets: String
    
    init(title: String, opponent: String, date: String, time: String, location: String, buyTickets: String) {
        self.title = title
        self.opponent = opponent
        self.date = date
        self.time = time
        self.location = location
        self.buyTickets = buyTickets
    }
}

extension Game: CustomStringConvertible {
    var description: String {
        return "Title: \(title), Opponent: \(opponent), Date: \(date), Time: \(time), Location: \(location), Buy Tickets: \(buyTickets)"
    }
}
