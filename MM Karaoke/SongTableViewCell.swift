//
//  SongTableViewCell.swift
//  MM Karaoke
//
//  Created by Vansa Pha on 21/12/2017.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet weak var iconMusic: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songArtist: UILabel!
    
    func configurationCell(icon: String, song: String, artist: String) {
        iconMusic.downloadedFrom(link: icon)
        songTitle.text = song
        songArtist.text = artist
    }

}
