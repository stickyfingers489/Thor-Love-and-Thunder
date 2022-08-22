//
//  LoginViewController.swift
//  Thor Love and Thunder
//
//  Created by stickerfinger489 on 22/08/2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginCard: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var PrimaryBtn: UIButton!
    @IBOutlet weak var accessoryBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseInOut) {
            self.loginCard.alpha = 1
            self.loginCard.frame = self.loginCard.frame.offsetBy(dx: 0, dy: -400)
        
        }

    }

}
