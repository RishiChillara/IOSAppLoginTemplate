//
//  LoginViewController.swift
//  Main App
//
//  Created by Rishi Chillara on 7/19/18.
//  Copyright © 2018 RCStudios. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import FirebaseAuth


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var passwordField: SkyFloatingLabelTextField!
    /// Implementing a method on the UITextFieldDelegate protocol. This will notify us when something has changed on the textfield
    @IBAction func loginButton(_ sender: Any) {
        
        
     /*   Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: {  (user, err)
            in
            
            if err != nil {
                print(err?.localizedDescription as Any)
                
            }
            else
            {
                print("UserCreated")

            }
            
            
        })
 */
        
        
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!, completion: {  (user, err)
            in
            
            if err != nil {
                print(err?.localizedDescription as Any)
                let alert = UIAlertController(title: "Incorrect Login", message: "Please enter correct Information", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            else
            {
                print("UserSignedIn")
                self.performSegue(withIdentifier: "loginSuccess", sender: self)

            }
            
            
        })
        
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
