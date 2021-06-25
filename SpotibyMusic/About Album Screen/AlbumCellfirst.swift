//
//  AlbumCell.swift
//  SpotibyMusic
//
//  Created by Luiz Eduardo Mello dos Reis on 24/06/21.
//

import UIKit

class AlbumCellfirst: UITableViewCell {
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var albumBy: UILabel!
    @IBOutlet weak var numberOfSongs: UILabel!
    @IBOutlet weak var released: UILabel!
    @IBOutlet weak var albumDescription: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
