//
//  CounterFeature.swift
//  practice-2025
//
//  Created by Ryota Matsumoto on 4/11/25.
//

import ComposableArchitecture
import SwiftUI



@Reducer
struct CounterFeature: Equatable {
    @ObservableState
    struct State : Equatable {
        var count = 0
        var fact : String?
        var isLoading = false
        var isTimerRunning = false
    }
    
    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
        case factResponse(String)
        case factButtonTapped
        case timerTick
        case toggleTimerButtonTapped
    }
    
    enum CancelID {case timer}
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                state.fact = nil
                return .none
                
            case .factButtonTapped:
                state.fact = nil
                state.isLoading = true
                //Effectを走らせる
                return .run {[count = state.count] send in
                    let(data, _ ) = try await URLSession.shared
                        .data(from: URL(string: "http://numbersapi.com/\(count)")!)
                    let fact = String(decoding: data, as: UTF8.self)
                    await send(.factResponse(fact))
                }
                
            case let .factResponse(fact):
                state.fact = fact
                state.isLoading = false
                return.none
                
            case .incrementButtonTapped:
                state.count += 1
                state.fact = nil
                return .none
                
            case .timerTick:
                state.count += 1
                state.fact = nil
                return .none
                
            case let .toggleTimerButtonTapped:
                state.isTimerRunning.toggle()
                if state.isTimerRunning{
                    return .run { send in
                        while true {
                            try await Task.sleep(for: .seconds(1))
                            await send(.timerTick)
                        }
                    }
                    .cancellable(id: CancelID.timer)
                } else {
                    return .cancel(id: CancelID.timer)
                }
            }
        }
    }
}

struct CounterView : View {
   fileprivate let tcatcaStore: tcaStoreOf<CounterFeature>
    
    var body : some View {
        VStack {
            Text("\(tcaStore.count)")
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
        }
        HStack{
            Button("-"){
                tcaStore.send(.decrementButtonTapped)
            }
            .font(.largeTitle)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
            
            Button("+"){
                tcaStore.send(.incrementButtonTapped)
            }
            .font(.largeTitle)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
            
            Button("Fact"){
                tcaStore.send(.factButtonTapped)
            }
            .font(.largeTitle)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
        }
        if tcaStore.isLoading{
            ProgressView()
        } else if let fact = tcaStore.fact {
            Text(fact)
                .font( .largeTitle)
                .multilineTextAlignment(.center)
                .padding()
        }
        Button(tcaStore.isTimerRunning ? "Stop Timer" : "Start Timer"){
            tcaStore.send(.toggleTimerButtonTapped)
        }
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
    }
}

#Preview{
    CounterView(
        tcaStore: tcaStore(initialState: CounterFeature.State()){
            CounterFeature()
        }
    )
}


//import ComposableArchitecture
//import SwiftUI
//
//@main
//struct practice_2025App: App {
//    static let tcaStore = tcaStore(initialState: CounterFeature.State()){
//        CounterFeature()
//        //これは状態の変化をコンソールで表示してくれるもの
//        //変化がない場合は何も起きない
//            ._printChanges()
//    }
//   var body: some Scene {
//        WindowGroup {
//            CounterView(tcaStore: practice_2025App.tcaStore)
//        }
//    }
//}
