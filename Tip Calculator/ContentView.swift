//
//  ContentView.swift
//  Tip Calculator
//
//  Created by Paul Pan on 20/14/1.
//  Copyright © 2020 Paul Pan. All rights reserved.
//

import SwiftUI

struct SharedStates {
    public var tipAmounts: [String] = ["10", "15", "20"]
}

struct ContentView: View {
    @State private var sharedStates: SharedStates = SharedStates()
    var body: some View {
        VStack {
            NavigationView {
                MoneyInput(states: $sharedStates)
                    .navigationBarTitle(Text("Tip Calculator"), displayMode: .inline)
                    .navigationBarItems(trailing:
                        NavigationLink(destination: Settings(states: $sharedStates)) {
                            Image("Settings").resizable().frame(width: 30, height: 30)
                        }
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
