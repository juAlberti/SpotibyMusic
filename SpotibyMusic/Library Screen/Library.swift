//
//  Library.swift
//  SpotibyMusic
//
//  Created by Julia Alberti Maia on 21/06/21.
//

import UIKit
//card-detail
class Library: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    private var musicService: MusicService? = try? MusicService()
    private var albumPlaylistCollection: [MusicCollection] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumPlaylistCollection = musicService?.loadLibrary() ?? []
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumPlaylistCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "others-cell", for: indexPath) as! LibraryCellsTableViewCell
        
        // configurar a celula
        let album = albumPlaylistCollection[indexPath.row]
        
        cell.coverImage.image = UIImage(named: album.id)
        cell.title.text = album.title
        cell.subtitle.text = "\(album.type) · \(album.mainPerson)"
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "albumDetails", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "albumDetails", let indexPath = sender as? IndexPath {
            let destination = segue.destination as? AlbumPlaylistDetails
            destination?.albumDetails = albumPlaylistCollection[indexPath.row]
        }
    }
}
