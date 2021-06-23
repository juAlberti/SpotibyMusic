//
//  FavoritesCell.swift
//  SpotibyMusic
//
//  Created by Luiz Eduardo Mello dos Reis on 23/06/21.
//

import UIKit

class FavoritesCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var music: UILabel!
    
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var isFavorite: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
