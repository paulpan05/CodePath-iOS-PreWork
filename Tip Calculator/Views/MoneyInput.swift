//
//  MoneyInput.swift
//  Tip Calculator
//
//  Created by Paul Pan on 20/14/1.
//  Copyright © 2020 Paul Pan. All rights reserved.
//

import SwiftUI

struct MoneyInput: View {
    @State private var amount: String = ""
    @State private var selectionIndex: Int = 0
    @State private var tipAmount = ["10%", "15%", "20%"]
    var body: some View {
        VStack {
            Spacer()
            TextField("$", text: $amount).keyboardType(.decimalPad).font(.system(size: 58)).multilineTextAlignment(.trailing)
            Picker("Tip Amount", selection: $selectionIndex) {
                ForEach(0 ..< tipAmount.count) {index in
                    Text(self.tipAmount[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            //Text("\(String(format: "%.2f", Double(amount) ?? 0))")
            Spacer()
        }
        .background(Color.green)
    }
}

struct MoneyInput_Previews: PreviewProvider {
    static var previews: some View {
        MoneyInput()
    }
}
