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
    
    @IBOutlet weak var registerEmailField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var registerPasswordField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var registerReenterPassword: SkyFloatingLabelTextField!
    
    @IBOutlet weak var registerButtonOutlet: Button!
    
    @IBAction func registerButton(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: registerEmailField.text!, password: registerPasswordField.text!, completion: {  (user, err)
            in
            
            
            if err != nil {
                print(err?.localizedDescription as Any)
                let alert = UIAlertController(title: "Incorrect Login", message: "Error: \(String(describing: err?.localizedDescription))", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            else if self.registerReenterPassword.text! != self.registerPasswordField.text!
            {
                let alert = UIAlertController(title: "Passwords Do Not Match", message: "Passwords do not Match", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                print("UserCreated")
                self.performSegue(withIdentifier: "registerSuccess", sender: self)
                self.loginInUserFromRegister()


            }
            
            
        })

    }
    
    @IBAction func loginButton(_ sender: Any) {

        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!, completion: {  (user, err)
            in
            
            if err != nil{
                print(err?.localizedDescription as Any)
                let alert = UIAlertController(title: "Incorrect Login", message: "Error: \(String(describing: err?.localizedDescription))", preferredStyle: UIAlertControllerStyle.alert)
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
    
    func loginInUserFromRegister() {
        
        Auth.auth().signIn(withEmail: registerEmailField.text!, password: registerPasswordField.text!, completion: {  (user, err)
            in
            
            if err != nil {
                print(err?.localizedDescription as Any)
            }
            else
            {
                print("UserSignedInFromRegister")
                
            }
            
            
        })
        
    }

    @IBAction func forgotPassword(_ sender: Any) {
        
        let forgotPasswordAlert = UIAlertController(title: "Forgot password?", message: "Enter email address", preferredStyle: .alert)
        forgotPasswordAlert.addTextField { (textField) in
            textField.placeholder = "Enter email address"
        }
        forgotPasswordAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        forgotPasswordAlert.addAction(UIAlertAction(title: "Reset Password", style: .default, handler: { (action) in
            let resetEmail = forgotPasswordAlert.textFields?.first?.text
            Auth.auth().sendPasswordReset(withEmail: resetEmail!, completion: { (error) in
                if error != nil{
                    let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                    resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(resetFailedAlert, animated: true, completion: nil)
                }else {
                    let resetEmailSentAlert = UIAlertController(title: "Reset email sent successfully", message: "Check your email", preferredStyle: .alert)
                    resetEmailSentAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(resetEmailSentAlert, animated: true, completion: nil)
                }
            })
        }))
        //PRESENT ALERT
        self.present(forgotPasswordAlert, animated: true, completion: nil)
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
