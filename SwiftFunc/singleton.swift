//
//  singleton.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/19/25.
//

import Foundation
import UIKit

class SomeClass {
    static var defaultObject: SomeClass = SomeClass()
    
    private init() {
        // プライベートイニシャライザ
        // 外部からインスタンス化できない
        // ここに初期化処理を書く
    }
}
    //シングルトンobjectは一つのものを参照することができるが、何個もこれがあったら、誰が誰を参照する必要があるのかわからない。「どれかにも属さない」というもの、「必ず一つしかオブジェクトが存在しない」というもの、そして「様々なオブジェクトから利用されることが予想できる」この３つを満たしてるなら別にOK

