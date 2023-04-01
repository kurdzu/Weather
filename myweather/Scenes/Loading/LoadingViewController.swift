//
//  LoadingViewController.swift
//  myweather
//
//  Created by omari katamadze on 17.02.23.
//

import UIKit
import Lottie

class LoadingViewController: UIViewController {

    //MARK: - vars/lets
    private var animationView: LottieAnimationView?
    private var viewModel = LoadingViewModel()
    
    //MARK: - lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        animationView = .init(name: "sunLoad")
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 2
        view.addSubview(animationView!)
        print("loader")

       
    }
    
    private func bind() {
        viewModel.showLoading = {
            DispatchQueue.main.async {
                self.animationView!.play()
            }
        }
        viewModel.hideLoading = {
            DispatchQueue.main.async {
                self.animationView!.stop()
            }
        }
        viewModel.showError = {
            let alert = UIAlertController(title: "არ არის კავშირი ", message: "ინტერნეტრან წვდომა საჭიროს სწორი მონაცემების მისაღებად", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: { _ in
                self.viewModel.loadWeatherController?()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        viewModel.loadStartController = {
            let sb = UIStoryboard(name: "StartPage", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "StartPage") as! StartPageViewController
           self.navigationController?.pushViewController(vc, animated: true)

        }
        viewModel.loadWeatherController = {
            let sb = UIStoryboard(name: "WeatherPage", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "WeatherPage") as! WeatherViewController
                vc.modalPresentationStyle = .fullScreen
                vc.viewModel.weather = self.viewModel.weather
                self.navigationController?.pushViewController(vc, animated: true)
            
        }
        viewModel.checkFirstStart()
       
    }
}


