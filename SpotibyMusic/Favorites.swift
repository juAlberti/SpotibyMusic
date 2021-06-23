//
//  Favorites.swift
//  SpotibyMusic
//
//  Created by Julia Alberti Maia on 21/06/21.
//

import UIKit

class Favorites: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //identifier: MusicWithImage
    @IBOutlet weak var tableView: UITableView!
    private var favMusics: [Music] = (try? MusicService())?.favoriteMusics ?? []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return favMusics.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let fav = favMusics[section]
        return fav.artist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicWithImage", for: indexPath)
        let fav = favMusics[indexPath.section]
        
        cell.textLabel?.text = fav.title
        cell.detailTextLabel?.text = fav.artist
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return favMusics[section].title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(indexPath)")
        
        performSegue(withIdentifier: "MusicWithImage", sender: indexPath)
    }
    
}
