//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Kaan Baylas on 10.03.2020.
//  Copyright © 2020 Kaan Baylas. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate
{
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        dismiss(animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
        dismiss(animated: true, completion: nil)
    }
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    @IBAction func shareButtonTapped(_ sender: UIButton)
    {
        guard let image = imageView.image else {return}
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        
        present(activityController,animated: true, completion: nil)
    }
    
    @IBAction func safariButtonTapped(_ sender: UIButton)
    {
        if let url = URL(string: "http://www.apple.com")
        {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton)
    {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { (action) in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
//        alertController.addAction(cancelAction)
//        alertController.popoverPresentationController?.sourceView = sender
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : [String : Any]])
        {
            if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
                imageView.image = selectedImage
                dismiss(animated: true, completion: nil)
            }
                
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton)
    {
        if !MFMailComposeViewController.canSendMail()
        {
            print("Can not send mail")
            emailButton.isEnabled = false
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["kbaylas@gmail.com"])
        mailComposer.setSubject("Look at my resume")
        mailComposer.setMessageBody("Hello this is an email from the app I made", isHTML: false)
        
        present(mailComposer, animated: true, completion: nil)
    }
    
    @IBAction func messageButtonTapped(_ sender: UIButton)
    {
        if !MFMessageComposeViewController.canSendText()
        {
            print("SMS services are not avaiable")
            messageButton.isEnabled = false
            return
        }
        
        let messageComposer = MFMessageComposeViewController()
        messageComposer.messageComposeDelegate = self
        
        messageComposer.recipients = ["+905333856517"]
        messageComposer.body = "Hey Kaan, this message comes from the app you have build."
        
        present(messageComposer, animated: true, completion: nil)
    }
    
    
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

