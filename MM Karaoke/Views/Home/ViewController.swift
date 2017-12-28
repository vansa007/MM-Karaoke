//
//  ViewController.swift
//  MM Karaoke
//
//  Created by Vansa Pha on 21/12/2017.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var playerViewBottomCon: NSLayoutConstraint!
    var dataSource = [[String:String]]()
    let apiAllSongsKey = "http://192.168.2.4/mmk/index.php/api/listallsongs"
    typealias CompletionHandler = (_ Success: Bool) -> ()
    var refreshController = UIRefreshControl()
    
    let songViewModel = SongViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCustomNavigation()
        self.myTableView.refreshControl = self.refreshController
        self.myTableView.refreshControl?.addTarget(self, action: #selector(self.pullToRefresh), for: .valueChanged)
        ShareInstance.App.USER_ID = "9876543210"
        if ShareInstance.App.TOKEN_KEY.isEmpty {
            songViewModel.getToken(id: ShareInstance.App.USER_ID)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        self.fetchData(url: apiAllSongsKey) { (status) in
//            if status {
//                self.myTableView.reloadData()
//            }
//        }
    }
    
    func initCustomNavigation() {
        let myImageView = UIImageView(image: #imageLiteral(resourceName: "mmlogo"))
        myImageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = myImageView
    }
    
    @objc func pullToRefresh() {
//        self.fetchData(url: apiAllSongsKey) { (status) in
//            self.refreshController.endRefreshing()
//            if status {
//                self.myTableView.reloadData()
//            }
//        }
        self.songViewModel.getAllSongs()
        self.refreshController.endRefreshing()
    }
    
    func fetchData(url: String, handler: @escaping CompletionHandler) {
        Alamofire.request(url).responseJSON { (response) in
            if response.result.error == nil {
                guard let json = response.result.value as? Dictionary<String, AnyObject> else { return }
                if let data = json["data"] as? Array<Dictionary<String, String>> {
                    self.dataSource = data
                    print("response data: ", data)
                }
                handler(true)
            }else {
                handler(false)
            }
        }
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
            let icon = ""//dataSource[indexPath.row]["AVATAR"]
            let song = dataSource[indexPath.row]["song_title"]
            let artist = dataSource[indexPath.row]["song_artist"]
            cell.configurationCell(icon: icon, song: song!, artist: artist!)
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


















