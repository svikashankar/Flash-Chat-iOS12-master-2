//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        SVProgressHUD.show()
        

        
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil{
                print(error!)
                SVProgressHUD.showError(withStatus: "Unable to register a new user. Check email and password (min. 6 characters)")
                SVProgressHUD.dismiss(withDelay: 1.5)
            }else {
                print("succeful login")
//                SVProgressHUD.dismiss()
                SVProgressHUD.showSuccess(withStatus: "Registration successfull!")
                SVProgressHUD.dismiss(withDelay: 0.5)
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        

        
        
    } 
    
    
}
