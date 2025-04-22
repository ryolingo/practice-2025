//
//  ContactsView.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/19/25.
//

import SwiftUI
import ComposableArchitecture

struct ContactsView: View {

    let store: StoreOf<ContactsFeature>
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(store.contacts){ contact in
                    Text(contact.name)
                }
            }
        }
        .navigationTitle("Contacts")
        .toolbar{
            ToolbarItem {
                Button {
                    store.send(.addButtonTapped)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ContactsView(
        store: Store(
            initialState: ContactsFeature.State(
                contacts: [
                    Contact(id: UUID(), name: "Jhon"),
                    Contact(id: UUID(), name: "Mike"),
                    Contact(id: UUID(), name: "Sara")
                ]
            )
        ) {
            ContactsFeature()
        }
    )
}
