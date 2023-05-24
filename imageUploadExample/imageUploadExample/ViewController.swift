//
//  ViewController.swift
//  imageUploadExample
//
//  Created by vidhi jayswal on 18/06/19.
//  Copyright © 2019 vidhi jayswal. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, URLSessionDelegate, URLSessionTaskDelegate, URLSessionDataDelegate
{
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var imageUploadProgressView: UIProgressView!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func uploadButtonTapped(_ sender: UIButton) {
        
        var myPickerController = UIImagePickerController()
        
        myPickerController.delegate = self
        
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        present(myPickerController, animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        myImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        self.dismiss(animated: true, completion: nil)
        
        uploadImage()
        
    }
    
    
    func uploadImage()
    {
        
        let imageData = UIImage.jpegData(compressionQuality:) //UIImageJPEGRepresentation(myImageView.image!, 1)
        
        if (imageData == nil) {return}
        
        self.uploadButton.isEnabled = false
        
        let uploadScriptUrl = NSURL(string: "http://www.swiftdeveloperblog.com/http-post-example-script/")
        
        var request = NSMutableURLRequest(url: uploadScriptUrl! as URL)
        
        request.httpMethod = "POST"
        
        request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
        
        var configuration = URLSessionConfiguration.default
        
        var session = URLSession(configuration: configuration, delegate: self, delegateQueue: OperationQueue.main)
        
        
        
    }
    
    


}

