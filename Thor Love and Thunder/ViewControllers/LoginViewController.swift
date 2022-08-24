//
//  LoginViewController.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 22/08/2022.
//

import UIKit
import FirebaseAuth
import Combine

class LoginViewController: UIViewController {
    
    enum LoginStatus {
        case signUp
        case signIn
    }
    @IBOutlet weak var loginCard: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var PrimaryBtn: UIButton!
    @IBOutlet weak var accessoryBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var emailIsEmpty = true
    var passwordIsEmpty = true
    var loginStatus: LoginStatus = .signUp {
        didSet {
            self.titleLabel.text = (loginStatus == .signUp) ? "Sign up" : "Sign in"
            self.PrimaryBtn.setTitle(loginStatus == .signUp) ? "Create account": "Sign in", for: .normal)
            self.accessoryBtn.setTitle(loginStatus == .signUp) ? "Don't have an account? : "Already have an account? ", for: .normal)
            self.passwordTextField.textContentType = (loginStatus == .signUp) ? .newPassword : .password
        }
    }
    var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseInOut) {
            self.loginCard.alpha = 1
            self.loginCard.frame = self.loginCard.frame.offsetBy(dx: 0, dy: -400)
            
            emailTextField.publisher(for: \.text)
                .sink { newValue in
                    self.emailIsEmpty = (newValue == "" || newValue == nil)
                }
                .store(in: &tokens)
            
            passwordTextField.publisher(for: \.text)
                .sink { newValue in
                    self.passwordIsEmpty = (newValue == "" || newValue == nil)
                }
                .store(in: &tokens)
            
        }
        
        
    }
    
    @IBAction func PrimaryActionButton(_ sender: Any) {
        if (emailIsEmpty || passwordIsEmpty) {
               let alert = UIAlertController(title: "Missing Information", message: "Please make sure to enter a valid email address and a password", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self.present(alert, animated: true, completion: nil)
           } else {
               if loginStatus == .signUp {
                   Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authResult, error in
                       guard error == nil else {
                           print(error!.localizedDescription)
                           return
                       }

                       // Segue over to the home screen
                       self.goToHomeScreen()
                   }
               } else {
                   Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authResult, error in
                       guard error == nil else {
                           print(error!.localizedDescription)
                           return
                       }

                       // Segue to the home screen
                       self.goToHomeScreen()
                   }
               }
           }
       }
    
    @IBAction func AcessoryActionButton(_ sender: Any) {
        self.loginStatus = (self.loginStatus == .signUp) ? .signIn : .signUp
    }
    func goToHomeScreen() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarViewController") as! CustomTabBarViewController
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
