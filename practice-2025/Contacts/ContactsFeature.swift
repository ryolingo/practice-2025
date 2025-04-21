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
        @Presents var addContact :AddContactFeature.State?
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    
    enum Action {
        case addButtonTapped
        case addContact(PresentationAction<AddContactFeature.Action>)
    }
    //TODO: 複数のプレゼンテーションをやる
    var body : some ReducerOf<Self>{
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.addContact = AddContactFeature.State(
                    contact: Contact(id: UUID(), name: "")
                )
                return .none
                
            case let .addContact(.presented(.delegate(.saveContact(contact)))):
                state.contacts.append(contact)
                return .none
                
            case .addContact:
                return .none
            }
        }
        .ifLet(\.$addContact, action: \.addContact){
            AddContactFeature()
        }
    }
}
