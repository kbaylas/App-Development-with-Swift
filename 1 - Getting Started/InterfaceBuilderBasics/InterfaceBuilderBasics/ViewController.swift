//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Kaan Baylas on 21.08.2019.
//  Copyright © 2019 Kaan Baylas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func changeTitle(_ sender: Any)
    {
        mainLabel.text = "This app rocks!"
    }
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

