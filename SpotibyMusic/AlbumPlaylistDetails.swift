//
//  AlbumPlaylistDetails.swift
//  SpotibyMusic
//
//  Created by Julia Alberti Maia on 21/06/21.
//

import UIKit

class AlbumPlaylistDetails: UIViewController, UITableViewDataSource, UITableViewDelegate, FavoriteDelegate {
    
    
    func didTapFavoriteButton(button: UIButton, fromCell cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell),
              let music = albumDetails?.musics[indexPath.row],
              let musicService = musicService,
              let albumDetails = albumDetails
        else {return}
        let isFavorite = musicService.favoriteMusics.contains(music)
        musicService.toggleFavorite(music: music, isFavorite: !isFavorite)
        self.albumDetails = musicService.getCollection(id: albumDetails.id)
        tableView.reloadData()
    }
    
    
    private var musicService: MusicService? = try? MusicService()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumDetails?.musics.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let album = albumDetails?.musics[indexPath.row]
        
        // first cell
        if (indexPath.row == 0){
            let firstCell = tableView.dequeueReusableCell(withIdentifier: "first-cell", for: indexPath) as! AlbumDetailsCell
            
            if let ismusic = album, let albumdetails = albumDetails {
                // configurar primeira celular
                firstCell.coverImage.image = UIImage(named: ismusic.id)
                firstCell.title.text = ismusic.title
                firstCell.subtitle.text = "\(albumdetails.type) by \(ismusic.artist)"
                firstCell.numberOfSongs.text = "\(albumdetails.musics.count) songs"
                
                
                //date
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM d, yyyy"
                
                let dateFromStr = dateFormatter.string(from: albumdetails.referenceDate)
                firstCell.releasedAt.text = "Released \(dateFromStr)"
            }
            
            return firstCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "others-cell2", for: indexPath) as! AlbumDetailsOthersCell
        
        if let ismusic = album, let albumdetails = albumDetails {
            
            cell.favoriteDelegate = self
            
            // configurar a celulas gerais
            cell.coverImage.image = UIImage(named: ismusic.id)
            
            if (albumdetails.type == .album){
                cell.title.text = ismusic.title
                cell.subtitle.text = ismusic.artist
                
            }
            
            else if (albumdetails.type == .playlist){
                cell.title.text = ismusic.title
                cell.subtitle.text = ismusic.artist
            }
        }
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //private var musicService: MusicService? = try? MusicService()
    var albumDetails: MusicCollection?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        //
    }
}
