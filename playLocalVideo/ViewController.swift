//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by Allen on 16/1/9.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var videoTableView=UITableView()
    
    
    let  cellIdentifier="Cell"
    
    var data = [
        
        video(image: "3", title: "Introduce 3DS Mario"),
        video(image: "3", title: "Emoji Among Us"),
        video(image: "3", title: "Seals Documentary"),
        video(image: "3", title: "Adventure Time"),
        video(image: "3", title: "Facebook HQ"),
        video(image: "3", title: "Lijiang Lugu Lake")
        
    ]
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
         self.title="VideoPlayer"
        
        videoTableView.frame=self.view.frame
        
        videoTableView.dataSource = self
        videoTableView.delegate = self
        
        let nib = UINib(nibName: "VideoTableViewCell", bundle: nil) //nibName指的是我们创建的Cell文件名
        self.videoTableView.registerNib(nib, forCellReuseIdentifier: cellIdentifier)
        
        
        self.view.addSubview(videoTableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func playVideoButtonDidTouch() {
        
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        
        playerView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        
        playViewController.player = playerView
        
        self.presentViewController(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = videoTableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath) as! VideoTableViewCell
        let video = data[indexPath.row]
        
        cell.videoScreenshot.image = UIImage(named: video.image)
        cell.videoTitleLable.text = video.title
        
        cell.playBtn.addTarget(self, action: #selector(playVideoButtonDidTouch), forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
        
    }
    
    
}

