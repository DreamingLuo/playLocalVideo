//
//  VideoTableViewCell.swift
//  playLocalVideo
//
//  Created by phiic on 17/1/9.
//  Copyright © 2017年 luogang. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    
}

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var videoScreenshot: UIImageView!
    
    @IBOutlet weak var videoTitleLable: UILabel!
       
    
    }



