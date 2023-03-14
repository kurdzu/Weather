//
//  StartPageViewController.swift
//  myweather
//
//  Created by omari katamadze on 17.02.23.
//

import UIKit
import AVKit
class StartPageViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    
    //MARK: - vars/lets
    var viewModel = StartPageViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.actualLocation()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playVideoBackground()
        updateUI()
    }

    //MARK: - IBActions
    @IBAction func didTabContinue(_ sender: Any) {
        
        let sb = UIStoryboard(name: "WeatherPage", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WeatherPage") as! WeatherViewController
        
        viewModel.getWeather {
            vc.modalPresentationStyle = .fullScreen
            vc.viewModel.weather = self.viewModel.weather
            self.navigationController?.pushViewController(vc, animated: true)
        }
     
        
  
        
    }
    
    
    //Background video
    @objc func playerItemDidReachEnd(notification: Notification) {
        let playerItem: AVPlayerItem = notification.object as! AVPlayerItem
        playerItem.seek(to: .zero, completionHandler: nil)
    }
    
    private func playVideoBackground() {
        guard let url = Bundle.main.url(forResource: "background", withExtension: "mp4") else { return }
        print(url)
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
    func updateUI(){
        self.continueButton.addButtonRadius()
    }
}
