//
//  LoginViewController.swift
//  testFireBase
//
//  Created by IwasakIYuta on 2021/10/05.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    private let nameEmailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "name or nemail..."
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: .init(x: 0,
                                                 y: 0,
                                                 width: 10,
                                                 height: 0))
        //autoで設定
        textField.autocapitalizationType = .none
        //最初の文字が小文字になる
        textField.autocorrectionType = .no
      
        return textField
    }()
   
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        //パスワードをする時に伏せ字になる
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        return UIButton()
    }()
    private let createAcconut: UIButton = {
        return UIButton()
    }()
   //利用規約ボタン
    private let termsButton: UIButton = {
        return UIButton()
    }()
    //プライバシーの規約ボタン
    private let privacyButton: UIButton = {
        return UIButton()
    }()
    private let  headerView: UIView = {
        return UIView()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        view.backgroundColor = .systemBackground
    }
    
    //MRAK: - frameの設定
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        headerView.frame = CGRect(x: 0,
                                  y: view.safeAreaInsets.top,
                                  width: view.width,
                                  height: 50)
    }
    
    private func addSubviews() {
        
        view.addSubview(nameEmailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAcconut)
        view.addSubview(headerView)
        
    }
    
    @objc private func didtapLoginButton(){}
    @objc private func didtapTermsButton(){}
    @objc private func didtapPrivacyButton(){}
    @objc private func didtapCreateAcconut(){}
  

}

