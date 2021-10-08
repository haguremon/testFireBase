//
//  DataBaseManager.swift
//  testFireBase
//
//  Created by IwasakIYuta on 2021/10/07.
//

import Foundation
import FirebaseDatabase

//MRAK: -Realtime Database　 CRUDの設定
//テストをする時はこちらでやれば楽勝
public class DataBaseManager {
    
    static let shared = DataBaseManager()
    
    //MRAK: -public　でそれぞれの場合での機能
    public func registerNewUser(name: String, email: String, password: String) {
        
    }
    
    public func loginUser(name: String?, email: String?, passwore: String) {
        
    }
    
}
