//
//  NewPlaceViewController.swift
//  Places
//
//  Created by Alexander Sobolev on 12.01.2021.
//

import UIKit

class NewPlaceViewController: UITableViewController {
    
    var newPlace: Place?
    var imageIsChanged = false
    

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var placeImage: UIImageView! // Добавляем аутлет для работы с изображением // Add an outlet for working with images
    @IBOutlet weak var placeType: UITextField!
    @IBOutlet weak var placeLocation: UITextField!
    @IBOutlet weak var placeName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Убираем линии ниже там где нет контента
        // Remove the lines below where there is no content
        tableView.tableFooterView = UIView()
        
        saveButton.isEnabled = false // По умолчанию кнопка Save будет отключена // The Save button will be disabled by default
        
        placeName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged) // При введении данных кнопка Save становится доступной, при удалении данных кнопка Save становится не доступной // When entering data, the Save button becomes available, when deleting data, the Save button becomes unavailable
    }

    // MARK: - Table View Delegate
    // Если ячейка имеет индекс 0, вызываем меню для того чтобы пользователь выбрал изображение else должна скрытся клавиатура
    // If the cell has index 0, call the menu for the user to select the image else the keyboard should be hidden
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 {
            
            let takeImage = #imageLiteral(resourceName: "camera") // Добавляем иконки в меню // Adding icons to the menu
            let chooseImage = #imageLiteral(resourceName: "photo") // Добавляем иконки в меню // Adding icons to the menu
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet) // При тапе на ячейку с изображением мы вызываем меню AlertController с низа экрана
            // When tapping on a cell with an image, we call the AlertController menu from the bottom of the screen 
            
            
            // Определяем список пользовательских действий в этом меню
            // Define a list of custom actions in this menu
            let camera = UIAlertAction(title: "Take photo", style: .default) { _ in
                self.chooseImagePicker(sourse: .camera)
            }
            
            camera.setValue(takeImage, forKey: "image") // Добавляем иконки в меню // Adding icons to the menu
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment") // Сдвигаем названия влево к иконкам // Move titles left to icons
            
            let photo = UIAlertAction(title: "Choose photo", style: .default) { _ in
                self.chooseImagePicker(sourse: .photoLibrary)
            }
            
            photo.setValue(chooseImage, forKey: "image") // Добавляем иконки в меню // Adding icons to the menu
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment") // Сдвигаем названия влево к иконкам // Move titles left to icons
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
            
        } else {
            view.endEditing(true)
        }
    }
    // При нажатии на кнопку Save мы передаем значение заполненных полей в соответствующее свойство нашей модели // When you click on the Save button, we pass the value of the filled fields to the corresponding property of our model
    func saveNewPlace() {
        
        var image: UIImage?
        
        if imageIsChanged {
            image = placeImage.image
        } else {
            image = #imageLiteral(resourceName: "imagePlaceholder") // Добавляем новое изображение если пользователь не выбрал изображение // Add a new image if the user has not selected an image
        }
        
        newPlace = Place(name: placeName.text!,
                         location: placeLocation.text,
                         type: placeType.text,
                         image: image,
                         restaurantImage: nil)
    }

    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true) // Работаем с кнопкой Cancel // Working with the Cancel button
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
    
    @objc private func textFieldChanged() {
        
        if placeName.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false // Делаем доступной кнопку Save при вводе данных и недоступной при их отсутсвии // We make the Save button available when entering data and unavailable if there is none
        }
    }
}
    
    // MARK: - Work With Image
extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate { // Подписываем под данный протокол UIImagePickerControllerDelegate
    
    // При вызове метода chooseImagePicker в качестве параметра этого метода мы должны определить источник выбора изображения
    // When calling the chooseImagePicker method as a parameter of this method, we must determine the source of the image selection
    func chooseImagePicker(sourse: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(sourse) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self // imagePicker делегирует обязанности по выполнению метода imagePickerController а делегатом будет наш класс
            imagePicker.allowsEditing = true  // Это позволит пользователю редактировать выбранные изображения // This will allow the user to edit the selected images
            imagePicker.sourceType = sourse // Определяем тип источника для выбранного изображения // Determine the type of source for the selected image
            present(imagePicker, animated: true) // Свойство imagePicker фактически является ViewController и для того чтобы отобразить его на экране вызываем метод present // The imagePicker property is actually a ViewController and in order to display it on the screen, we call the present method
            
        }
    }// Вэтом методе присваиваем @IBOutlet weak var imageOfPlace: UIImageView! изображение которое выбирает пользователь
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImage.image = info[.editedImage] as? UIImage // Мы взяли значение по ключу .editedImage и присвоили его как UIImage свойству imageOfPlace для того чтобы использовать отредактированное пользователем изображение // We took the value by the .editedImage key and assigned it as a UIImage to the imageOfPlace property in order to use the user-edited image
        placeImage.contentMode = .scaleAspectFill // Позволяет маcштабировать изображение // Allows you to scale the image
        placeImage.clipsToBounds = true // Обрезка изображения по границе UIImage // Cropping an Image to a UIImage Border
        imageIsChanged = true
        dismiss(animated: true) // Закрываем ImagePickerController // Close ImagePickerController
    }
}
   
