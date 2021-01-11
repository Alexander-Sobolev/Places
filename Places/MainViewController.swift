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
    // Метод numberOfRowsInSection позволяет отобразить колличество строк необходимое для работы с таблицей
    // Method numberOfRowsInSection allows you to display the number of rows required to work with the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    // В данном методе cellForRowAt indexPath работаем над контентом который отображается в самой ячейке
    // In this method, cellForRowAt indexPath, we work on the content that is displayed in the cell itself
    // Метод .dequeueReusableCell это идентификатор переиспользуемой ячейки
    // The .dequeueReusableCell method is the identifier of the reused cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell // приводим объект cell к нашему классу as! CustomTableViewCell
            // cast the cell object to our CustomTableViewCell class

        cell.nameLable.text = restaurantNames[indexPath.row] // меняем свойства родительского класса UITableViewCell а именно textLabel? на cвойства нашего класса CustomTableViewCell а именно nameLable то есть на те аутлеты которые мы создали
        //  change the properties of the parent class UITableViewCell namely textLabel? to the properties of our CustomTableViewCell class, namely nameLable, that is, to those outlets that we created
        cell.imageOfPlace.image = UIImage(named: restaurantNames[indexPath.row]) // тут меняем imageView? на imageOfPlace ниже так же меняем на imageOfPlace
        //  change the imageView here? on imageOfPlace below also change to imageOfPlace
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2   // Для того чтобы сделать прямоугольники с скругленными краями ставим 65 / 2 вместо cell.imageOfPlace.frame.size.height / 2
        //  In order to make rectangles with rounded edges, put 65/2 instead of cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true // обрезаем изображение по границам imageView при помощи свойсва .clipsToBounds
        //  clip the image to the borders of the imageView using the .clipsToBounds property
        
        return cell
    }
    
    // MARK: - Table View Delegate
    // Метод который определяет высоту строк heightForRowAt indexPath
    // The method that determines the height of the rows: heightForRowAt indexPath
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
