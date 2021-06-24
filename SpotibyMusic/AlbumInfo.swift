//
//  AlbumInfo.swift
//  SpotibyMusic
//
//  Created by Julia Alberti Maia on 21/06/21.
//

import UIKit

class AlbumInfo: UIViewController {
    
    var album: MusicCollection?
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var AlbumBy: UILabel!
    @IBOutlet weak var numberOfSongs: UILabel!
    @IBOutlet weak var realease: UILabel!
    @IBOutlet weak var descriptionAlbum: UILabel!
    @IBOutlet weak var aboutArtist: UILabel!
    @IBOutlet weak var descriptionArtist: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        if let isAlbum = album{
            coverImage.image = UIImage(named: isAlbum.id)
            albumTitle.text = isAlbum.title
            AlbumBy.text = "Album by \(isAlbum.mainPerson)"
            numberOfSongs.text = "\(isAlbum.musics.count), \(isAlbum.musics.count)"
            let dateFromStr = dateFormatter.string(from: isAlbum.referenceDate)
            realease.text = "Realise in \(dateFromStr)"
            descriptionAlbum.text = isAlbum.albumDescription
            aboutArtist.text = "About \(isAlbum.mainPerson)"
                descriptionArtist.text = isAlbum.albumArtistDescription
        }
        
    }
}
