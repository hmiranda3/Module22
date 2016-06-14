//
//  ViewController.swift
//  AppleViewControllers
//
//  Created by Habib Miranda on 6/14/16.
//  Copyright © 2016 littleJohns. All rights reserved.
//

import UIKit
//THis allows us access to protocols and functions that pertain to MessageUI
import MessageUI
import SafariServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var myImageView: UIImageView!

    //MARK: - ActionButtons
    
    
    //MARK: - Image Picker Controller Methods
    
    @IBAction func imageTapped(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let actionSheet = UIAlertController(title: "Please choose image source", message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .Default) { (_) in
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .Default) { (_) in
            imagePicker.sourceType = .Camera
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
        let savedPhotosAction = UIAlertAction(title: "Saved Photos", style: .Default) { (_) in
            imagePicker.sourceType = .SavedPhotosAlbum
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
        actionSheet.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            actionSheet.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            actionSheet.addAction(photoLibraryAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum) {
            actionSheet.addAction(savedPhotosAction)
        }
        
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        myImageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: - Email Methods.
    
    @IBAction func emailTapped(sender: AnyObject) {
        guard MFMailComposeViewController.canSendMail() else { return }
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["habibmiranda@yahoo.com"])
        mailComposer.setSubject("testing!")
        mailComposer.setMessageBody("check out this cool picture1", isHTML: false)
        if let image = myImageView.image, imageData = UIImageJPEGRepresentation(image, 0.3) {
            mailComposer.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "Test File")
        }
        presentViewController(mailComposer, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - UIActivityViewController Methods.
    
    @IBAction func shareButtonTapped(sender: AnyObject) {
        guard let image = myImageView.image else { return }
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)//This makes it so that it can be shared in other apps within the phone
        presentViewController(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func BrowserButtonTapped(sender: AnyObject) {
        guard let url = NSURL(string: "https://www.google.com/imghp?gws_rd=ssl") else { return }
        let safariVC = SFSafariViewController(URL: url)
        
        presentViewController(safariVC, animated: true, completion: nil)
    }
    
    
}





















