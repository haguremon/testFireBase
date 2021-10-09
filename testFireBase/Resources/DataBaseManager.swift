//
//  DataBaseManager.swift
//  testFireBase
//
//  Created by IwasakIYuta on 2021/10/07.
//


import FirebaseDatabase

//MRAK: -Realtime Database
//テストをする時はこちらでやれば楽勝
public class DataBaseManager {
    
    
    static let shared = DataBaseManager()
       
       private let database = Database.database().reference()
       
       // MARK: - Public
       
       /// ユーザー名とメールアドレスが利用可能かどうかをチェックする
       /// - Parameters
       ///     - email: String representing email
       ///     - username: String representing username
       public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
           completion(true)
       }
    
    /// 新しいユーザーデータをデータベースに挿入する
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    ///     - completion: Async callback for result if database entry succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        database.child(key).setValue(["username": username]) { error, _ in
            if error == nil {
                // Succeeded
                completion(true)
                return
            } else {
                // Failed
                completion(false)
                return
            }
        }
    }
    
}
