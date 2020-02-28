//
//  ViewController.swift
//  IBBasics
//
//  Created by Kaan Baylas on 21.08.2019.
//  Copyright © 2019 Kaan Baylas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var myButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any)
    {
        print("The button was pressed")
    }
    
    override func viewDidLoad()
    {
        
        myButton.setTitleColor(.blue, for: .normal)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

