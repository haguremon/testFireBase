//
//  LoginViewController.swift
//  testFireBase
//
//  Created by IwasakIYuta on 2021/10/05.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    private let emailTextField: UITextField = {
        let textField = UITextField()
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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    //ここでフレームとか色々と設定する
    }
    
    private func addSubviews() {
        
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
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
