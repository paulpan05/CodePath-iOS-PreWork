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
            .padding(.bottom)
            Text("Currency Type:")
            Picker("Currency Type", selection: $states.moneySelectIndex) {
                Text(self.states.moneySelections[0]).tag(0)
                Text(self.states.moneySelections[1]).tag(1)
                Text(self.states.moneySelections[2]).tag(2)
                Text(self.states.moneySelections[3]).tag(3)
                Text(self.states.moneySelections[4]).tag(4)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom)
            Text("Color Scheme:")
            Picker("Color Scheme", selection: $states.colorSelectIndex) {
                Text(self.states.colorStrings[0]).tag(0)
                Text(self.states.colorStrings[1]).tag(1)
                Text(self.states.colorStrings[2]).tag(2)
                Text(self.states.colorStrings[3]).tag(3)
                Text(self.states.colorStrings[4]).tag(4)
            }
            .pickerStyle(SegmentedPickerStyle())
            Spacer()
        }.padding(.all)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(states: .constant(SharedStates()))
    }
}
