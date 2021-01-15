//
//  PlaceModel.swift
//  Places
//
//  Created by Alexander Sobolev on 12.01.2021.
//

import UIKit // Меняем фреймворк Foundation на UIKit который уже содержит фреймворк Foundation // Changing the Foundation framework to UIKit which already contains the Foundation framework

struct Place { // Создаем модель для возможности добавления записей названия, местоположения, типа а так же изображения в нашем приложении
               // We create a model for the ability to add records of name, location, type, as well as an image in our application
    
    var name: String
    var location: String?
    var type: String?
    var image: UIImage?
    var restaurantImage: String?
    
    static let restaurantNames = [ // тут также ставим static // here we also put static
            "Mirazur", "Noma 2.0", "Asador Etxebarri", "Gaggan",
            "Geranium", "Central", "Mugaritz", "Arpege",
            "Disfrutar", "Maido"
        ]
    
    static func getPlaces() -> [Place] { // при добавлении static делаем этот метод статичным или по другому выражаясь методом структуры, в этом случаее данный метод будет доступен не через экземпляр структуры а при непосредственном обращении к самой структуре и те свойства к которым мы обращаемся тоже должны быть статичными тоесть наш массив restaurantNames
    //  when adding static, we make this method static or, in other words, the structure method, in this case, this method will be available not through an instance of the structure, but when directly accessing the structure itself, and the properties to which we refer must also be static, that is, our restaurantNames array
        
        var places = [Place]()
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "France", type: "Restaurant", image: nil, restaurantImage: place))
        }
        
        return places
    }
    
}
