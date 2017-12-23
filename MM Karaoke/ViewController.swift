//
//  ViewController.swift
//  MM Karaoke
//
//  Created by Vansa Pha on 21/12/2017.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    let dataSource = [
        [
            "SONG_TITLE" : "Wedding dress",
            "ARTIST" : "Tae Yang",
            "AVATAR" : "https://pbs.twimg.com/profile_images/488363262220591106/7_gkRnzP.jpeg"
        ],
        [
            "SONG_TITLE" : "Mad",
            "ARTIST" : "Ne Yo",
            "AVATAR" : "http://www.rap-up.com/app/uploads/2014/12/ne-yo.jpg"
        ],
        [
            "SONG_TITLE" : "Take me to your heart",
            "ARTIST" : "Michael learn to rock",
            "AVATAR" : "https://4.bp.blogspot.com/-vW4rmDzhtuE/Vwnw9DRaVmI/AAAAAAAAFAU/6jFQaEhXfSMklEowN6Ohn_fwoiCtu16iA/s1600/5511988_20131017045918.png"
        ],
        [
            "SONG_TITLE" : "Look at only me",
            "ARTIST" : "Tae Yang",
            "AVATAR" : "https://pbs.twimg.com/profile_images/488363262220591106/7_gkRnzP.jpeg"
        ],
        [
            "SONG_TITLE" : "The way you look at me",
            "ARTIST" : "Christian Beautista",
            "AVATAR" : "http://lifestyle.inquirer.net/files/2016/04/christian-bautista-picture.jpg"
        ],
        [
            "SONG_TITLE" : "With you",
            "ARTIST" : "Tae Yang",
            "AVATAR" : "https://pbs.twimg.com/profile_images/488363262220591106/7_gkRnzP.jpeg"
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCustomNavigation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    func initCustomNavigation() {
        let myImageView = UIImageView(image: #imageLiteral(resourceName: "mmlogo"))
        myImageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = myImageView
    }

    @IBAction func playMusicAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SongTableViewCell {
            let icon = dataSource[indexPath.row]["AVATAR"]
            let song = dataSource[indexPath.row]["SONG_TITLE"]
            let artist = dataSource[indexPath.row]["ARTIST"]
            cell.configurationCell(icon: icon!, song: song!, artist: artist!)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}


















