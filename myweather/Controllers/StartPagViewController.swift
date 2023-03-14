//
//  StartPageViewController.swift
//  myweather
//
//  Created by omari katamadze on 16.02.23.
//

import UIKit
import AVKit

class StartPageViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    //MARK: - IBOutlets
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var privacyLabel: UILabel!
    
    //MARK: - lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
      //  viewModel.actualLocation()
    }
    func setupUi(){
       logo.image = UIImage(named: "logo")
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playVideoBackground()
       
    }
    
  
   
    
    //Background video
    @objc func playerItemDidReachEnd(notification: Notification) {
        let playerItem: AVPlayerItem = notification.object as! AVPlayerItem
        playerItem.seek(to: .zero, completionHandler: nil)
    }
    
    private func playVideoBackground() {
        guard let url = Bundle.main.url(forResource: "background", withExtension: "mp4") else { return }
        let player = AVPlayer(url: url)
        let videoLayer = AVPlayerLayer(player: player)
        
        videoLayer.videoGravity = .resizeAspectFill
        player.volume = 0
        player.actionAtItemEnd = .none
        videoLayer.frame = self.view.layer.bounds
        self.view.backgroundColor = .clear
        self.view.layer.insertSublayer(videoLayer, at: 0)
        NotificationCenter.default.addObserver(self,
                                                   selector: #selector(playerItemDidReachEnd(notification:)),
                                                   name: .AVPlayerItemDidPlayToEndTime,
                                                   object: player.currentItem)
        player.play()
    }
}

