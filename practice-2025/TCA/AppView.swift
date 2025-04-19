//
//  AppView.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/14/25.
//
import ComposableArchitecture
import SwiftUI


struct AppView: View {

fileprivate let tcaStore: tcaStoreOf<AppFeature>
  
  var body: some View {
    TabView {
        CounterView(tcaStore: tcaStore.scope(state: \.tab1, action: \.tab1))
        .tabItem {
          Text("Counter 1")
        }
      
        CounterView(tcaStore: tcaStore.scope(state: \.tab2, action: \.tab2))
        .tabItem {
          Text("Counter 2")
        }
    }
  }
}

#Preview{
    AppView(
        tcaStore: tcaStore(initialState: AppFeature.State()){
            AppFeature()
        }
    )
}
