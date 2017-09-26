//
//  LibrarySignInVC.swift
//  FLHS_App
//
//  Created by Jamie Scott on 9/25/17.
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import UIKit
import CoreImage
import Firebase
class LibrarySignInVC: UIViewController {

    @IBOutlet weak var imageDisplay: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userName = Auth.auth().currentUser?.displayName {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = Date()
            let dateString = dateFormatter.string(from: date)
            imageDisplay.image = Barcode.fromString(string: "Student: \(userName) has signed into the library at \(dateString)")
        }
        
    }
}
    class Barcode {
        
        class func fromString(string : String) -> UIImage? {
            
            let data = string.data(using: .ascii)
            //CIQRCodeGenerator or CICode128BarcodeGenerator
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let output = filter?.outputImage?.applying(transform)
            if let out = output {
                return UIImage(ciImage: out)
            }
            return nil
        }
        
    }
    
    
   



