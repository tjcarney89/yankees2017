//
//  GamesTableViewController.swift
//  Internet Practice
//
//  Created by TJ Carney on 3/9/17.
//  Copyright © 2017 TJ Carney. All rights reserved.
//

import UIKit

class GamesTableViewController: UITableViewController {
    
 

    let sections = ["April", "May", "June", "July", "August", "September", "October"]
    let sidebar = ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"]
    let store = GameDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.getYankeesGames {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                //print(self.store.games)
            }
        }


    }

        // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return store.games.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Avenir Next", size: 22)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.sidebar
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store.games[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as! GameTableViewCell
        let currentDate = store.games[indexPath.section][indexPath.row].date
        let currentOpponent = store.games[indexPath.section][indexPath.row].opponent
        let currentLocation = store.games[indexPath.section][indexPath.row].location
        cell.dateLabel.text = "\(currentDate):"
        cell.opponentLabel.text = currentOpponent
        
        if currentLocation == "Yankee Stadium" {
            cell.backgroundColor = UIColor.white
            cell.dateLabel.textColor = UIColor(red: 0.0235, green: 0, blue: 0.498, alpha: 1.0)
            cell.opponentLabel.textColor = UIColor(red: 0.0235, green: 0, blue: 0.498, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor(red: 0.0235, green: 0, blue: 0.498, alpha: 1.0)
            cell.dateLabel.textColor = UIColor.white
            cell.opponentLabel.textColor = UIColor.white
        }
        
        return cell
    }
 
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? GameDetailViewController, let indexPath = tableView.indexPathForSelectedRow {
            destVC.date = store.games[indexPath.section][indexPath.row].date
            destVC.time = store.games[indexPath.section][indexPath.row].time
            destVC.location = store.games[indexPath.section][indexPath.row].location
            destVC.gameTitle = store.games[indexPath.section][indexPath.row].title
            destVC.opponent = store.games[indexPath.section][indexPath.row].opponent
            destVC.url = store.games[indexPath.section][indexPath.row].buyTickets
        }
        
    }

    
}
