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
    
    let disposeBag = DisposeBag()
    
    let minimalUsernameLength = 5
    let minimalPasswordLength = 5
    
    var friends: [Friend] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Walidacja text fieldow
        // Ustawianie przycisku login na enabled jezeli oba pola poprawne
        // Obsluga klikniecia na login
        
        let usernameValidObservable = usernameTextField.rx.text.orEmpty
            .map { [weak self] text -> Bool in
                guard let `self` = self else {
                    return false
                }
                return text.characters.count >= self.minimalUsernameLength
            }
        
        usernameValidObservable.bindTo(usernameValidationLabel.rx.isHidden)
            .addDisposableTo(disposeBag)
        
        let passwordValidObservable = passwordTextField.rx.text.orEmpty
            .map { [weak self] text -> Bool in
                guard let `self` = self else {
                    return false
                }
                return text.characters.count >= self.minimalUsernameLength
            }
            .shareReplay(1)
        
        passwordValidObservable.bindTo(passwordValidationLabel.rx.isHidden)
            .addDisposableTo(disposeBag)
        
        Observable.combineLatest(usernameValidObservable, passwordValidObservable) { $0 && $1 }
            .bindTo(loginButton.rx.isEnabled)
            .addDisposableTo(disposeBag)
        
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.login()
            }).addDisposableTo(disposeBag)
    }
    
    func login() {
        // Wykonanie zapytan i przejscie do nastepnego viewControllera
        print("YES!")
        
        RxManager.login().flatMap({ (user) -> Observable<User> in
            
            let friendsObservable = RxManager.friends()
            let settingsObservable = RxManager.getSettings()
            
            Observable.zip(friendsObservable, settingsObservable, resultSelector: { [unowned self] (friends, isTableView) -> Void in
                self.friends = friends
            })
        })
            .bindNext { () in
                self.performSegue(withIdentifier: "friends", sender: nil)
        }
//        .subscribe(onNext: { (user) in
//            
//        }, onError: { (error) in
//        }, onCompleted: {
//            
//        }, onDisposed: {
//            
//        })
        
        RxManager.friends()
            .subscribe( onNext: { (friends) in
                print(friends.map{ $0.name })
            }, onError: { (error) in
                print(error)
            }, onCompleted: {
                print("completed")
            }, onDisposed: {
                print("disposed")
            }).addDisposableTo(disposeBag)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Przygotowanie friendListViewControllera
    }

}
