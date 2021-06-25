//
//  FavoritesCell.swift
//  SpotibyMusic
//
//  Created by Luiz Eduardo Mello dos Reis on 23/06/21.
//

import UIKit

protocol FavoriteCellDelegate: AnyObject {
    func toggleFavorite(musics: Music)
}


class FavoritesCell: UITableViewCell {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var music: UILabel!
    
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var isFavorite: UIButton!
    
    
    @IBAction func buttonTap(_ sender: UIButton) {
        if let musics = musics{
            favoriteDelegate?.toggleFavorite(musics: musics)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    weak var favoriteDelegate: FavoriteCellDelegate?
    var musics: Music?
}
