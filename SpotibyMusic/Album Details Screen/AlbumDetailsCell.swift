//
//  AlbumDetailsCell.swift
//  SpotibyMusic
//
//  Created by Luiz Eduardo Mello dos Reis on 22/06/21.
//

import UIKit

class AlbumDetailsCell: UITableViewCell {
    
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var numberOfSongs: UILabel!
    
    @IBOutlet weak var releasedAt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }


}
