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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usernameTextField.layer.borderWidth = 1
        passwordTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.systemBlue.cgColor
        passwordTextField.layer.borderColor = UIColor.systemBlue.cgColor
        print(AuthorizationLogin.Endpoint.udacityLogin.url)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        AuthorizationLogin.login(username: self.usernameTextField.text ?? "", password: self.passwordTextField.text ?? "", completion: loginRequestHandler(success:error:))
        }
    }
    func loginRequestHandler(success: Bool, error: Error?) {
        if success {
            print("SUCCESSFUL")
        } else {
            print("Not working!!!!! Check line 32")
        }
    }



