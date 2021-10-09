//
//  extensions.swift
//  testFireBase
//
//  Created by IwasakIYuta on 2021/10/08.
//

import UIKit

//MARK: - UIViewの大きさ
extension UIView {
    
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
    //origin.yは上の位置
    public var top: CGFloat {
        return frame.origin.y
    }
    public var bottom: CGFloat {
        
        return frame.origin.y + frame.size.height
    
    }
    //画面の左側の位置　origin.x
    public var left: CGFloat {
        
        return frame.origin.x
    }
    public var right: CGFloat {
        
        return frame.origin.x + frame.size.width
    }
    
    
}

extension String {
    func safeDatabaseKey() -> String {
        //replacingOccurrencesde:で文字を変更する
        //of:変更前 , with:変更後
        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
    }
}
