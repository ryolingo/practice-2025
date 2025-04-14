//
//  CunterFeatureTEsts.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/14/25.
//

import ComposableArchitecture
import Testing

@testable import CounterApp

@MainActor
struct CounterFeatureTests{
    @Test
    func basics() async{
        let store = TestStore(initialState : CounterFeature.State())
        CounterFeature()
    }
}
