//
//  NewPlaceViewController.swift
//  Places
//
//  Created by Alexander Sobolev on 12.01.2021.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Убираем линии ниже там где нет контента
        // Remove the lines below where there is no content
        tableView.tableFooterView = UIView()
    }

    // MARK: Table View Delegate
    // Если ячейка имеет индекс 0, вызываем меню для того чтобы пользователь выбрал изображение else должна скрытся клавиатура
    // If the cell has index 0, call the menu for the user to select the image else the keyboard should be hidden
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
}

    
    // MARK: - Text Field Delegate

extension NewPlaceViewController: UITextFieldDelegate {

    // Скрываем клавиатуру по нажатию на Done
    // Hide the keyboard by clicking on Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
    

   
