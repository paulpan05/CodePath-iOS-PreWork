//
//  ContentView.swift
//  Tip Calculator
//
//  Created by Paul Pan on 20/14/1.
//  Copyright © 2020 Paul Pan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                MoneyInput()
                    .navigationBarTitle(Text("Tip Calculator"), displayMode: .inline)
                    .navigationBarItems(trailing:
                        NavigationLink(destination: Settings()) {
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
