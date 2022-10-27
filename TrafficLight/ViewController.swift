//
//  ViewController.swift
//  TrafficLight
//
//  Created by Olga Tegza on 23.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let alphaThenOn: CGFloat = 1
    let alphaThenOff: CGFloat = 0.3

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var switchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.layer.cornerRadius = redLightView.frame.width / 2.2
        yellowLightView.layer.cornerRadius = redLightView.frame.width / 2.2
        greenLightView.layer.cornerRadius = redLightView.frame.width / 2.2
        
        //make transparantie
        redLightView.alpha = alphaThenOff
        yellowLightView.alpha = alphaThenOff
        greenLightView.alpha = alphaThenOff
        
        switchButton.configuration = setupButton(with: "START")
        
    }

    @IBAction func switchButtonTapped(_ sender: Any) {
        
        switchButton.configuration = setupButton(with: "NEXT")
        
        //make logic
        if redLightView.alpha == yellowLightView.alpha {
            redLightView.alpha = alphaThenOn
            greenLightView.alpha = alphaThenOff
        } else if redLightView.alpha > alphaThenOff && yellowLightView.alpha == greenLightView.alpha {
            yellowLightView.alpha = alphaThenOn
            redLightView.alpha = alphaThenOff
        } else if yellowLightView.alpha > alphaThenOff && greenLightView.alpha == redLightView.alpha {
            greenLightView.alpha = alphaThenOn
            yellowLightView.alpha = alphaThenOff
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

