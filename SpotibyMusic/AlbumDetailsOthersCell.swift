//
//  AlbumDetailsOthersCell.swift
//  SpotibyMusic
//
//  Created by Luiz Eduardo Mello dos Reis on 23/06/21.
//

import UIKit

protocol FavoriteDelegate: AnyObject{
    func didTapFavoriteButton(button: UIButton, fromCell cell: UITableViewCell)
}

class AlbumDetailsOthersCell: UITableViewCell {

    @IBAction func buttonTap(_ sender: UIButton) {
        favoriteDelegate?.didTapFavoriteButton(button: sender, fromCell: self)
    }
    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var coverImage: UIImageView!
        
    @IBOutlet weak var heart: UIButton!
    
    weak var favoriteDelegate: FavoriteDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
