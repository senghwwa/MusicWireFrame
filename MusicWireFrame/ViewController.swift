//
//  ViewController.swift
//  MusicWireFrame
//
//  Created by Seng Hwwa on 28/01/2019.
//  Copyright © 2019 senghwabeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reverseShadow: UIView!
    @IBOutlet weak var pauseShadow: UIView!
    @IBOutlet weak var forwardShadow: UIView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var albumImageView: UIImageView!
    
    var isPlaying: Bool = true {
        didSet {
            if isPlaying {
                pauseButton.setImage(UIImage(named: "pause")!, for: .normal)
            } else {
                pauseButton.setImage(UIImage(named: "play")!, for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        reverseShadow.layer.cornerRadius = 35.0
        reverseShadow.clipsToBounds = true
        reverseShadow.alpha = 0.0
        
        pauseShadow.layer.cornerRadius = 35.0
        pauseShadow.clipsToBounds = true
        pauseShadow.alpha = 0.0
        
        forwardShadow.layer.cornerRadius = 35.0
        forwardShadow.clipsToBounds = true
        forwardShadow.alpha = 0.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if isPlaying {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform.identity
            }
        }
        isPlaying = !isPlaying
    }
    
    @IBAction func touchUpInside(_ sender: UIButton) {
        let buttonShadow: UIView
        
        switch  sender  {
        case reverseButton:
            buttonShadow = reverseShadow
        case forwardButton:
            buttonShadow = forwardShadow
        case pauseButton:
            buttonShadow = pauseShadow
        default:
            return
        }
        UIView.animate(withDuration: 0.4, animations: {
            buttonShadow.alpha = 0.0
            sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        }) { (_) in buttonShadow.transform = CGAffineTransform.identity
            
        }
    }
    
    @IBAction func touchDown(_ sender: UIButton) {
        let buttonShadow: UIView
        
        switch  sender  {
        case reverseButton:
            buttonShadow = reverseShadow
        case forwardButton:
            buttonShadow = forwardShadow
        case pauseButton:
            buttonShadow = pauseShadow
        default:
            return
        }
        UIView.animate(withDuration: 0.4) {
            buttonShadow.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
}


