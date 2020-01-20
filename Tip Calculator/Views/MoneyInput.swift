//
//  MoneyInput.swift
//  Tip Calculator
//
//  Created by Paul Pan on 20/14/1.
//  Copyright © 2020 Paul Pan. All rights reserved.
//

import SwiftUI
import Introspect

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct MoneyInput: View {
    @Binding public var states: SharedStates
    @State private var amount: String = ""
    @State private var selectionIndex: Int = 0
    private var calculatedColor: Color {
        var currentColor = states.colors[states.colorSelectIndex]
        currentColor = currentColor.opacity(0.4)
        return currentColor
    }
    private let curDimension: CGFloat = 15
    private let frameHeight: CGFloat = 52
    func calculateTip() -> Double {
        var result = Double(amount) ?? 0
        result = result * (Double(states.tipAmounts[selectionIndex]) ?? 0) / 100
        return result
    }
    func calculateTotal() -> Double {
        var result = Double(amount) ?? 0
        result = result * (100 + (Double(states.tipAmounts[selectionIndex]) ?? 0)) / 100
        return result
    }
    var body: some View {
        VStack {
            VStack{
                TextField(self.states.currencySymbols[self.states.moneySelectIndex], text: $amount)
                    .keyboardType(.decimalPad)
                    .font(.system(size: 78))
                    .multilineTextAlignment(.trailing)
                    .introspectTextField { textfield in
                        textfield.becomeFirstResponder();
                }
                Spacer()
                Picker("Tip Amount", selection: $selectionIndex) {
                    Text((self.states.tipAmounts[0].isEmpty ? "0" : self.states.tipAmounts[0]) + "%").tag(0)
                    Text((self.states.tipAmounts[1].isEmpty ? "0" : self.states.tipAmounts[1]) + "%").tag(1)
                    Text((self.states.tipAmounts[2].isEmpty ? "0" : self.states.tipAmounts[2]) + "%").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.all)
            VStack{
                HStack {
                    Text("+").font(.system(size: 20))
                    Spacer()
                    Text(self.states.currencySymbols[self.states.moneySelectIndex] + String(format: "%.2f", calculateTip())).font(.system(size: 20))
                }
                HStack {
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Spacer()
                    Text(self.states.currencySymbols[self.states.moneySelectIndex] + String(format: "%.2f", calculateTotal())).font(.system(size: 70)).frame(height: frameHeight)
                }
                HStack {
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Spacer()
                    Text(self.states.currencySymbols[self.states.moneySelectIndex] + String(format: "%.2f", calculateTotal() * 2)).font(.system(size: 60)).frame(height: frameHeight)
                }
                HStack {
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Spacer()
                    Text(self.states.currencySymbols[self.states.moneySelectIndex] + String(format: "%.2f", calculateTotal() * 3)).font(.system(size: 50)).frame(height: frameHeight)
                }
                HStack {
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Spacer()
                    Text(self.states.currencySymbols[self.states.moneySelectIndex] + String(format: "%.2f", calculateTotal() * 4)).font(.system(size: 40)).frame(height: frameHeight)
                }
            }
            .padding(.all)
            .background(states.colors[states.colorSelectIndex])
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }.background(calculatedColor)
    }
}

struct MoneyInput_Previews: PreviewProvider {
    static var previews: some View {
        MoneyInput(states: .constant(SharedStates()))
    }
}
