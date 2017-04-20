//
//  GameDetailViewController.swift
//  Internet Practice
//
//  Created by TJ Carney on 3/9/17.
//  Copyright © 2017 TJ Carney. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var opponentImage: UIImageView!
    
    
    var date: String = ""
    var time: String = ""
    var location: String = ""
    var gameTitle: String = ""
    var opponent: String = ""
    var url: String = ""
    


    override func viewDidLoad() {
        super.viewDidLoad()

        
        dateLabel.text = "Date: \(date), 2017"
        timeLabel.text = "Time: \(time)"
        locationLabel.text = "Location: \(location)"
        titleLabel.text = gameTitle
        
        opponentImage.image = teamToLogo(team: opponent)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Set team logos
    
    func teamToLogo(team: String) -> UIImage {
        var image = UIImage(named: "Yankees")
        switch team {
        case "Tampa Bay Rays":
            if let rays = UIImage(named: "Rays") {
                image = rays
            }
        case "Baltimore Orioles":
            if let orioles = UIImage(named: "Orioles Logo") {
                image = orioles
            }
        case "St. Louis Cardinals":
            if let cards = UIImage(named: "Cardinals") {
                image = cards
            }
        case "Chicago White Sox":
            if let whiteSox = UIImage(named: "White Sox") {
                image = whiteSox
            }
        case "Pittsburgh Pirates":
            if let pirates = UIImage(named: "Pirates") {
                image = pirates
            }
        case "Boston Red Sox":
            if let redSox = UIImage(named: "Red Sox") {
                image = redSox
            }
        case "Toronto Blue Jays":
            if let jays = UIImage(named: "Blue Jays") {
                image = jays
            }
        case "Chicago Cubs":
            if let cubs = UIImage(named: "Cubs") {
                image = cubs
            }
        case "Cincinnati Reds":
            if let reds = UIImage(named: "Reds") {
                image = reds
            }
        case "Houston Astros":
            if let astros = UIImage(named: "Astros") {
                image = astros
            }
        case "Kansas City Royals":
            if let royals = UIImage(named: "Royals") {
                image = royals
            }
        case "Oakland Athletics":
            if let As = UIImage(named: "A's") {
                image = As
            }
        case "Los Angeles Angels":
            if let angels = UIImage(named: "Angels") {
                image = angels
            }
        case "Texas Rangers":
            if let rangers = UIImage(named: "Rangers") {
                image = rangers
            }
        case "Milwaukee Brewers":
            if let brewers = UIImage(named: "Brewers") {
                image = brewers
            }
        case "Minnesota Twins":
            if let twins = UIImage(named: "Twins") {
                image = twins
            }
        case "Seattle Mariners":
            if let mariners = UIImage(named: "Mariners") {
                image = mariners
            }
        case "Detroit Tigers":
            if let tigers = UIImage(named: "Tigers") {
                image = tigers
            }
        case "Cleveland Indians":
            if let indians = UIImage(named: "Indians") {
                image = indians
            }
        case "New York Mets":
            if let mets = UIImage(named: "Mets") {
                image = mets
            }
        default:
            if let yankees = UIImage(named: "Yankees") {
                image = yankees
            }
        }
        return image!
    }
    
    //Link to SeatGeak to buy tickets
    
    @IBAction func buyTickets(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: url)!)
        
    }

}
