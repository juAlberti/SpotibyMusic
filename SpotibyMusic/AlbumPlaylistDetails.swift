//
//  AlbumPlaylistDetails.swift
//  SpotibyMusic
//
//  Created by Julia Alberti Maia on 21/06/21.
//

import UIKit

class AlbumPlaylistDetails: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumDetails?.musics.count ?? 1
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = albumDetails?.musics[indexPath.row]
        
        
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
                
                var dateFromStr = dateFormatter.string(from: albumdetails.referenceDate)
                firstCell.releasedAt.text = "Released \(dateFromStr)"
            }
            
            
            
            
            return firstCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "others-cell2", for: indexPath) as! AlbumDetailsOthersCell
        
        if let ismusic = album, let albumdetails = albumDetails {
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
