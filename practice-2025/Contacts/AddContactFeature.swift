//
//  AddContactFeature.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/19/25.
//

import ComposableArchitecture

@Reducer
struct AddContactFeature{
    @ObservableState
    struct State : Equatable {
        var contact : Contact
    }
    enum Action {
        case cancelButtonTapped
        case saveButtonTapped
        case setName(String)
    }
    var body : some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .cancelButtonTapped:
                return .none
                
            case .saveButtonTapped:
                return .none
                
            case let .setName(name):
                state.contact.name = name
                return .none
            }
        }
    }
}

