//
//  practice_2025App.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 3/26/25.
//
import ComposableArchitecture
import SwiftUI

@main
struct practice_2025App: App {
    static let store = Store(initialState: CounterFeature.State()){
        CounterFeature()
        //これは状態の変化をコンソールで表示してくれるもの
        //変化がない場合は何も起きない
            ._printChanges()
    }
   var body: some Scene {
        WindowGroup {
            CounterView(store: practice_2025App.store)
        }
    }
}

//@main practice_2025App: App {
//    var body : some Scene {
//        WindowGroup {
//            ContentView()
//
//        }
//    }
//}
