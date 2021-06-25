//
//  AlbumPlaylistDetails.swift
//  SpotibyMusic
//
//  Created by Julia Alberti Maia on 21/06/21.
//

import UIKit

class AlbumPlaylistDetails: UIViewController, UITableViewDataSource, UITableViewDelegate, FavoriteDelegate {
    
    
    var albumDetails: MusicCollection?
    private var musicService: MusicService? = try? MusicService()

    
    @IBAction func infoAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "aboutAlbum", sender: nil)
    }
    
    
    
    func didTapFavoriteButton(button: UIButton, fromCell cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell),
              let music = albumDetails?.musics[indexPath.row-1],
              let musicService = musicService,
              let albumDetails = albumDetails
        else {return}
        let isFavorite = musicService.favoriteMusics.contains(music)
        musicService.toggleFavorite(music: music, isFavorite: !isFavorite)
        self.albumDetails = musicService.getCollection(id: albumDetails.id)
        tableView.reloadData()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (albumDetails?.musics.count ?? 1) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // first cell
        if (indexPath.row == 0){
            let firstCell = tableView.dequeueReusableCell(withIdentifier: "first-cell", for: indexPath) as! AlbumDetailsCell
            
            if let albumdetails = albumDetails {
                           // configurar primeira celular
                firstCell.coverImage.image = UIImage(named: albumdetails.id)
                firstCell.title.text = albumdetails.title
                firstCell.subtitle.text = "\(albumdetails.type) by \(albumdetails.mainPerson)"
                firstCell.numberOfSongs.text = "\(albumdetails.musics.count) songs"
                
                
                //date
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM d, yyyy"
                
                let dateFromStr = dateFormatter.string(from: albumdetails.referenceDate)
                firstCell.releasedAt.text = "Released \(dateFromStr)"
            }
            
            return firstCell
        }
        
        let album = albumDetails?.musics[indexPath.row-1]
        let cell = tableView.dequeueReusableCell(withIdentifier: "others-cell2", for: indexPath) as! AlbumDetailsOthersCell
        
        if let ismusic = album {
            cell.favoriteDelegate = self
            
            // configurar a celulas gerais
            cell.coverImage.image = UIImage(named: ismusic.id)
    
            cell.title.text = ismusic.title
            cell.subtitle.text = ismusic.artist
            
            let isFavorite = musicService?.favoriteMusics.contains(ismusic) ?? false
            let imageName = isFavorite ? "heart.fill" : "heart"
            let imageButton = UIImage(systemName: imageName)
            cell.heart.tintColor = isFavorite ? .red : .red
            cell.heart.setImage(imageButton, for: .normal)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "playingSegue", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playingSegue", let indexPath = sender as? IndexPath {
            let destination = segue.destination as? UINavigationController
            
            let playing = destination?.viewControllers.first as? Playing
            playing?.songInfo = albumDetails?.musics[indexPath.row-1]
        }
        
        if segue.identifier == "aboutAlbum"{
            let destination = segue.destination as? UINavigationController
            let albuminfo = destination?.viewControllers.first as? AlbumInfo
            albuminfo?.album = albumDetails
        }

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.albumDetails = musicService?.favoriteMusics as [Music]? ?? []
//        tableView.reloadData()
//    }
    @IBOutlet weak var tableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
}
