//
//  MVVMView.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/11/25.
//

import SwiftUI
import Foundation
//Model
struct Person: Identifiable {
    var id = UUID()
    var name : String
    var email : String
    var phoneNumber : String
}

class PersonViewModel : ObservableObject {
    @Published  var people: [Person] = []
    init (){
        addPeople()
    }
    func addPeople(){
        people = peopleData
    }
    func shuffleOrder(){
        people.shuffle()
    }
    func reverseOrder(){
        people.reverse()
    }
    func removeLastPerson(){
        people.removeLast()
    }
    func removeFirstPerson(){
        people.removeFirst()
    }
    let peopleData = [
        Person(name: "Jhon", email: "jon.@email.com", phoneNumber: "090-999129"),
        Person(name: "Ken", email: "Ken.@email.com", phoneNumber: "090-939299"),
        Person(name: "Ren", email: "Ren,@email.com", phoneNumber: "090-992399"),
        Person(name: "zen", email: "Zen,@email.com", phoneNumber: "090-949599"),
        Person(name: "Min", email: "Min.@email.com", phoneNumber: "090-954999"),
    ]
}

struct PeopleView : View {
    @ObservedObject var viewModel = PersonViewModel()
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            ScrollView {
                ForEach(viewModel.people) { person in
                    HStack {
                        Text(person.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        VStack {
                            Text(person.phoneNumber)
                            Text(person.email)
                        }
                    }
                    .frame(height: 80)
                    .padding()
                    .background( Color.gray.opacity(0.2))
                }
            }
            Menu("menu".uppercased()) {
                Button("Reverse", action: { viewModel.reverseOrder() })
                Button("shuffle", action: { viewModel.shuffleOrder() })
                Button("Remove Last", action: { viewModel.removeLastPerson() })
                Button("Remove First", action: { viewModel.removeFirstPerson() })
                Button("Add Item",action:{viewModel.addPeople()})
            }
            .padding()
        }
    }
}

#Preview{
    PeopleView()
}
