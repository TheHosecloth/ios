//
//  TrackTableViewCell.swift
//  Playlist
//
//  Created by Marc Hosecloth on 4/21/17.
//  Copyright © 2017 Marc Hosecloth. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var playTrackButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
