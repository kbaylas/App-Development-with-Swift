//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Kaan Baylas on 29.08.2019.
//  Copyright © 2019 Kaan Baylas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet var enteredText: UILabel!
    @IBOutlet var toggle: UISwitch!
    @IBOutlet var slider: UISlider!
    @IBOutlet var button: UIButton!
    

    override func viewDidLoad()
    {
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton)
    {
        print("Button was tapped!")
        
        if toggle.isOn
        {
            print("The switch is on!")
        }
        else
        {
            print("The switch is off.")
        }
        
        print("The slider is set to \(slider.value)")
    }
    
    @IBAction func switchToogled(_ sender: UISwitch)
    {
        if sender.isOn
        {
            print("The switch is on!")
        }
        else
        {
            print("The switch if off.")
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider)
    {
        print(sender.value)
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField)
    {
        if let text = sender.text
        {
            print(text)
            enteredText.text = text
        }
    }
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer)
    {
        let location = sender.location(in: view)
        print(location)
    }
    
}

