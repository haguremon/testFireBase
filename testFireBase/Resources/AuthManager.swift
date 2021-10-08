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
    
    public func loginUser(name: String?, email: String?, passwore: String) {
        
    }
    
}
