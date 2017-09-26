//
//  SignInVC.swift
//  
//
//  Created by Jamie Scott on 9/22/17.
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseAuth
class SignInVC: UIViewController, GIDSignInUIDelegate{
    //If you are looking for the signing in process, most of it is in AppDelegate
    @IBOutlet weak var GoogleSignInButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
        //Start the sign in process
        GIDSignIn.sharedInstance().signIn()
        

        // Configure the sign-in button look/feel
        GoogleSignInButton.style = .wide
    }
    override func viewDidAppear(_ animated: Bool) {
        if let alreadySignedIn = Auth.auth().currentUser {
            performSegue(withIdentifier: "SkipSignIn", sender: nil)
        
    }

    
}
}
