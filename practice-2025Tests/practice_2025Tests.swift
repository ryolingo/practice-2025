//
//  practice_2025Tests.swift
//  practice-2025Tests
//
//  Created by Ryota Matsumoto on 3/26/25.
//

import XCTest
import ComposableArchitecture
@testable import practice_2025

final class AppFeatureTests: XCTestCase {
    @MainActor
    func testIncrementInFirstTab() async {
        let store = TestStore(initialState: AppFeature.State()) {
            AppFeature()
        }
        
        await store.send(.tab1(.incrementButtonTapped)) {
            $0.tab1.count = 1
        }
    }
}
