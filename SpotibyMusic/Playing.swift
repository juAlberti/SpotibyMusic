//
//  Playing.swift
//  SpotibyMusic
//
//  Created by Julia Alberti Maia on 21/06/21.
//

import UIKit



class Playing: UIViewController,FavoriteCellDelegate {
    
    private var favMusics: [Music] = (try? MusicService())?.favoriteMusics ?? []
    private var musicService: MusicService? = try? MusicService()
    var albumDetails: MusicCollection?
    weak var favoriteDelegate: FavoriteCellDelegate?
    var songInfo: Music?
    
    
    
    
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var songArtist: UILabel!
    
    @IBOutlet weak var songTitle: UILabel!
    
    @IBOutlet weak var buttonFavorite: UIButton!
    
    func toggleFavorite(musics: Music) {
        if let songInfo = songInfo{
            musicService?.toggleFavorite(music: songInfo, isFavorite: false)
            favMusics = (try? MusicService())?.favoriteMusics ?? []
        }
    }
    
    
    @IBAction func buttonTap(_ sender: UIButton) {
        if let songInfo = songInfo{
            let isFavorite = favMusics.contains(songInfo) ? true : false
            let imageName = isFavorite ? "heart" : "heart.fill"
            let imageButton = UIImage(systemName: imageName)
            buttonFavorite.setImage(imageButton, for: .normal)
            favoriteDelegate?.toggleFavorite(musics: songInfo)
            
        }
    }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            favMusics = (try? MusicService())?.favoriteMusics ?? []
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let songinfo = songInfo{
                coverImage.image = UIImage(named: songinfo.id)
                songArtist.text = songinfo.artist
                songTitle.text = songinfo.title
            }
        }
    }
