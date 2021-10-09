//
//  AuthManager.swift
//  testFireBase
//
//  Created by IwasakIYuta on 2021/10/08.
//

import Foundation
import FirebaseAuth
//MRAK: -Realtime Database　 CRUDの設定
//テストをする時はこちらでやれば楽勝
//実際に存在するか判断するクラス
public class AuthManager {
    
    static let shared = AuthManager()
    
    //MRAK: -public　でそれぞれの場合での機能
    public func registerNewUser(name: String, email: String, password: String) {
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // Email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                
                completion(true)
            }
        } else if let username = username {
            // Username log in
            print(username)
        }
    }
    
    /// Attempt to log out Firebase user
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        }
        catch {
            print(error)
            completion(false)
            return
        }
    }
    
}
