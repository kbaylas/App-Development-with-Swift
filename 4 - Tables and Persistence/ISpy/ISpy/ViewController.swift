//
//  ViewController.swift
//  ISpy
//
//  Created by Kaan Baylas on 25.02.2020.
//  Copyright © 2020 Kaan Baylas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate
{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad()
    {
        scrollView.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        updateZoomFor(size: view.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return imageView
    }
    
    func updateZoomFor(size: CGSize)
    {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
    }
}

