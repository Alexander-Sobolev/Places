//
//  MainViewController.swift
//  Places
//
//  Created by Alexander Sobolev on 08.01.2021.
//

import UIKit

class MainViewController: UITableViewController {

    let restaurantNames = [
        "Mirazur", "Noma 2.0", "Asador Etxebarri", "Gaggan",
        "Geranium", "Central", "Mugaritz", "Arpege",
        "Disfrutar", "Maido"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named: restaurantNames[indexPath.row])
        cell.imageView?.layer.cornerRadius = cell.frame.size.height / 2   // Для того чтобы сделать прямоугольники с скругленными краями ставим 65 / 2 вместо cell.frame.size.height / 2
        cell.imageView?.clipsToBounds = true
        
        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
