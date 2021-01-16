//
//  MainViewController.swift
//  Places
//
//  Created by Alexander Sobolev on 08.01.2021.
//

import UIKit

class MainViewController: UITableViewController {

//    let restaurantNames = [
//        "Mirazur", "Noma 2.0", "Asador Etxebarri", "Gaggan",
//        "Geranium", "Central", "Mugaritz", "Arpege",
//        "Disfrutar", "Maido"
//    ]

    var places = Place.getPlaces()
    // Меняем массив [Place(name: "Mirazur", location: "France", type: "Restaurant", image: "Mirazur")] на Place.getPlaces()
    // Change the array [Place (name: "Mirazur", location: "France", type: "Restaurant", image: "Mirazur")] to Place.getPlaces ()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source
    // Метод numberOfRowsInSection позволяет отобразить колличество строк необходимое для работы с таблицей
    // Method numberOfRowsInSection allows you to display the number of rows required to work with the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    // В данном методе cellForRowAt indexPath работаем над контентом который отображается в самой ячейке
    // In this method, cellForRowAt indexPath, we work on the content that is displayed in the cell itself
    // Метод .dequeueReusableCell это идентификатор переиспользуемой ячейки
    // The .dequeueReusableCell method is the identifier of the reused cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell // приводим объект cell к нашему классу as! CustomTableViewCell
            // cast the cell object to our CustomTableViewCell class

        cell.nameLable.text = places[indexPath.row].name // 2. меняем массив restaurantNames на places и в конце добавляем свойство .name так из массива places мы вытаскиваем конкретно объект name 1.меняем свойства родительского класса UITableViewCell а именно textLabel? на cвойства нашего класса CustomTableViewCell а именно nameLable то есть на те аутлеты которые мы создали
        //  2. change the array restaurantNames to places and at the end add the .name property so from the places array we pull out the name object specifically 1. change the properties of the parent class UITableViewCell namely textLabel? to the properties of our CustomTableViewCell class, namely nameLable, that is, to those outlets that we created
        cell.imageOfPlace.image = UIImage(named: places[indexPath.row].restaurantImage!) // 2. меняем массив restaurantNames на places и в конце добавляем свойство .image так из массива places мы вытаскиваем конкретно объект image 1. тут меняем imageView? на imageOfPlace ниже так же меняем на imageOfPlace
        //  2. change the array restaurantNames to places and at the end add the .image property so from the places array we pull out the image object specifically 1. change the imageView here? on imageOfPlace below also change to imageOfPlace
        cell.locationLable.text = places[indexPath.row].location // Присваиваем свойству location конкретное значение
        //  Assigning a specific value to the location property
        cell.typeLable.text = places[indexPath.row].type // Присваиваем свойству type конкретное значение
        //  Assigning a specific value to the type property
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2   // Для того чтобы сделать прямоугольники с скругленными краями ставим 65 / 2 вместо cell.imageOfPlace.frame.size.height / 2
        //  In order to make rectangles with rounded edges, put 65/2 instead of cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true // обрезаем изображение по границам imageView при помощи свойсва .clipsToBounds
        //  clip the image to the borders of the imageView using the .clipsToBounds property
        
        return cell
    }
    
    // MARK: - Table View Delegate
    // Метод который определяет высоту строк heightForRowAt indexPath
    // The method that determines the height of the rows: heightForRowAt indexPath
    //override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //  return 85   // Высоту строки мы настроили через Интерфейсбилдер поэтому данные строки кода можно удалять, но я оставлю для общего понимания // We adjusted the height of the line through the Interface Builder, so these lines of code can be deleted, but I'll leave it for general understanding
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        
        newPlaceVC.saveNewPlace()
        places.append(newPlaceVC.newPlace!) // Ставим принудительное извлечение опционала так как мы не сможем нажать на кнопу Save если не введем какое либо значение а данный метод в котором мы работаем вызывается только при нажатии на кнопку Save // We set the forced extraction of the optional since we cannot click on the Save button if we do not enter any value and this method in which we are working is called only when we click on the Save button
        tableView.reloadData() // Обновляем интерфейс // Updating the interface
    } // Объявляем метод для выхода с TabelView New Places на Table View My Best Restaurants // Declaring a method to exit from TableView New Places to Table View My Best Restaurants
    // Мы не будем реализовывать этот метод, нам просто нужно чтобы мы могли на него сослаться и закрепить кнопку Cancel // We won't be implementing this method, we just need to be able to reference it and fix the Cancel button
    // Переименовываем метод cancelAction на unwindSegue и связываем его с кнопкой Save // Rename the cancelAction method to unwindSegue and associate it with the Save button
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   
    

