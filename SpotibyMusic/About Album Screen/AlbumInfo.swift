//
//  AlbumInfo.swift
//  SpotibyMusic
//
//  Created by Julia Alberti Maia on 21/06/21.
//

import UIKit

class AlbumInfo: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var album: MusicCollection?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if (indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "albumcell-first", for: indexPath) as! AlbumCellfirst
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy"
            
            if let isAlbum = album{
                let dateFromStr = dateFormatter.string(from: isAlbum.referenceDate)
                
                
                cell.coverImage.image = UIImage(named: isAlbum.id)
                cell.albumTitle.text = isAlbum.title
                cell.albumBy.text = "Album by \(isAlbum.mainPerson)"
                cell.numberOfSongs.text = "\(isAlbum.musics.count) songs, \(isAlbum.musics.count)"
                cell.released.text = "Realise in \(dateFromStr)"
                cell.albumDescription.text = isAlbum.albumDescription
            }
            return cell
        }
        let cellsecond = tableView.dequeueReusableCell(withIdentifier: "albumcell-second", for: indexPath) as! AlbumCellsecond
        if let isAlbum = album{

            cellsecond.aboutArtist.text = "About \(isAlbum.mainPerson)"
            cellsecond.aboutArtistDescription.text = isAlbum.albumArtistDescription
        }
        
        return cellsecond
    }
}
