//
//  BaiHat.swift
//  Appnghenhac
//
//  Created by Nguyen Dinh Huong on 10/31/20.
//

import Foundation
import UIKit

struct BaiHat {
    
    var tenBH:String
    var duongDan:String
    var hinhBH:UIImage
    var dangPhat:Bool
    
    init(tenBH:String, duongDan:String, hinhBH:UIImage) {
        self.tenBH = tenBH
        self.duongDan = duongDan
        self.hinhBH = hinhBH
        self.dangPhat = false
    }
    
}
