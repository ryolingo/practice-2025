//
//  AddContactFeature.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/19/25.

import ComposableArchitecture

@Reducer
struct AddContactFeature{
    @ObservableState
    struct State : Equatable {
        var contact : Contact
    }
    
    enum Action {
        case cancelButtonTapped
        case delegate(Delegate)
        case saveButtonTapped
        case setName(String)
        enum Delegate : Equatable{
            case saveContact(Contact)
        }
    }
    @Dependency(\.dismiss) var dismiss
    var body : some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .cancelButtonTapped:
                return .run { _ in await self.dismiss()}
                
            case .delegate:
                return .send(.delegate(.cancel))
            
                
            case .saveButtonTapped:
                return
                    .run {[contact = state.contact] send in
                        await send(.delegate(.saveContact(contact)))
                        await self . dismiss()
                    }
                
            case let .setName(name):
                state.contact.name = name
                return .none
            }
        }
    }
}

