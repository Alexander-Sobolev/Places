//
//  CustomTableViewCell.swift
//  Places
//
//  Created by Alexander Sobolev on 11.01.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // В этом классе объявляем те Outlets которые мы разместим в ячейке
    @IBOutlet weak var imageOfPlace: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var locationLable: UILabel!
    @IBOutlet weak var typeLable: UILabel!
    
}
