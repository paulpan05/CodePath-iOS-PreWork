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
    private var calculatedColor: Color {
        var currentColor = Color.green
        currentColor = currentColor.opacity(0.4)
        return currentColor
    }
    func calculateTip() -> Double {
        var result = Double(amount) ?? 0
        result = result * (0.1 + Double(selectionIndex) * 0.05)
        return result
    }
    func calculateTotal() -> Double {
        var result = Double(amount) ?? 0
        result = result * (1.1 + Double(selectionIndex) * 0.05)
        return result
    }
    var body: some View {
        VStack {
            VStack{
                Spacer()
                TextField("$", text: $amount).keyboardType(.decimalPad).font(.system(size: 78)).multilineTextAlignment(.trailing)
                Picker("Tip Amount", selection: $selectionIndex) {
                    ForEach(0 ..< tipAmount.count) {index in
                        Text(self.tipAmount[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Spacer()
            }
            .padding(.all)
            .background(calculatedColor)
            VStack{
                HStack {
                    Text("+").font(.system(size: 30))
                    Spacer()
                    Text("\(String(format: "%.2f", calculateTip()))").font(.system(size: 30))
                }
                HStack {
                    Spacer()
                    Text("\(String(format: "%.2f", calculateTotal() * 4))").font(.system(size: 110))
                }
                HStack {
                    Spacer()
                    Text("\(String(format: "%.2f", calculateTotal() * 3))").font(.system(size: 90))
                }
                HStack {
                    Spacer()
                    Text("\(String(format: "%.2f", calculateTotal() * 2))").font(.system(size: 70))
                }
                HStack {
                    Spacer()
                    Text("\(String(format: "%.2f", calculateTotal()))").font(.system(size: 50))
                }
            }
            .background(Color.green)
        }
    }
}

struct MoneyInput_Previews: PreviewProvider {
    static var previews: some View {
        MoneyInput()
    }
}
