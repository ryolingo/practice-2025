//
//  CunterFeatureTEsts.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/14/25.
//

import ComposableArchitecture
import XCTest

@testable import practice_2025  // アンダースコアに注意
final class CounterFeatureTests: XCTestCase {
    func testBasics() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }
        await store.send(.incrementButtonTapped) {
            $0.count = 1
        }
        
        await store.send(.decrementButtonTapped) {
            $0.count = 0
        }
    }
}
 
