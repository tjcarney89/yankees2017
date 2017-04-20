//
//  GameDataStore.swift
//  Internet Practice
//
//  Created by TJ Carney on 3/9/17.
//  Copyright © 2017 TJ Carney. All rights reserved.
//

import Foundation

class GameDataStore{
    static let sharedInstance = GameDataStore()
    private init() {}
    
    var games = [[Game]]()
    var aprGames = [Game]()
    var mayGames = [Game]()
    var junGames = [Game]()
    var julGames = [Game]()
    var augGames = [Game]()
    var sepGames = [Game]()
    var octGames = [Game]()
    
    //Gets all games in schedule
    func getYankeesGames(completion: @escaping () -> Void) {
        let urlString = "https://api.seatgeek.com/2/events?client_id=NzAyNDgwM3wxNDg5MDY3NjgyLjYy&performers.slug=new-york-yankees&datetime_utc.gte=2017-04-01&per_page=162"
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                if let unwrappedData = data {
                    print(unwrappedData)
                    
                    do{
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String:Any] ?? [:]
                        let eventsJSON = responseJSON["events"] as? [[String:Any]] ?? [[:]]
                        for event in eventsJSON {
                            guard let title = event["title"] as? String else {continue}
                            var newOpponent: String = ""
                            
                            //Convert Date/Time
                            var convertedDate: String = ""
                            var convertedTime: String = ""
                            
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            let newDateFormatter = DateFormatter()
                            newDateFormatter.dateFormat = "MMM d"
                            
                            let timeFormatter = DateFormatter()
                            timeFormatter.dateFormat = "HH-mm-ss"
                            let newTimeFormatter = DateFormatter()
                            newTimeFormatter.dateFormat = "h:mm a"
                            
                            guard let dateTime = event["datetime_local"] as? String else {continue}
                            let dateComponents = dateTime.components(separatedBy: "T")
                            
                            let splitDate = dateComponents[0]
                            let splitTime = dateComponents[1]
    
                            
                            if let date = dateFormatter.date(from: splitDate) {
                                convertedDate = newDateFormatter.string(from: date)
                            }
                            if let time = timeFormatter.date(from: splitTime) {
                                convertedTime = newTimeFormatter.string(from: time)
                            }
                            
                            guard let performers = event["performers"] as? [[String:Any]] else {continue}
                            for performer in performers {
                                guard let opponent = performer["name"] as? String else {continue}
                                if opponent != "New York Yankees" {
                                    newOpponent = opponent
                                }
                            }
                            guard let buyTickets = event["url"] as? String else {continue}
                            guard let venues = event["venue"] as? [String:Any] else {continue}
                            guard let location = venues["name"] as? String else {continue}
                            let game = Game(title: title, opponent: newOpponent, date: convertedDate, time: convertedTime, location: location, buyTickets: buyTickets)
                            if game.date.contains("Apr") {
                                self.aprGames.append(game)
                            } else if game.date.contains("May") {
                                self.mayGames.append(game)
                            } else if game.date.contains("Jun") {
                                self.junGames.append(game)
                            } else if game.date.contains("Jul") {
                                self.julGames.append(game)
                            } else if game.date.contains("Aug") {
                                self.augGames.append(game)
                            } else if game.date.contains("Sep") {
                                self.sepGames.append(game)
                            } else if game.date.contains("Oct") {
                                self.octGames.append(game)
                            }
                            self.games = [self.aprGames, self.mayGames, self.junGames, self.julGames, self.augGames, self.sepGames, self.octGames]
     
                        }
                        
                        completion()
                    
                        
                    } catch {
                        
                    }
                    
                    
                }
                
            }
            
            dataTask.resume()
        }
    }
    
    
}


