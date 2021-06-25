//
//  Favorites.swift
//  SpotibyMusic
//
//  Created by Julia Alberti Maia on 21/06/21.
//

import UIKit

class Favorites: UIViewController, UITableViewDataSource, UITableViewDelegate, FavoriteCellDelegate{
    
    func toggleFavorite(musics: Music) {
        musicService?.toggleFavorite(music: musics, isFavorite: false)
        favMusics = (try? MusicService())?.favoriteMusics ?? []
        tableView.reloadData()
    }
        
    var albumDetails: MusicCollection?

    private var musicService: MusicService? = try? MusicService()
    @IBOutlet weak var tableView: UITableView!
    private var favMusics: [Music] = (try? MusicService())?.favoriteMusics ?? []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let fav = favMusics[section]
        //return fav.artist.count
        return favMusics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favorites-cell", for: indexPath) as! FavoritesCell
        
        
        let fav = favMusics[indexPath.row]
        
        cell.music.text = fav.title
        cell.artist.text = fav.artist
        cell.coverImage.image = UIImage(named: fav.id)
        
        cell.favoriteDelegate = self
        cell.musics = fav
        
        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favMusics = (try? MusicService())?.favoriteMusics ?? []
        tableView.reloadData()
    }
    
}
