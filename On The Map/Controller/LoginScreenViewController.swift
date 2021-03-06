//
//  ViewController.swift
//  On The Map
//
//  Created by Emil Haroutunian on 4/8/21.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        // Do any additional setup after loading the view.
        usernameTextField.layer.borderWidth = 1
        passwordTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.systemBlue.cgColor
        passwordTextField.layer.borderColor = UIColor.systemBlue.cgColor
        print(AuthorizationLogin.Endpoint.udacityLogin.url)
        
    }
    
    @IBAction func loginButton(_ sender: Any)  {
        
        
         AuthorizationLogin.login(username: self.usernameTextField.text ?? "", password: self.passwordTextField.text ?? "", completion:  loginRequestHandler(success:error:))
        loginChecker()
    }
    
    func loginRequestHandler(success: Bool, error: Error?)   {
        
        if  success {
            print("Succesful")
        } else if error != nil {
            let errorAlert = UIAlertController(title: "username or password is incorrect", message: "Click Ok to try again", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                return
            }))
            self.present(errorAlert, animated: true, completion: nil)
        }
    }

    
    
    
    
    func loginChecker() {
        if (usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!  {
            let alert = UIAlertController(title: "Enter Username and Password", message: "Click OK to continue", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                return
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
