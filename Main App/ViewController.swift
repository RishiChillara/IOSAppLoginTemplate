//
//  ViewController.swift
//  Main App
//
//  Created by Rishi Chillara on 7/16/18.
//  Copyright © 2018 RCStudios. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBAction func loginButton(_ sender: Any) {
        animateIn()
    }
    
    @IBAction func loginFormSubmit(_ sender: Any) {
        animateOut()
    }
    
    @IBOutlet var addItemView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var effect: UIVisualEffect!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("working")
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        addItemView.layer.cornerRadius = 5
        
        UIView.animate(withDuration: 4.0){
            self.visualEffectView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }

    
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations:
        {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            self.visualEffectView.effect = nil

        } )
        {
            (success: Bool) in
            self.addItemView.removeFromSuperview()
        }
    }
    
    func animateIn() {
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


