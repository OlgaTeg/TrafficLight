//
//  ViewController.swift
//  TrafficLight
//
//  Created by Olga Tegza on 23.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var switchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make ronded views
        redLightView.layer.cornerRadius = redLightView.frame.width / 2.2
        yellowLightView.layer.cornerRadius = redLightView.frame.width / 2.2
        greenLightView.layer.cornerRadius = redLightView.frame.width / 2.2
        
        //make transparantie
        redLightView.alpha = 0.3
        yellowLightView.alpha = 0.3
        greenLightView.alpha = 0.3
        
        switchButton.configuration = setupButton(with: "START")
        
    }

    @IBAction func switchButtonTapped(_ sender: Any) {
        
        switchButton.configuration = setupButton(with: "NEXT")
        
        //make logic
        if redLightView.alpha == yellowLightView.alpha {
            redLightView.alpha = 1
            greenLightView.alpha = 0.3
        } else if redLightView.alpha > 0.3 && yellowLightView.alpha == greenLightView.alpha {
            yellowLightView.alpha = 1
            redLightView.alpha = 0.3
        } else if yellowLightView.alpha > 0.3 && greenLightView.alpha == redLightView.alpha {
            greenLightView.alpha = 1
            yellowLightView.alpha = 0.3
        }
    }
    
    //make button
    private func setupButton(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = .blue
        buttonConfiguration.title = title
        buttonConfiguration.buttonSize = .large
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 30, weight: .light)
        
        return buttonConfiguration
    }
}

