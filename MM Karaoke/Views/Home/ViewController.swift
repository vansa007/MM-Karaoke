//
//  ViewController.swift
//  MM Karaoke
//
//  Created by Vansa Pha on 21/12/2017.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import UIKit
//import Alamofire
//import RxSwift
//import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var playerViewBottomCon: NSLayoutConstraint!
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
        
    }
    
    func initCustomNavigation() {
        let myImageView = UIImageView(image: #imageLiteral(resourceName: "mmlogo"))
        myImageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = myImageView
    }
    
    @objc func pullToRefresh() {
        bindViewAndViewModel()
    }
    
    func bindViewAndViewModel() {
        songViewModel.getAllSongs { (error) in
            self.refreshController.endRefreshing()
            if error == nil {
                self.myTableView.reloadData()
            }else {
                self.setAlertViewController(myTitle: "Warning", myMessage: "Network error, can not connect.")
            }
        }
    }

    @IBAction func playMusicAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songViewModel.instance.songItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "listsongcell") as? SongTableViewCell {
            cell.songTitle.text = songViewModel.instance.songItem[indexPath.row].songTitle
            cell.songArtist.text = songViewModel.instance.songItem[indexPath.row].songArtist
            return cell
        }
        return UITableViewCell()
    }
    
    
}




















