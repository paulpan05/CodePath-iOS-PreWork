//
//  Settings.swift
//  Tip Calculator
//
//  Created by Paul Pan on 20/15/1.
//  Copyright © 2020 Paul Pan. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @Binding public var states: SharedStates
    private let cornerRadius: CGFloat = 5
    private let frameWidth: CGFloat = 60
    var body: some View {
        VStack {
            Text("Tip amount:")
            HStack{
                Text("Choice 1:")
                Spacer()
                TextField("", text: $states.tipAmounts[0]).background(Color.gray).frame(width: frameWidth).keyboardType(.numberPad).multilineTextAlignment(.center).cornerRadius(cornerRadius)
                Text("%")
            }
            HStack{
                Text("Choice 2:")
                Spacer()
                TextField("", text: $states.tipAmounts[1]).background(Color.gray).frame(width: frameWidth).keyboardType(.numberPad).multilineTextAlignment(.center).cornerRadius(cornerRadius)
                Text("%")
            }
            HStack{
                Text("Choice 3:")
                Spacer()
                TextField("", text: $states.tipAmounts[2]).background(Color.gray).frame(width: frameWidth).keyboardType(.numberPad).multilineTextAlignment(.center).cornerRadius(cornerRadius)
                Text("%")
            }
            Spacer()
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(states: .constant(SharedStates()))
    }
}
