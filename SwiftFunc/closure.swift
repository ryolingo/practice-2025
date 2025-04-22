//
//  closure.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/19/25.
//

import Foundation
import UIKit

var result = 0.0

var a = 0.0
var b = 0.0

func calculate(function: () -> Double) {
    print(result)
    result = function()//型が一致するから　代入できる
    print(result)
}
//
//a = 1
//b = 2
//calculate({ a + b })
//result
//
//a = 3
//b = 4
//calculate({ a * b })
//result
//
//a = 5
//b = 0
//calculate({ () -> Double in
//    if b == 0 {
//        return 0
//    } else {
//        return a / b
//    }
//})
//result
//calculate({/*中身が関数であることを表している*/})
//これはSwift1.X系
class MyViewController: UIViewController {
    
    var viewA: UIView!
    var viewB: UIView!
    
    override func viewDidLoad(){
        self.viewA = {() -> UIView in
            let view = UIView()
            self.viewA = UIView()
            self.viewA.backgroundColor = .white
            self.viewA.isHidden = true
            self.view.addSubview(viewA)
            return view
        } ()
        
        self.viewB = {() -> UIView in
            let viewB = UIView()
            self.viewB = UIView()
            self.viewB.backgroundColor = .white
            self.viewB.isHidden = true
            self.view.addSubview(viewB)
            return view
        }()
    }
}
//{一応このクロージャーも関数なので、()を返してあげる。}()

