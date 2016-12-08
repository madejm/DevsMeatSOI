//
//  LoginViewController.swift
//  DevsMeat
//
//  Created by Piotr Więcaszek on 06/12/2016.
//  Copyright © 2016 SoInteractive. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameValidationLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordValidationLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    let minimalUsernameLength = 5
    let minimalPasswordLength = 5
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Walidacja text fieldow
        // Ustawianie przycisku login na enabled jezeli oba pola poprawne
        // Obsluga klikniecia na login
        
    }
    
    func login() {
        // Wykonanie zapytan i przejscie do nastepnego viewControllera
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Przygotowanie friendListViewControllera
    }

}
