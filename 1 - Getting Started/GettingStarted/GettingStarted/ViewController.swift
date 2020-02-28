//
//  ViewController.swift
//  GettingStarted
//
//  Created by Kaan Baylas on 20.08.2019.
//  Copyright © 2019 Kaan Baylas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationController?.title = "Debugging"
        
        var names = ["Tammy", "Cole"]
        names.removeFirst()
        names.removeFirst()
        // Do any additional setup after loading the view.
    }


}

