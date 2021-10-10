//
//  AuthManager.swift
//  testFireBase
//
//  Created by IwasakIYuta on 2021/10/08.
//


import FirebaseAuth

//MRAK: -Authentication
//テストをする時はこちらでやれば楽勝
//実際に存在するか判断するクラス
public class AuthManager {
    
    static let shared = AuthManager()
    
    //MRAK: -public　でそれぞれの場合での機能
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        
        DataBaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                /*//作成可能のデータだった場合作る
                 - Create account
                 - Insert account to database
                 */
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        // Firebase auth could not create account
                        completion(false)
                        return
                    }
                    
                    // Insert into database
                    DataBaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            // Failed to insert to database
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                // Either username or email does not exist
                completion(false)
            }
        }
        
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
