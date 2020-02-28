//
//  ViewController.swift
//  Light
//
//  Created by Kaan Baylas on 22.08.2019.
//  Copyright © 2019 Kaan Baylas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    var lightOn = true


    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func buttonPressed(_ sender: Any)
    {
        lightOn.toggle()
        updateUI()
    }
    
    func updateUI()
    {
        view.backgroundColor = lightOn ? .white : .black
    }
}

