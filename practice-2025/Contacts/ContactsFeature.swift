//
//  ContactsFeature.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/19/25.
//

import Foundation
import ComposableArchitecture

struct Contact: Equatable, Identifiable {
    let id : UUID
    var name: String
}

@Reducer
struct ContactsFeature {
    @ObservableState
    struct State : Equatable {
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    
    enum Action {
        case addButtonTapped
    }
    
    var body : some ReducerOf<Self>{
        Reduce {state, action in
            switch action {
            case .addButtonTapped:
                //TODO: handle add button tapped
                return.none

            }
        }
    }
}
