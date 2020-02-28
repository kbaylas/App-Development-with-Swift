//
//  ViewController.swift
//  Login
//
//  Created by Kaan Baylas on 9.10.2019.
//  Copyright © 2019 Kaan Baylas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var forgotUserNameButton: UIButton!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        guard let sender = sender as? UIButton else {return}
        
        if sender == forgotPasswordButton
        {
            segue.destination.navigationItem.title = "Forgot Password"
        }
        else if sender == forgotUserNameButton
        {
            segue.destination.navigationItem.title = "Forgot Username"
        }
        else
        {
            segue.destination.navigationItem.title = userNameTextField.text
        }
    }
    
    @IBAction func forgotUserNameTapped(_ sender: Any)
    {
        performSegue(withIdentifier: "goToLanding", sender: forgotUserNameButton)
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any)
    {
        performSegue(withIdentifier: "goToLanding", sender: forgotPasswordButton)
    }
    

}

