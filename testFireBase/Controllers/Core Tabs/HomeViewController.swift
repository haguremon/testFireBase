//
//  ViewController.swift
//  testFireBase
//
//  Created by IwasakIYuta on 2021/10/05.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //ViewにUIViewControllerが呼ばれる前に呼ばれるやつ
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
//        do {
//            try Auth.auth().signOut()
//        } catch  {
//            print(error)
//        }
    }
 
    
   
    //ログインしてたらそのままホームViewを表示する
    private func handleNotAuthenticated(){
        
        if Auth.auth().currentUser == nil {
            
            let loginVC = LoginViewController()
            
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false, completion: nil)
            
        }
   
    }
    
    

}

