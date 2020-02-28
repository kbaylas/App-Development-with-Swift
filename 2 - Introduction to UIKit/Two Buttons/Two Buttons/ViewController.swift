//
//  ViewController.swift
//  Two Buttons
//
//  Created by Kaan Baylas on 29.08.2019.
//  Copyright © 2019 Kaan Baylas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet var textField: UITextField!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setTextButtonTapped(_ sender: UIButton)
    {
        label.text = textField?.text
    }
    @IBAction func clearTextButtonTapped(_ sender: UIButton)
    {
        label.text = ""
        textField.text = ""
    }
    
}

