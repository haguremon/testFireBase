//
//  LoginViewController.swift
//  testFireBase
//
//  Created by IwasakIYuta on 2021/10/05.
//test

import SafariServices //インスタグラムにアクセスするのでSafariServicesを開くためにインポート
import UIKit

class LoginViewController: UIViewController {
    struct Constats {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let nameEmailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "name or email..."
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
        //　masksToBoundsについてhttps://zenn.dev/toshi36/scraps/28798705d6a9c7
        textField.layer.masksToBounds = true
        //丸くする
        textField.layer.cornerRadius = Constats.cornerRadius
        
        
        
        textField.backgroundColor = .secondarySystemBackground
        
        textField.layer.borderWidth = 1

        textField.layer.borderColor = UIColor.secondaryLabel.cgColor

        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        //パスワードをする時に伏せ字になる
        textField.isSecureTextEntry = true
        textField.placeholder = "Password..."
        textField.textContentType = .newPassword
        textField.returnKeyType = .continue
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: .init(x: 0,
                                                 y: 0,
                                                 width: 10,
                                                 height: 0))
        //autoで設定
        textField.autocapitalizationType = .none
        //最初の文字が小文字になる
        textField.autocorrectionType = .no
        //　masksToBoundsについてhttps://zenn.dev/toshi36/scraps/28798705d6a9c7
        textField.layer.masksToBounds = true
        //丸くする
        textField.layer.cornerRadius = Constats.cornerRadius
        
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constats.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    private let createAcconutButton: UIButton = {
        let button = UIButton()
        
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Create New Acconut?", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constats.cornerRadius
        
        return button
    }()
    //利用規約ボタン
    private let termsButton: UIButton = {
        let button = UIButton()
        
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.setTitle("terms of serived", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constats.cornerRadius
        
        return button
    }()
    //プライバシーの規約ボタン
    private let privacyButton: UIButton = {
        let button = UIButton()
        
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.setTitle("privasy policy", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constats.cornerRadius
        
        return button
    }()
    private let  headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        header.backgroundColor = .systemBlue
        let backgroudColorImage = UIImageView(image: UIImage(named: "instagramheader"))
        header.addSubview(backgroudColorImage)
        return header
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        addTargets()
        
        nameEmailTextField.delegate = self
        passwordTextField.delegate = self
        addSubviews()
        
        view.backgroundColor = .systemBackground
        
    }

    
    //MRAK: - frameと場所の設定
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.width,
                                  height: view.height / 3)
        configuraHeaderView()
        
        nameEmailTextField.frame = CGRect(x: 25,
                                          y: headerView.bottom + 10,
                                          width: view.width - 50,
                                          height: 53)
        passwordTextField.frame = CGRect(x: 25,
                                         y: nameEmailTextField.bottom + 10,
                                         width: view.width - 50,
                                         height: 53)
        loginButton.frame = CGRect(x: 25,
                                   y: passwordTextField.bottom + 10,
                                   width: view.width - 50,
                                   height: 53)
        createAcconutButton.frame = CGRect(x: 25,
                                           y: loginButton.bottom + 10,
                                           width: view.width - 50,
                                           height: 53)
        termsButton.frame = CGRect(x: 10,
                                   y: view.height - view.safeAreaInsets.bottom - 100,
                                   width: view.width - 20,
                                   height: 53)
        privacyButton.frame = CGRect(x: 10,
                                     y: view.height - view.safeAreaInsets.bottom - 50,
                                     width: view.width - 20,
                                     height: 53)
        
        
        
    }
    //MRAK: - Headerのイメージに関する設定
    private func configuraHeaderView(){
        
        //subviewsするカウントは1
        guard headerView.subviews.count == 1 else { return }
        guard let backgroudColorImage = headerView.subviews.first  else {
            return
        }
        backgroudColorImage.frame = headerView.bounds
        //logoの設定
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        headerView.addSubview(logoImageView)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.frame = CGRect(x: headerView.width / 4,
                                     y: view.safeAreaInsets.top,
                                     width: headerView.width / 2,
                                     height: headerView.height - view.safeAreaInsets.top)
        
        
    }
    
    
    private func addSubviews() {
        
        view.addSubview(nameEmailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAcconutButton)
        view.addSubview(headerView)
        
    }
    private func addTargets() {
       
        loginButton.addTarget(self, action: #selector(didtapLoginButton), for: .touchUpInside)
        createAcconutButton.addTarget(self, action: #selector(didtapCreateAcconut), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didtapTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didtapPrivacyButton), for: .touchUpInside)
        
    }
    
    
    @objc private func didtapLoginButton(){
        //LoginButtonがタップされたらキーボードを閉じる
        passwordTextField.resignFirstResponder()
        nameEmailTextField.resignFirstResponder()
        
        guard let usernameEmail = nameEmailTextField.text, !usernameEmail.isEmpty,
              let password = passwordTextField.text, !password.isEmpty, password.count >= 8 else {
                  return
              }
        var username: String?
        var email: String?

        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            // Email
            email = usernameEmail
        } else {
            // Username
            username = usernameEmail
        }

        AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    // User logged in
                    self.dismiss(animated: true, completion: nil)
                } else {
                    // Error occurred
                    let alert = UIAlertController(title: "Log In Error",
                                                  message: "We were unable to log you in.",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                                  style: .cancel,
                                                  handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    
    @objc private func didtapTermsButton(){
        //利用規約のSafariページに移動する
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    
    @objc private func didtapPrivacyButton(){
        
        guard let url = URL(string: "https://help.instagram.com/519522125107875?helpref=page_content") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    @objc private func didtapCreateAcconut(){
        
        let vc = RegistrationViewController()
               //vc.title = "Create Account"
               present(vc, animated: true, completion: nil)
        
    }
    
    
}

//MRAK: -UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    //UITextFieldDelegateを使ってユーザーの入力を認知する
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameEmailTextField {
            //nameEmailTextFieldでリターンが押された時にpasswordTextFieldのキーボードを開く
            passwordTextField.becomeFirstResponder()
        
        } else if textField ==  passwordTextField {
            //textFieldが押されたらログインボタンが起動する
            didtapLoginButton()
            
        }
        
        return true
    }
}

