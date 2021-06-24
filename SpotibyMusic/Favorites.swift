//
//  Favorites.swift
//  SpotibyMusic
//
//  Created by Julia Alberti Maia on 21/06/21.
//

import UIKit

class Favorites: UIViewController, UITableViewDataSource, UITableViewDelegate,FavoriteDelegate {
    //identifier: MusicWithImage
    private var musicService: MusicService? = try? MusicService()
    @IBOutlet weak var tableView: UITableView!
    private var favMusics: [Music] = (try? MusicService())?.favoriteMusics ?? []
    
    func didTapFavoriteButton(button: UIButton, fromCell cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell),
              let music = favMusics?.musics[indexPath.row-1],
              let musicService = musicService,
              let albumDetails = favMusics
        else {return}
        let isFavorite = musicService.favoriteMusics.contains(music)
        musicService.toggleFavorite(music: music, isFavorite: !isFavorite)
        self.favMusics = musicService.getCollection(id: favMusics.id)
        tableView.reloadData()
    }
    
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
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(indexPath)")
        
        performSegue(withIdentifier: "MusicWithImage", sender: indexPath)
    }
    
}
