//
//  ViewController.swift
//  AppEventCount
//
//  Created by Kaan Baylas on 10.02.2020.
//  Copyright © 2020 Kaan Baylas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    @IBOutlet weak var willResignActiveLabel: UILabel!
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    @IBOutlet weak var willEnterBackgroundLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var willTerminateLabel: UILabel!
    
    var launchCount = 0
    var resignActiveCount = 0
    var didBackgroundCount = 0
    var willBackgroundCount = 0
    var didActiveCount = 0
    var terminateCount = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateView()

    }
    
    func updateView()
    {
        didFinishLaunchingLabel.text = "The app has launched \(launchCount) time(s)"
        willResignActiveLabel.text = "The app will resign \(resignActiveCount) time(s)"
        didEnterBackgroundLabel.text = "The app has entered background \(didBackgroundCount) time(s)"
        willEnterBackgroundLabel.text = "The app will enter background \(willBackgroundCount) time(s)"
        didBecomeActiveLabel.text = "The app has activated \(didActiveCount) time(s)"
        willTerminateLabel.text = "The app will be terminated \(terminateCount) time(s)"
    }


}

