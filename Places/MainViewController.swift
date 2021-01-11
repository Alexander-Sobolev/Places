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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell // приводим объект cell к нашему классу as! CustomTableViewCell
        // Отображаем данные в ячейке, приводим объект cell к нашему классу

        cell.nameLable.text = restaurantNames[indexPath.row] // меняем свойства родительского класса UITableViewCell а именно textLabel? на cвойства нашего класса CustomTableViewCell а именно nameLable то есть на те аутлеты которые мы создали
        cell.imageOfPlace.image = UIImage(named: restaurantNames[indexPath.row]) // тут меняем imageView? на imageOfPlace ниже так же меняем на imageOfPlace
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2   // Для того чтобы сделать прямоугольники с скругленными краями ставим 65 / 2 вместо cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
        
        return cell
    }
    
    // MARK: - Table View Delegate
    // Метод определяет высоту строк
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
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
